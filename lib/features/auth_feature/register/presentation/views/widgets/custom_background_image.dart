import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesBackgroundImage),
          fit: BoxFit.cover,
          opacity: .22,
        ),
      ),
      child: child,
    );
  }
}
