import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/extensions/build_context_extension.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_shadow_container.dart';
import 'package:sms_bring_flutter/features/auth_feature/widgets/custom_background_image.dart';
import 'package:sms_bring_flutter/features/auth_feature/register/presentation/views/widgets/register_form_section.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class MobileRegisterView extends StatelessWidget {
  const MobileRegisterView({super.key});

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
                    'createAnAccount'.tr,
                    style: Styles.displayMedium.copyWith(
                      color: AppColors.skyBlue,
                    ),
                  ),

                  /// form register
                  const RegisterFormSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
