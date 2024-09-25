import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  CancelToken compute() => CancelToken();

  @lazySingleton
  Dio get dioInstance => Dio();

  @lazySingleton
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker();
}

@module
abstract class UtilsModule {
  @lazySingleton
  GetStorage get getStorage => GetStorage();
}
