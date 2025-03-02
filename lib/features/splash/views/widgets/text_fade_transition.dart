import 'package:flutter/material.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_styles.dart';

class TextFadeTransition extends StatelessWidget {
  const TextFadeTransition({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: fadeAnimation,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Ask...Learn...Thrive",
              style: AppStyles.style18SemiBold(context,
                  color: AppColors.primaryColor.withOpacity(0.8)),
            ),
          ),
        ),
      ),
    );
  }
}
