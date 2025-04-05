// chat_messages.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/widgets/chat_bubble.dart';
import 'package:university_chatbot/features/chat_bot_ui/view_model/controller/chatbot_controller.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatbotController>();

    return Obx(() => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            final msg = controller.messages[index];
            return ChatBubble(
              message: msg['message'],
              isBot: msg['isBot'],
            );
          },
        ));
  }
}
