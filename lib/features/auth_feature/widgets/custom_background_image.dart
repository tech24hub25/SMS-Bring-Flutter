import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({
    super.key,
    required this.child,
    required this.image,
    this.width,
    this.height,
  });
  final ImageProvider<Object> image;
  final Widget child;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? context.width,
        height: height ?? context.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
            opacity: .22,
          ),
        ),
        child: child,
      ),
    );
  }
}
