import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/extensions/string_extension.dart';
import 'package:sms_bring_flutter/core/routes/app_routes.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_circular_check_box.dart';
import 'package:sms_bring_flutter/core/widgets/custom_text_form_field.dart';
import 'package:sms_bring_flutter/core/widgets/primary_linear_gradient_button.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRememberMe = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            title: 'emailAddress'.tr,
            hint: 'enterYourEmail'.tr,
            prefixIcon: FontAwesomeIcons.solidEnvelope,
            controller: _emailController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Email cannot be empty.';
              }
              if (!val.isValidEmail) {
                return 'Enter a valid email.';
              }
              return null;
            },
          ),
          CustomTextFormField(
            title: 'password'.tr,
            hint: 'enterYourPassword'.tr,
            prefixIcon: FontAwesomeIcons.lock,
            suffixIcon: Icons.visibility,
            obscureText: true,
            controller: _passwordController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Password cannot be empty.';
              }
              if (!val.hasMinLength) {
                return 'Password must be at least 8 characters long.';
              }
              return null;
            },
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
              if (_formKey.currentState!.validate()) {
                // String email = _emailController.text;
                // String password = _passwordController.text;
                debugPrint('success validation');
              } else {
                debugPrint('failure validation');
              }
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
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
