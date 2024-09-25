import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sms_bring_flutter/core/constants/storage_keys.dart';

@LazySingleton()
class TokenInterceptor extends Interceptor {
  final GetStorage getStorage;
  TokenInterceptor({required this.getStorage});

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // if (ii<AuthService>().isLoggedIn && options.extra.keys.contains('no_token') == false) {
    // final token = await ii<AuthService>().getToken();
    String token = getStorage.read(StorageKeys.token);
    options.headers['Authorization'] = token;
    // }
    // ii<Dio>().options.extra.clear();
    super.onRequest(options, handler);
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // If the error is 401 Unauthorized, log out the user
    // if (err.response?.statusCode == 401) {
    //   if (Get.currentRoute != AuthorizationRoutes.loginScreen) {
    //     ii<LoginLogic>().logout();
    //   }
    // }
    super.onError(err, handler);
  }
}
