import 'package:get/get.dart';
import 'package:sms_bring_flutter/core/translations/ar_sy.dart';
import 'package:sms_bring_flutter/core/translations/en_us.dart';

class MyTranslationsConfig extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ar_AE': arSY,
      };
}
