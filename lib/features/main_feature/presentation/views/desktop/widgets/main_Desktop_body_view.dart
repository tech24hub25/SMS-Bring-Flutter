import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sms_bring_flutter/features/main_feature/presentation/views/widgets/text_intro_home.dart';
import 'package:sms_bring_flutter/generated/assets.dart';

class MainDesktopBodyView extends StatelessWidget {
  const MainDesktopBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 36,
          vertical: 24,
        ),
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 64),
                child: TextIntoHome(),
              ),
            ),
            Expanded(
              child: SvgPicture.asset(
                Assets.svgInternetApps,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
