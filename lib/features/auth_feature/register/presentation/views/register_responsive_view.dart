import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/responsive/custom_responsive.dart';
import 'package:sms_bring_flutter/features/auth_feature/register/presentation/views/desktop/desktop_register_view.dart';
import 'package:sms_bring_flutter/features/auth_feature/register/presentation/views/mobile/mobile_register_view.dart';

class RegisterResponsiveView extends StatelessWidget {
  const RegisterResponsiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomResponsive(
      desktop: DesktopRegisterView(),
      mobile: MobileRegisterView(),
      tablet: MobileRegisterView(),
    );
  }
}
