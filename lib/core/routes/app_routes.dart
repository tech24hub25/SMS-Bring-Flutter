import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/features/main_feature/presentation/views/main_responsive_view.dart';
import 'package:sms_bring_flutter/features/splash_feature/presentation/views/splash_responsive_view.dart';

class AppRoutes {
  static const splashRoute = "/splashRoute";
  static const mainRoute = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashRoute:
        return GetPageRoute(
          routeName: AppRoutes.splashRoute,
          page: () => const SplashResponsiveView(),
        );
      case AppRoutes.mainRoute:
        return GetPageRoute(
          routeName: AppRoutes.mainRoute,
          page: () => const MainResponsiveView(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('View not found'),
          ),
        );
      },
    );
  }
}
