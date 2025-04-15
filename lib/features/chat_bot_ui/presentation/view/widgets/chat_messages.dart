import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/widgets/chat_bubble.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/widgets/typing_indicator.dart';
import 'package:university_chatbot/features/chat_bot_ui/view_model/controller/chatbot_controller.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatbotController>();
    // Initialize ScrollController in the build method to avoid leaks
    final scrollController = ScrollController();

    // Add listener to scroll to bottom when messages change
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.messages.listen((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    });

    return Obx(() {
      // Calculate length with conditional typing indicator
      final itemCount =
          controller.messages.length + (controller.isLoading.value ? 1 : 0);

      return ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          // Show typing indicator as the last item when loading
          if (controller.isLoading.value &&
              index == controller.messages.length) {
            return const TypingIndicator();
          }

          // Skip any "typing..." message
          final msg = controller.messages[index];
          if (msg['message'] == "typing...") {
            return const SizedBox.shrink();
          }

          return ChatBubble(
            message: msg['message'],
            isBot: msg['isBot'],
          );
        },
      );
    });
  }
}
