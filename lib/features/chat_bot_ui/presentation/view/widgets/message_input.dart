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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -1),
            blurRadius: 3,
          ),
        ],
      ),
      // Remove bottom padding to avoid white space
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        // Add padding only if keyboard is not visible
        bottom: MediaQuery.of(context).viewInsets.bottom > 0
            ? 12
            : MediaQuery.of(context).padding.bottom + 12,
      ),
      child: Row(
        children: [
          // Text input field
          Expanded(
            child: TextFormField(
              controller: controller,
              style:
                  AppStyles.style16Regular(context, color: AppColors.textColor),
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (_) {
                if (!chatbotController.isLoading.value) {
                  chatbotController.sendMessage();
                }
              },
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.grey[100],
                hintText: "Type a message...",
                hintStyle: AppStyles.style16Regular(
                  context,
                  color: AppColors.gray3Color,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 1),
                ),
              ),
              // Disable the input while loading
              enabled: !chatbotController.isLoading.value,
            ),
          ),
          const SizedBox(width: 12),

          // Send button with disabled state
          Obx(() => Material(
                color: chatbotController.isLoading.value
                    ? AppColors.primaryColor.withOpacity(0.5) // Disabled color
                    : AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: chatbotController.isLoading.value
                      ? null // Disable tap when loading
                      : () => chatbotController.sendMessage(),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
