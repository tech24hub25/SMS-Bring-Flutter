import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sms_bring_flutter/core/network_info/network_info.dart';

@LazySingleton()
class InternetConnectionInterceptor extends Interceptor {
  final NetworkInfo networkInfo;

  InternetConnectionInterceptor({required this.networkInfo});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      handler.next(options);
    } else {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'No internet connection. Please check your connection.',
          type: DioExceptionType.cancel,
        ),
      );
    }
  }
}
