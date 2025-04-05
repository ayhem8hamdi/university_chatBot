import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_chatbot/core/utils/app_colors.dart';
import 'package:university_chatbot/core/utils/app_styles.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/widgets/chat_messages.dart';
import 'package:university_chatbot/features/chat_bot_ui/presentation/view/widgets/message_input.dart';
import 'package:university_chatbot/features/chat_bot_ui/view_model/controller/chatbot_controller.dart';

class ChatbotUi extends StatelessWidget {
  ChatbotUi({super.key});

  final ChatbotController controller = Get.find();

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
          MessageInput(controller: controller.inputController),
        ],
      ),
    );
  }
}
