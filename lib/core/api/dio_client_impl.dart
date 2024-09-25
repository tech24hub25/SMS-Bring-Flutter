import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sms_bring_flutter/core/api/dio_client.dart';
import 'package:sms_bring_flutter/core/api/headers_constants.dart';
import 'package:sms_bring_flutter/core/configs/configuration.dart';
import 'package:sms_bring_flutter/core/interceptors/internet_connection_interceptor.dart';
import 'package:sms_bring_flutter/core/interceptors/logging_interceptor.dart';
import 'package:sms_bring_flutter/core/interceptors/token_interceptor.dart';
import 'package:sms_bring_flutter/injectable_config.dart';

@LazySingleton(as: IDioClient)
class DioClient implements IDioClient {
  final Dio client;
  late Map<String, String> _headers;

  DioClient({required this.client}) {
    client.options
      ..sendTimeout = const Duration(milliseconds: 60000)
      ..connectTimeout = const Duration(milliseconds: 60000)
      ..receiveTimeout = const Duration(milliseconds: 60000)
      ..baseUrl = getIt<Configuration>().getBaseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = true;

    client.interceptors.add(getIt<InternetConnectionInterceptor>());
    client.interceptors.add(getIt<TokenInterceptor>());
    if (kDebugMode) {
      client.interceptors.add(getIt<LoggingInterceptor>());
    }
  }

  void setHeaders() {
    _headers = {
      HeadersConstants.accept: HeadersConstants.applicationJson,
      HeadersConstants.contentType: HeadersConstants.applicationJson,
      HeadersConstants.accessControlOrigin: HeadersConstants.allow,
      HeadersConstants.accessControlHeader: HeadersConstants.allow
    };
  }

  @override
  Future<dynamic> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    setHeaders();
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters ?? {},
        cancelToken: cancelToken,
        options: Options(
          headers: _headers,
          contentType: HeadersConstants.jsonContentType,
        ).copyWith(),
      );
      return _handleOnlineResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> delete<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    setHeaders();
    try {
      final response = await client.delete(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: _headers,
          contentType: HeadersConstants.jsonContentType,
        ),
      );
      return _handleOnlineResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> patch<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    setHeaders();
    try {
      final response = await client.patch(
        path,
        queryParameters: queryParameters ?? {},
        data: body,
        options: Options(
            headers: _headers, contentType: HeadersConstants.jsonContentType),
      );
      return _handleOnlineResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post<T>(
    String path, {
    Map<String, dynamic>? body,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    setHeaders();
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters ?? {},
        options: Options(
            headers: _headers,
            contentType:
                formData == null ? HeadersConstants.jsonContentType : null),
        data: formData ?? body,
      );
      return _handleOnlineResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> put<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    setHeaders();
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters ?? {},
        data: body,
        options: Options(
          headers: _headers,
          contentType: HeadersConstants.jsonContentType,
        ),
      );
      return _handleOnlineResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }
}

dynamic _handleOnlineResponseAsJson(Response response) {
  final responseJson = jsonDecode(response.data.toString());
  return responseJson;
}
