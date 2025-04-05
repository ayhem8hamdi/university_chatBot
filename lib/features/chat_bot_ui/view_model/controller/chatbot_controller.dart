import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatbotController extends GetxController {
  final TextEditingController inputController = TextEditingController();
  var messages = <Map<String, dynamic>>[].obs;

  void sendMessage() {
    final text = inputController.text.trim();
    if (text.isNotEmpty) {
      messages.add({"message": text, "isBot": false});
      inputController.clear();

      // Simulate bot response
      Future.delayed(const Duration(milliseconds: 500), () {
        messages.add({"message": "I received: $text", "isBot": true});
      });
    }
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
