import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_styles.dart';
import 'package:university_chatbot/features/chat_bot_ui/view_model/controller/chatbot_controller.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final chatbotController = Get.find<ChatbotController>();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Zone de texte pour l'input
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

          // Bouton d'envoi
          FloatingActionButton(
            onPressed: () {
              chatbotController.sendMessage(); // Envoie du message
            },
            backgroundColor: AppColors.primaryColor,
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
