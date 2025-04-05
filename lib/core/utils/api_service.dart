import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = 'APIURL';

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
