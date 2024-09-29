import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/features/splash_feature/presentation/views/widgets/splash_view_body.dart';

class DesktopSplashView extends StatelessWidget {
  const DesktopSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SplashViewBody(),
      ),
    );
  }
}
