import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopMainView extends StatelessWidget {
  const DesktopMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('desktop'.tr),
              Text('mainView'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
