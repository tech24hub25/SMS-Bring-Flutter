import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_shadow_container.dart';
import 'package:sms_bring_flutter/features/auth_feature/login/presentation/views/widgets/login_form_section.dart';
import 'package:sms_bring_flutter/features/auth_feature/widgets/custom_background_image.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class DesktopLoginView extends StatefulWidget {
  const DesktopLoginView({super.key});

  @override
  State<DesktopLoginView> createState() => _DesktopLoginViewState();
}

class _DesktopLoginViewState extends State<DesktopLoginView> {
  bool isRememberMe = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundImage(
        image: const AssetImage(Assets.imagesBackgroundImage),
        child: Center(
          child: CustomShadowContainer(
            width: 750,
            height: 850,
            padding: const EdgeInsets.symmetric(
              horizontal: 124,
              vertical: 48,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset(
                    Assets.svgSmsBringLogo,
                    width: 125,
                    height: 125,
                  ),
                  Text(
                    'login'.tr,
                    style: Styles.displayMedium.copyWith(
                      color: AppColors.skyBlue,
                    ),
                  ),

                  /// form login
                  const LoginFormSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
