import 'package:flutter/material.dart';
import 'package:mvvm_architecture_template/core/responsive/custom_responsive.dart';
import 'package:mvvm_architecture_template/features/splash_feature/presentation/views/desktop/desktop_splash_view.dart';
import 'package:mvvm_architecture_template/features/splash_feature/presentation/views/mobile/mobile_splash_view.dart';

class SplashResponsiveView extends StatelessWidget {
  const SplashResponsiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomResponsive(
      desktop: DesktopSplashView(),
      mobile: MobileSplashView(),
      tablet: MobileSplashView(),
    );
  }
}
