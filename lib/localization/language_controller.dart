import 'package:flutter/material.dart';
import 'package:full_store_app/core/functions/fcmconfig.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  late Locale language;
  MyServices myServices = Get.find();
  changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    requestPermissionNotifications();
    fcmConfig();
    String? sharedPrefLocale = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLocale == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLocale == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
