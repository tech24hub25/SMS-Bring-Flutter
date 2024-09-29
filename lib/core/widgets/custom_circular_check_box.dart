import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';

class CustomCircularCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function(bool check) onChecked;
  const CustomCircularCheckBox(
      {super.key, required this.isChecked, required this.onChecked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChecked(!isChecked);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.brightOrange : AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: isChecked ? AppColors.brightOrange : AppColors.gray,
            width: 2,
          ),
        ),
        child: Center(
          child: isChecked
              ? const Icon(
                  Icons.check,
                  size: 15,
                  color: AppColors.white,
                )
              : null,
        ),
      ),
    );
  }
}
