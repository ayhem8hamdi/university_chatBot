import 'package:flutter/material.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_styles.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isBot;

  const ChatBubble({super.key, required this.message, required this.isBot});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isBot ? AppColors.secondaryColor : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message,
          style: AppStyles.style16Regular(
            context,
            color: isBot ? AppColors.textColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
