import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class DrawerMenuMobile extends StatelessWidget {
  const DrawerMenuMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryBackgroundColor,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Hussein Issa'),
            accountEmail: const Text('hussein@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.white,
              child: SvgPicture.asset(Assets.svgSmsBringLogo),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.primaryLinearGradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: AppColors.primaryColor,
            ),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.numbers,
              color: AppColors.primaryColor,
            ),
            title: const Text('Get Numbers'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: AppColors.primaryColor,
            ),
            title: const Text('Help & Support'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: AppColors.primaryColor,
            ),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
