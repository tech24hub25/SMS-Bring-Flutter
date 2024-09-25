import 'package:injectable/injectable.dart';
import 'app_environment.dart';

abstract class Configuration {
  String get name;

  String get getBaseUrl;
}

@LazySingleton(as: Configuration, env: [AppEnvironment.dev])
class DevConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://dev-domain.com/api/';

  @override
  String get name => 'development';
}

@LazySingleton(as: Configuration, env: [AppEnvironment.staging])
class StagingConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://stg-domain.com/api/';

  @override
  String get name => 'staging';
}

@LazySingleton(as: Configuration, env: [AppEnvironment.prod])
class ProductionConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://client-domain.com/api/';

  @override
  String get name => 'production';
}
