import 'dart:ui';

import 'package:flutter_application_1/globel/pref.dart';
import 'package:get/get.dart';

class MyLocal_Controller extends GetxController {
  void changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
    Pref.language = langCode;
  }
}
