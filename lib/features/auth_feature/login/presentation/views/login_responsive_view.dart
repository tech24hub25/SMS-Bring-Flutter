import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/responsive/custom_responsive.dart';
import 'package:sms_bring_flutter/features/auth_feature/login/presentation/views/desktop/desktop_login_view.dart';
import 'package:sms_bring_flutter/features/auth_feature/login/presentation/views/mobile/mobile_login_view.dart';

class LoginResponsiveView extends StatelessWidget {
  const LoginResponsiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomResponsive(
      desktop: DesktopLoginView(),
      mobile: MobileLoginView(),
      tablet: MobileLoginView(),
    );
  }
}
