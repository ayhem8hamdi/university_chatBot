import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;

  Failure(this.errorMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMsg);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection time out Error');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send time out Error');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive time out Error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioError.response!.statusCode!, dioError);
      case DioExceptionType.cancel:
        return ServerFailure('Request was canceled , Please Try Agian later');
      case DioExceptionType.connectionError:
        return ServerFailure('Unstable Connection');
      case DioExceptionType.unknown:
        return ServerFailure(dioError.message!.contains('SocketException')
            ? 'No Internet Connection'
            : 'Unexpected Error, please try later');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certeficate Erroe');
      default:
        return ServerFailure('Opps there was an Error');
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, DioException response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response.message.toString());
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try again later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else {
      return ServerFailure('Oops there was an error , Please Try again Later');
    }
  }
}
