class ChatbotModel {
  final String responseMessage;

  ChatbotModel({
    required this.responseMessage,
  });

  factory ChatbotModel.fromJson(Map<String, dynamic> json) {
    return ChatbotModel(
      responseMessage: json['responseMessage'] ?? '',
    );
  }
}
