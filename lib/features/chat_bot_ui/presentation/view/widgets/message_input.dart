import 'package:flutter/material.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_styles.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;

  const MessageInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style:
                  AppStyles.style16Regular(context, color: AppColors.textColor),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Type a message...",
                hintStyle: AppStyles.style16Regular(context,
                    color: AppColors.gray3Color),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.gray2Color),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              // Handle send message logic
              controller.clear();
            },
            backgroundColor: AppColors.primaryColor,
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
