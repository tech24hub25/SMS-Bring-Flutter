import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/routes/app_routes.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_app_bar_button.dart';
import 'package:sms_bring_flutter/core/widgets/primary_linear_gradient_button.dart';
import 'package:sms_bring_flutter/core/widgets/custom_select_language.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _selectedButtonIndex = 1;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 36,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 16,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Assets.svgSmsBringLogo,
            width: 90,
            height: 90,
            alignment: Alignment.centerLeft,
          ),
          Text(
            'smsBring'.tr.toUpperCase(),
            style: Styles.headlineSmall.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.oceanBlue,
            ),
          ),
          const Spacer(),
          CustomAppBarButton(
            text: 'home'.tr,
            borderWidth: 4,
            width: 90,
            borderRadius: BorderRadius.circular(16),
            backgroundColors: AppColors.primaryLinearGradientColors,
            textStyle: Styles.bodyMedium.copyWith(
              fontWeight:
                  _selectedButtonIndex == 1 ? FontWeight.w900 : FontWeight.w400,
              color: _selectedButtonIndex == 1
                  ? AppColors.white
                  : AppColors.charcoal,
            ),
            isSelected: _selectedButtonIndex == 1,
            onPressed: () {
              _onButtonPressed(1);
            },
          ),
          const SizedBox(
            width: 30,
          ),
          CustomAppBarButton(
            text: 'getNumbers'.tr,
            borderWidth: 4,
            width: 130,
            borderRadius: BorderRadius.circular(16),
            backgroundColors: AppColors.primaryLinearGradientColors,
            textStyle: Styles.bodyMedium.copyWith(
              fontWeight:
                  _selectedButtonIndex == 2 ? FontWeight.w900 : FontWeight.w400,
              color: _selectedButtonIndex == 2
                  ? AppColors.white
                  : AppColors.charcoal,
            ),
            isSelected: _selectedButtonIndex == 2,
            onPressed: () {
              _onButtonPressed(2);
            },
          ),
          const SizedBox(
            width: 30,
          ),
          CustomAppBarButton(
            text: 'helpAndSupport'.tr,
            borderWidth: 4,
            width: 130,
            borderRadius: BorderRadius.circular(16),
            backgroundColors: AppColors.primaryLinearGradientColors,
            textStyle: Styles.bodyMedium.copyWith(
              fontWeight:
                  _selectedButtonIndex == 3 ? FontWeight.w900 : FontWeight.w400,
              color: _selectedButtonIndex == 3
                  ? AppColors.white
                  : AppColors.charcoal,
            ),
            isSelected: _selectedButtonIndex == 3,
            onPressed: () {
              _onButtonPressed(3);
            },
          ),
          const SizedBox(
            width: 30,
          ),
          const CustomSelectLanguage(),
          const SizedBox(
            width: 30,
          ),
          PrimaryLinearGradientButton(
            text: 'Register',
            onPressed: () => Get.toNamed(AppRoutes.registerRoute),
            borderRadius: BorderRadius.circular(52),
            width: 150,
            height: 40,
            boxShadow: [
              BoxShadow(
                color: AppColors.lightPurple.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColors.skyBlue,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(52),
                ),
              ),
              onPressed: () => Get.toNamed(AppRoutes.loginRoute),
              child: Text(
                'Login',
                style: Styles.titleMedium.copyWith(
                  color: AppColors.lightPurple,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
