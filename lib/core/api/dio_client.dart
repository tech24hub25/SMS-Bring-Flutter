import 'package:dio/dio.dart';

abstract class IDioClient {
  Future<dynamic> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  });

  Future<dynamic> post<T>(
    String path, {
    Map<String, dynamic>? body,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<dynamic> put<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<dynamic> patch<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<dynamic> delete<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
