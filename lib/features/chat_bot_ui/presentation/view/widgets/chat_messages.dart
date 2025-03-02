import 'package:flutter/material.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/widgets/chat_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ChatBubble(message: "Hello! How can I assist you today?", isBot: true),
        ChatBubble(message: "I need help with my account.", isBot: false),
        ChatBubble(message: "Sure! What issue are you facing?", isBot: true),
      ],
    );
  }
}
