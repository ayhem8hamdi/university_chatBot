import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = 'https://48e4-197-7-192-134.ngrok-free.app/';

  ApiService(this.dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    print(response.data);
    return response.data;
  }
}
