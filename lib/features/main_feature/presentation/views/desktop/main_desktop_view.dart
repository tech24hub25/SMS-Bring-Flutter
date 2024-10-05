import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/widgets/custom_app_bar.dart';
import 'package:sms_bring_flutter/features/main_feature/presentation/views/desktop/widgets/main_Desktop_body_view.dart';

class MainDesktopView extends StatelessWidget {
  const MainDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: CustomAppBar(),
        ),
        body: MainDesktopBodyView(),
      ),
    );
  }
}
