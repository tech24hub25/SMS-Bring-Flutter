import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_architecture_template/core/extensions/build_context_extension.dart';

class CustomResponsive extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  const CustomResponsive({
    super.key,
    required this.desktop,
    required this.mobile,
    required this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isThisNarrowTablet) {
      return context.responsiveValue(
        mobile: mobile,
        tablet: mobile,
        desktop: desktop,
      );
    }
    return context.responsiveValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}
