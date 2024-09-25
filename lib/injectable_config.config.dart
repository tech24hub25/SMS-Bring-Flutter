// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:mvvm_architecture_template/core/api/dio_client.dart' as _i527;
import 'package:mvvm_architecture_template/core/api/dio_client_impl.dart'
    as _i342;
import 'package:mvvm_architecture_template/core/configs/configuration.dart'
    as _i1051;
import 'package:mvvm_architecture_template/core/interceptors/internet_connection_interceptor.dart'
    as _i698;
import 'package:mvvm_architecture_template/core/interceptors/logging_interceptor.dart'
    as _i514;
import 'package:mvvm_architecture_template/core/interceptors/token_interceptor.dart'
    as _i339;
import 'package:mvvm_architecture_template/core/network_info/network_info.dart'
    as _i85;
import 'package:mvvm_architecture_template/injectable_modules.dart' as _i947;

const String _staging = 'staging';
const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final utilsModule = _$UtilsModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dioInstance);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => networkModule.connectionChecker);
    gh.lazySingleton<_i361.CancelToken>(() => networkModule.compute());
    gh.lazySingleton<_i792.GetStorage>(() => utilsModule.getStorage);
    gh.lazySingleton<_i514.LoggingInterceptor>(
        () => _i514.LoggingInterceptor());
    gh.lazySingleton<_i1051.Configuration>(
      () => _i1051.StagingConfiguration(),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i339.TokenInterceptor>(
        () => _i339.TokenInterceptor(getStorage: gh<_i792.GetStorage>()));
    gh.lazySingleton<_i85.NetworkInfo>(() => _i85.NetworkInfoImpl(
        internetConnectionChecker: gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i1051.Configuration>(
      () => _i1051.DevConfiguration(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i1051.Configuration>(
      () => _i1051.ProductionConfiguration(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i527.IDioClient>(
        () => _i342.DioClient(client: gh<_i361.Dio>()));
    gh.lazySingleton<_i698.InternetConnectionInterceptor>(() =>
        _i698.InternetConnectionInterceptor(
            networkInfo: gh<_i85.NetworkInfo>()));
    return this;
  }
}

class _$NetworkModule extends _i947.NetworkModule {}

class _$UtilsModule extends _i947.UtilsModule {}
