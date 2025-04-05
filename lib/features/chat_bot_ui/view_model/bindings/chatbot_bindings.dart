import 'package:get/get.dart';
import 'package:university_chatbot/features/chat_bot_ui/data/repo/chatbot_repo_implementation.dart';
import 'package:university_chatbot/core/utils/api_service.dart';
import 'package:university_chatbot/features/chat_bot_ui/view_model/controller/chatbot_controller.dart';

class ChatbotBinding extends Bindings {
  @override
  void dependencies() {
    // Injections des dépendances
    Get.lazyPut<ApiService>(() => ApiService(Get.find())); // ApiService
    Get.lazyPut<ChatbotRepoImpl>(
        () => ChatbotRepoImpl(Get.find())); // ChatbotRepoImpl
    Get.lazyPut<ChatbotController>(
        () => ChatbotController(Get.find())); // ChatbotController
  }
}
