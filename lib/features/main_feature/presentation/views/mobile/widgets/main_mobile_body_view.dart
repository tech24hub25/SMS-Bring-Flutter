import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/routes/app_routes.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/primary_linear_gradient_button.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class MainMobileBodyView extends StatelessWidget {
  const MainMobileBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 64,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(Assets.svgLowerNipMessageClipper),
                    Positioned(
                      top: 17,
                      left: 10,
                      child: Text(
                        'welcome'.tr,
                        style: Styles.headlineMedium.copyWith(
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'toSmsBring'.tr,
                  style: Styles.titleLarge.copyWith(
                    color: AppColors.periwinkle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'fastAndSecureTemporaryPhoneNumbersAvailable'.tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Styles.headlineMedium.copyWith(
                color: AppColors.deepBlue,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'acquireInstantSecureTemporaryPhoneNumbersAndPayUponReceivingAShortMessage'
                  .tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Styles.headlineSmall.copyWith(
                color: AppColors.deepBlue,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SvgPicture.asset(
              Assets.svgInternetApps,
              height: 350,
              width: 350,
            ),
            const SizedBox(
              height: 32,
            ),
            // PrimaryLinearGradientButton(
            //   text: 'buyNow'.tr,
            //   onPressed: () {
            //     // todo: Go to the purchase credit page
            //   },
            //   borderRadius: BorderRadius.circular(52),
            //   boxShadow: [
            //     BoxShadow(
            //       color: AppColors.lightPurple.withOpacity(0.5),
            //       spreadRadius: 0,
            //       blurRadius: 14,
            //       offset: const Offset(0, 4),
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
