import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:university_chatbot/features/chat_bot_ui/data/repo/chatbot_repo_implementation.dart';

class ChatbotController extends GetxController {
  final TextEditingController inputController = TextEditingController();
  var messages = <Map<String, dynamic>>[].obs;

  final ChatbotRepoImpl chatbotRepo;

  // Initialisation du repo via GetX
  ChatbotController(this.chatbotRepo);

  // Méthode pour envoyer un message
  void sendMessage() async {
    final text = inputController.text.trim();
    if (text.isNotEmpty) {
      messages
          .add({"message": text, "isBot": false}); // Message de l'utilisateur
      inputController.clear();

      // Appel à l'API pour obtenir la réponse du chatbot
      final response = await chatbotRepo.getChatbotResponse(text);
      response.fold(
        (failure) {
          messages
              .add({"message": "Sorry, something went wrong.", "isBot": true});
        },
        (botResponse) {
          messages.add({"message": botResponse.responseMessage, "isBot": true});
        },
      );
    }
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
