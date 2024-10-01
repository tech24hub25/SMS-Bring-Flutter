import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/routes/app_routes.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_circular_check_box.dart';
import 'package:sms_bring_flutter/core/widgets/custom_text_field.dart';
import 'package:sms_bring_flutter/core/widgets/primary_linear_gradient_button.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  bool isRememberMe = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Row(
          children: [
            CustomCircularCheckBox(
              isChecked: isRememberMe,
              onChecked: (check) {
                isRememberMe = check;
                setState(() {});
              },
            ),
            Text('rememberMe'.tr),
            const Spacer(),
            InkWell(
                onTap: () => debugPrint('Clicked on forget password'),
                child: Text('forgetPassword'.tr)),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        PrimaryLinearGradientButton(
          text: 'login'.tr,
          width: context.width,
          height: 50,
          borderWidth: 6,
          borderRadius: BorderRadius.circular(36),
          onPressed: () {
            debugPrint('clicked on login');
          },
        ),
        const SizedBox(
          height: 18,
        ),

        /// don't have an account
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${'doNotHaveAnAccount'.tr}? ',
              style: Styles.bodySmall,
            ),
            InkWell(
              onTap: () => Get.toNamed(AppRoutes.registerRoute),
              child: Text(
                'createAnAccount'.tr,
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
