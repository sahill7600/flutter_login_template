import 'dart:developer';

import 'package:apex_missions/Constants/Localization/english.dart';
import 'package:apex_missions/Constants/Localization/hindi.dart';
import 'package:apex_missions/Controller/BaseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': englishMap,
        'hi_IN': hindiMap,
      };
}

class AppLanguagesConstant extends BaseController {
  static const Locale defaultLocalization = Locale('en', 'US');
  static const Locale hindiLocalization = Locale('hi', 'IN');

  void changeLocale({Locale? locale}) {
    if (Get.locale == null || locale == null) {
      debugPrint("if");
      Get.updateLocale(AppLanguagesConstant.defaultLocalization);
    } else {
      debugPrint("else");
      Get.updateLocale(locale);
    }
    log(Get.deviceLocale!.languageCode, name: "device locale");
    log(Get.locale!.languageCode, name: "current locale");
    update();
  }
}
