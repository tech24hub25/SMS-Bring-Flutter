import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/models/popup_menu_item.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';
import 'package:sms_bring_flutter/core/widgets/custom_popup_menu.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class CustomSelectLanguage extends StatefulWidget {
  const CustomSelectLanguage({super.key});

  @override
  State<CustomSelectLanguage> createState() => _CustomSelectLanguageState();
}

class _CustomSelectLanguageState extends State<CustomSelectLanguage> {
  PopupMenuItemModel item = MenuItems.items.first;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          item.svg,
          width: 26,
          height: 26,
        ),
        SizedBox(
          height: 24,
          child: VerticalDivider(
            thickness: 1.5,
            color: AppColors.gray.withOpacity(0.2),
          ),
        ),
        Text(
          item.languageCode.toUpperCase(),
          style: Styles.bodyLarge.copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.transparentBlackColor,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        CustomPopupMenu(
          items: MenuItems.items,
          onSelected: onSelected,
          icon: const Icon(
            FontAwesomeIcons.angleDown,
            size: 16,
          ),
        ),
      ],
    );
  }

  void onSelected(BuildContext context, PopupMenuItemModel item) {
    switch (item) {
      case MenuItems.itemFlagOfRussia:
        this.item = item;
        printInfo(info: 'change lang to russian');
        setState(() {});
        break;
      case MenuItems.itemFlagOfUnitedKingdom:
        this.item = item;
        printInfo(info: 'change lang to english');
        setState(() {});
        break;
    }
  }
}

class MenuItems {
  static const List<PopupMenuItemModel> items = [
    itemFlagOfRussia,
    itemFlagOfUnitedKingdom,
  ];

  static const itemFlagOfUnitedKingdom = PopupMenuItemModel(
    text: 'english',
    languageCode: 'en',
    svg: Assets.svgFlagOfUnitedKingdom,
  );
  static const itemFlagOfRussia = PopupMenuItemModel(
    text: 'russian',
    languageCode: 'ru',
    svg: Assets.svgFlagOfRussia,
  );
}
