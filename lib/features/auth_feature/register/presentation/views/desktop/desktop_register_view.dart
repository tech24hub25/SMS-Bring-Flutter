import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/utils.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/extensions/build_context_extension.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_circular_check_box.dart';
import 'package:sms_bring_flutter/core/widgets/custom_shadow_container.dart';
import 'package:sms_bring_flutter/core/widgets/custom_text_field.dart';
import 'package:sms_bring_flutter/core/widgets/primary_linear_gradient_button.dart';
import 'package:sms_bring_flutter/features/auth_feature/register/presentation/views/widgets/custom_background_image.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class DesktopRegisterView extends StatefulWidget {
  const DesktopRegisterView({super.key});

  @override
  State<DesktopRegisterView> createState() => _DesktopRegisterViewState();
}

class _DesktopRegisterViewState extends State<DesktopRegisterView> {
  bool isAgreeTermsAndConditions = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundImage(
        child: Center(
          child: CustomShadowContainer(
            width: 760,
            height: context.dynamicHeight(0.9),
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
                CustomTextField(
                  title: 'fullName'.tr,
                  hint: 'enterYourFullName'.tr,
                  prefixIcon: FontAwesomeIcons.userLarge,
                ),
                CustomTextField(
                  title: 'emailAddress'.tr,
                  hint: 'enterYourEmail'.tr,
                  prefixIcon: FontAwesomeIcons.solidEnvelope,
                ),
                CustomTextField(
                  title: 'password'.tr,
                  hint: 'enterYourPassword'.tr,
                  prefixIcon: FontAwesomeIcons.lock,
                  suffixIcon: Icons.visibility,
                  obscureText: true,
                ),
                CustomTextField(
                  title: 'confirmPassword'.tr,
                  hint: 'confirmYourPassword'.tr,
                  prefixIcon: FontAwesomeIcons.lock,
                  suffixIcon: Icons.visibility,
                  obscureText: true,
                ),
                Row(
                  children: [
                    CustomCircularCheckBox(
                      isChecked: isAgreeTermsAndConditions,
                      onChecked: (check) {
                        isAgreeTermsAndConditions = check;
                        setState(() {});
                      },
                    ),
                    Text('iAgreeWithTermsAndConditions'.tr),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                PrimaryLinearGradientButton(
                  text: 'createAnAccount'.tr,
                  width: context.width,
                  height: 50,
                  borderWidth: 6,
                  borderRadius: BorderRadius.circular(36),
                  onPressed: () {
                    debugPrint('clicked on create an account');
                  },
                ),
                const SizedBox(
                  height: 18,
                ),

                /// do you have account already
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${'doYouHaveAccountAlready'.tr}? ',
                      style: Styles.bodySmall,
                    ),
                    InkWell(
                      onTap: () => debugPrint('clicked on login'),
                      child: Text(
                        'login'.tr,
                        style: Styles.bodySmall.copyWith(
                          color: AppColors.softOrange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
