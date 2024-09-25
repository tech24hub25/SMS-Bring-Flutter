import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileSplashView extends StatelessWidget {
  const MobileSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('mobile'.tr),
              Text('splashView'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
