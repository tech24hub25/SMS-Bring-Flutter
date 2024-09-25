import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopSplashView extends StatelessWidget {
  const DesktopSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('desktop'.tr),
              Text('splashView'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
