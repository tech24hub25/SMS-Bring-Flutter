import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/responsive/custom_responsive.dart';
import 'package:sms_bring_flutter/features/main_feature/presentation/views/desktop/desktop_main_view.dart';
import 'package:sms_bring_flutter/features/main_feature/presentation/views/mobile/mobile_main_view.dart';

class MainResponsiveView extends StatelessWidget {
  const MainResponsiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomResponsive(
      desktop: DesktopMainView(),
      mobile: MobileMainView(),
      tablet: MobileMainView(),
    );
  }
}
