import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:university_chatbot/features/chat_bot_ui/data/repo/chatbot_repo_implementation.dart';

class ChatbotController extends GetxController {
  final TextEditingController inputController = TextEditingController();
  var messages = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  final ChatbotRepoImpl chatbotRepo;

  ChatbotController(this.chatbotRepo);

  // Prevent navigation back to onboarding
  void preventBackNavigation() {
    // This will override the back button behavior on Android
    Get.rootDelegate.popHistory();
  }

  void sendMessage() async {
    final text = inputController.text.trim();
    if (text.isNotEmpty && !isLoading.value) {
      // Add user's message
      messages.add({"message": text, "isBot": false});
      inputController.clear();

      // Indicate loading (we'll show typing indicator using isLoading value)
      isLoading.value = true;

      try {
        final response = await chatbotRepo.getChatbotResponse(text);

        // Add bot's response after a short delay for a more natural feel
        await Future.delayed(const Duration(milliseconds: 500));

        // Handle response or error
        response.fold(
          (failure) {
            messages.add({
              "message": "Sorry, something went wrong. Please try again.",
              "isBot": true
            });
          },
          (botResponse) {
            messages.add({"message": botResponse.generatedText, "isBot": true});
          },
        );
      } catch (e) {
        // Handle any unexpected errors
        messages.add({
          "message": "Sorry, something went wrong. Please try again.",
          "isBot": true
        });
      } finally {
        // Always ensure loading state is reset
        isLoading.value = false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Add a welcome message when the chat starts
    Future.delayed(const Duration(milliseconds: 300), () {
      messages
          .add({"message": "Hello! How can I help you today?", "isBot": true});
    });
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
