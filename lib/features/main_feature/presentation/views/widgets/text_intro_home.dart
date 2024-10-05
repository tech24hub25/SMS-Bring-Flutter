import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/primary_linear_gradient_button.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class TextIntoHome extends StatelessWidget {
  const TextIntoHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
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
              style: Styles.headlineMedium.copyWith(
                color: AppColors.periwinkle,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 46,
        ),
        Text(
          'fastAndSecureTemporaryPhoneNumbersAvailable'.tr,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Styles.displayMedium.copyWith(
            color: AppColors.deepBlue,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 46,
        ),
        Text(
          'acquireInstantSecureTemporaryPhoneNumbersAndPayUponReceivingAShortMessage'
              .tr,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Styles.headlineMedium.copyWith(
            color: AppColors.deepBlue,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 46,
        ),
        PrimaryLinearGradientButton(
          text: 'buyNow'.tr,
          onPressed: () {
            // todo: Go to the purchase credit page
          },
          borderRadius: BorderRadius.circular(52),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightPurple.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ],
    );
  }
}
