import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';

class CustomAppBarButton extends StatelessWidget {
  const CustomAppBarButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width = 115,
    this.height = 35,
    this.borderWidth,
    this.borderRadius,
    this.backgroundColors = AppColors.primaryLinearGradientColors,
    this.borderColor,
    this.textStyle,
    this.isSelected = false,
  });
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;
  final List<Color>? backgroundColors;
  final TextStyle? textStyle;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: isSelected
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: backgroundColors!,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                border: Border.all(
                  color: borderColor ?? AppColors.white,
                  width: borderWidth ?? 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gray.withOpacity(0.3),
                    blurRadius: 3,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: borderRadius,
              )
            : null,
        child: Center(
          child: Text(
            text,
            style: textStyle,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
