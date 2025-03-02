import 'package:flutter/material.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_styles.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/widgets/chat_messages.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/widgets/message_input.dart';

class ChatbotUi extends StatelessWidget {
  ChatbotUi({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Chatbot',
          style: AppStyles.style20SemiBold(context, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Expanded(child: ChatMessages()),
          MessageInput(controller: _controller),
        ],
      ),
    );
  }
}
