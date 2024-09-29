import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';

class PrimaryLinearGradientButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderWidth;
  final BorderRadiusGeometry? borderRadius;
  const PrimaryLinearGradientButton({
    super.key,
    this.width = 200,
    this.height = 50,
    this.borderWidth = 0,
    this.borderRadius = BorderRadius.zero,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: (height! + borderWidth!),
      padding: EdgeInsets.all(borderWidth!),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryLinearGradientColors
              .map((color) => color.withOpacity(0.5))
              .toList(),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: borderRadius,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: AppColors.primaryLinearGradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: borderRadius,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius!,
            ),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.primaryLinearGradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: borderRadius,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: Styles.titleMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
