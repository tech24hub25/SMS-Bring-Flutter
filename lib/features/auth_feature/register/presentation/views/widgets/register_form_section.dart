import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/routes/app_routes.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_circular_check_box.dart';
import 'package:sms_bring_flutter/core/widgets/custom_text_field.dart';
import 'package:sms_bring_flutter/core/widgets/primary_linear_gradient_button.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  bool isAgreeTermsAndConditions = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              onTap: () => Get.offAllNamed(AppRoutes.loginRoute),
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
    );
  }
}
