import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              'SMS Bring',
              textAlign: TextAlign.center,
              style: Styles.titleMedium,
            ),
          );
        });
  }
}
