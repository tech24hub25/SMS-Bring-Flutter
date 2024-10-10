import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/widgets/custom_app_bar_mobile.dart';
import 'package:sms_bring_flutter/core/widgets/drawer_menu_mobile.dart';
import 'package:sms_bring_flutter/features/main_feature/presentation/views/mobile/widgets/main_mobile_body_view.dart';

class MainMobileView extends StatelessWidget {
  const MainMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: CustomAppBarMobile(),
        ),
        drawer: DrawerMenuMobile(),
        body: MainMobileBodyView(),
      ),
    );
  }
}
