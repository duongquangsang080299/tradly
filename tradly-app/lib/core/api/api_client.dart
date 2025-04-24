import 'package:dio/dio.dart';
import 'package:tradly_app/core/api/failure.dart';
import 'package:tradly_app/core/env/env.dart';

class TradlyApiClient {
  final Dio _dio;

  TradlyApiClient({
    required String baseUrl,
  }) : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
        ));

  Future<Response> _request(
    String method, {
    required String apiKey,
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.request(
        apiKey,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: {
            'apikey': apiKey = Env.supabaseKey,
          },
        ),
      );
      return response;
    } catch (e) {
      throw ErrorMappingHandler.apiErrorMappingHandler(e);
    }
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) =>
      _request(
        'GET',
        apiKey: endpoint,
        queryParams: queryParams,
      );

  Future<Response> post(String endpoint, {dynamic data}) => _request(
        'POST',
        apiKey: endpoint,
        data: data,
      );

  Future<Response> patch(String endpoint, {dynamic data}) => _request(
        'PATCH',
        apiKey: endpoint,
        data: data,
      );

  Future<Response> delete(String endpoint, {dynamic data}) => _request(
        'DELETE',
        apiKey: endpoint,
        data: data,
      );
}
