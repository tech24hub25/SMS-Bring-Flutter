import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/extensions/build_context_extension.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_shadow_container.dart';
import 'package:sms_bring_flutter/features/auth_feature/login/presentation/views/widgets/login_form_section.dart';
import 'package:sms_bring_flutter/features/auth_feature/widgets/custom_background_image.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class MobileLoginView extends StatefulWidget {
  const MobileLoginView({super.key});

  @override
  State<MobileLoginView> createState() => _MobileLoginViewState();
}

class _MobileLoginViewState extends State<MobileLoginView> {
  bool isRememberMe = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundImage(
        image: const AssetImage(Assets.imagesBackgroundImage),
        child: Center(
          child: CustomShadowContainer(
            width: context.dynamicWidth(0.9),
            height: context.dynamicHeight(0.8),
            maxWidth: 600,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
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
