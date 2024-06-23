import 'package:dio/dio.dart';
import '../errors/exceptions.dart';
import 'api_response.dart';
import 'network_info.dart';

class ApiClient {
  final Dio _dio;
  final NetworkInfo _networkInfo;

  ApiClient(this._dio, this._networkInfo) {
    _dio
      ..options.baseUrl = 'https://api.tvmaze.com'
      ..options.connectTimeout = const Duration(milliseconds: 5000)
      ..options.receiveTimeout = const Duration(milliseconds: 3000);
  }

  Future<ApiResponse<T>> request<T>(
      {required String path,
      required T Function(dynamic) fromJson,
      Map<String, dynamic>? params}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dio.get(path, queryParameters: params);
        return ApiResponse.success(fromJson(response.data));
      } catch (error) {
        return ApiResponse.failure(ServerException());
      }
    } else {
      return ApiResponse.failure(NoConnectionException());
    }
  }
}
