import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    // Set system UI overlay style to ensure consistent appearance
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      // Remove back button by using custom AppBar
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false, // Remove back button
        title: Text(
          'Chatbot',
          style: AppStyles.style20SemiBold(context, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0, // Remove shadow for modern look
      ),
      // Use resizeToAvoidBottomInset to prevent keyboard from pushing content up
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        // Set bottom to false to use the full screen height including bottom area
        bottom: false,
        child: Column(
          children: [
            // Chat messages with Expanded to take available space
            const Expanded(
              child: ChatMessages(),
            ),

            // Input message without padding that can cause white space
            MessageInput(controller: controller.inputController),
          ],
        ),
      ),
    );
  }
}
