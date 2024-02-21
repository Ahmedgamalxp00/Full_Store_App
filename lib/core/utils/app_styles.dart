import 'package:flutter/material.dart';
import 'package:full_store_app/localization/language_controller.dart';
import 'package:get/get.dart';

abstract class AppStyles {
  LanguageController languageController = Get.find();
  static const TextStyle styleExtraBold24 = TextStyle(
    color: Colors.black,
    fontSize: 24,
    // fontFamily: 'Montserrat',
    fontWeight: FontWeight.w800,
  );

  static const TextStyle styleSemiBold14 = TextStyle(
    color: Color(0xFFA8A8A9),
    fontSize: 14,
    // fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.28,
  );

  static const TextStyle styleSemiBold18 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    // fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle styleBold36 = TextStyle(
    color: Colors.black,
    fontSize: 36,
    // fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle styleMedium12 = TextStyle(
    color: Color(0xFF676767),
    fontSize: 12,
    // fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle styleSemiBold20 = TextStyle(
    color: Colors.white,
    fontSize: 20,
    // fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );
}
