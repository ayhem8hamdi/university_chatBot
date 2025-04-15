class ChatbotModel {
  final String generatedText;

  ChatbotModel({required this.generatedText});

  factory ChatbotModel.fromJson(Map<String, dynamic> json) {
    return ChatbotModel(
      generatedText: json['generated_text'] ?? '',
    );
  }
}
