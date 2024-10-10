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

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  bool isAgreeTermsAndConditions = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            title: 'fullName'.tr,
            hint: 'enterYourFullName'.tr,
            prefixIcon: FontAwesomeIcons.userLarge,
            controller: _fullNameController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Full name cannot be empty.';
              }
              return null;
            },
          ),
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
              if (!val.hasUpperCase) {
                return 'Password must contain at least one uppercase letter.';
              }
              if (!val.hasLowerCase) {
                return 'Password must contain at least one lowercase letter.';
              }
              if (!val.hasNumber) {
                return 'Password must contain at least one number.';
              }
              if (!val.hasSpecialCharacter) {
                return 'Password must contain at least one special character (e.g. !@#\$&*~).';
              }
              return null;
            },
          ),
          CustomTextFormField(
            title: 'confirmPassword'.tr,
            hint: 'confirmYourPassword'.tr,
            prefixIcon: FontAwesomeIcons.lock,
            suffixIcon: Icons.visibility,
            obscureText: true,
            controller: _confirmPasswordController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Password cannot be empty.';
              }
              if (val != _passwordController.text) {
                return 'Passwords do not match. Please try again.';
              }
              return null;
            },
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
              if (_formKey.currentState!.validate()) {
                debugPrint('success validation');
              } else {
                debugPrint('failure validation');
              }
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
      ),
    );
  }
}
