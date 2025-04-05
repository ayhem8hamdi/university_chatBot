import 'package:dartz/dartz.dart';
import 'package:university_chatbot/core/utils/failure/failure.dart';
import 'package:university_chatbot/features/chat_bot_ui/data/model/chatbotmodel.dart';

abstract class ChatbotRepo {
  Future<Either<Failure, ChatbotModel>> getChatbotResponse(String userInput);
}
