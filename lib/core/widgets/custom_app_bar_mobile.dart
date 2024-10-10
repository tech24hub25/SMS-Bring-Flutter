import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/routes/app_routes.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_app_bar_button.dart';
import 'package:sms_bring_flutter/core/widgets/primary_linear_gradient_button.dart';
import 'package:sms_bring_flutter/core/widgets/custom_select_language.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class CustomAppBarMobile extends StatefulWidget {
  const CustomAppBarMobile({
    super.key,
  });

  @override
  State<CustomAppBarMobile> createState() => _CustomAppBarDesktopState();
}

class _CustomAppBarDesktopState extends State<CustomAppBarMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
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
          const Spacer(),
          const CustomSelectLanguage(),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
    );
  }
}
