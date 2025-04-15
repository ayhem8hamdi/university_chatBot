import 'package:flutter/material.dart';

class AnimatedTypingDots extends StatefulWidget {
  final int dotsCount;
  final Color dotsColor;
  final double dotSize;
  final double growSize;
  final double spacing;
  final Duration animationDuration;
  final Widget Function(BuildContext, double)? dotBuilder;

  const AnimatedTypingDots({
    super.key,
    this.dotsCount = 3,
    this.dotsColor = Colors.grey,
    this.dotSize = 8,
    this.growSize = 8,
    this.spacing = 4,
    this.animationDuration = const Duration(milliseconds: 1200),
    this.dotBuilder,
  });

  @override
  State<AnimatedTypingDots> createState() => _AnimatedTypingDotsState();
}

class _AnimatedTypingDotsState extends State<AnimatedTypingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat();

    // Create animations with different delays for each dot
    _animations = List.generate(
      widget.dotsCount,
      (index) => Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * (0.8 / widget.dotsCount),
            0.2 + index * (0.8 / widget.dotsCount),
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.dotSize +
          widget.growSize +
          4, // Explicit height to avoid layout issues
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          widget.dotsCount,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
            child: AnimatedBuilder(
              animation: _animations[index],
              builder: (context, child) {
                // Use custom builder if provided, otherwise use default
                if (widget.dotBuilder != null) {
                  return widget.dotBuilder!(context, _animations[index].value);
                }

                // Default dot appearance
                return Container(
                  width: widget.dotSize +
                      (_animations[index].value * widget.growSize),
                  height: widget.dotSize +
                      (_animations[index].value * widget.growSize),
                  decoration: BoxDecoration(
                    color: widget.dotsColor
                        .withOpacity(0.6 + (_animations[index].value * 0.4)),
                    borderRadius: BorderRadius.circular(
                        (widget.dotSize + widget.growSize) / 2),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
