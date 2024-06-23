import 'package:dio/dio.dart';
import 'api_response.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio
      ..options.baseUrl = 'https://api.tvmaze.com'
      ..options.connectTimeout = const Duration(milliseconds: 5000)
      ..options.receiveTimeout = const Duration(milliseconds: 3000);
  }

  Future<ApiResponse> get(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(path, queryParameters: params);
      return ApiResponse.success(response.data);
    } catch (error) {
      return ApiResponse.failure(error as Exception?);
    }
  }
}
