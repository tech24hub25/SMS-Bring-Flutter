import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/models/popup_menu_item.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<PopupMenuItemModel> items;
  final void Function(BuildContext, PopupMenuItemModel) onSelected;
  final Icon? icon;

  const CustomPopupMenu({
    super.key,
    required this.items,
    required this.onSelected,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupMenuItemModel>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      position: PopupMenuPosition.under,
      icon: icon,
      onSelected: (item) => onSelected(context, item),
      itemBuilder: (context) => [
        ...items.map(buildItem),
      ],
    );
  }

  PopupMenuItem<PopupMenuItemModel> buildItem(PopupMenuItemModel item) =>
      PopupMenuItem<PopupMenuItemModel>(
        value: item,
        child: Row(
          children: [
            SvgPicture.asset(
              item.svg,
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(item.text.tr),
          ],
        ),
      );
}
