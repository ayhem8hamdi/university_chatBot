import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:university_chatbot/core/utils/failure/failure.dart';
import 'package:university_chatbot/core/utils/api_service.dart';
import 'package:university_chatbot/features/chat_bot_ui/data/model/chatbotmodel.dart';

abstract class ChatbotRepo {
  Future<Either<Failure, ChatbotModel>> getChatbotResponse(String userInput);
}

class ChatbotRepoImpl implements ChatbotRepo {
  final ApiService apiService;

  ChatbotRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ChatbotModel>> getChatbotResponse(
      String userInput) async {
    try {
      final response = await apiService.post(
        endPoint: 'generate',
        data: {
          'prompt': userInput,
          'max_new_tokens': 256,
          'temperature': 0.7,
          'top_p': 0.9,
          'repetition_penalty': 1.15,
        },
      );

      final chatbotModel = ChatbotModel.fromJson(response);
      return Right(chatbotModel);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }
}
