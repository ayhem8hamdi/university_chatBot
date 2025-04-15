import 'package:flutter/material.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/widgets/animated-typing_dots.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width to calculate the max bubble width (88%)
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = screenWidth * 0.88;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: const AnimatedTypingDots(
          dotsColor: Colors.grey,
          dotSize: 8,
          growSize: 8,
          spacing: 4,
        ),
      ),
    );
  }
}
