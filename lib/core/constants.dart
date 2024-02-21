import 'package:flutter/material.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/data/models/splash_model.dart';
import 'package:get/get.dart';

List<SplashModel> splashList = [
  SplashModel(
    image: Assets.imagesSplash1,
    title: '2'.tr,
    describtion: '3'.tr,
  ),
  SplashModel(
    image: Assets.imagesSplash2,
    title: '4'.tr,
    describtion: '5'.tr,
  ),
  SplashModel(
    image: Assets.imagesSplash3,
    title: '6'.tr,
    describtion: '7'.tr,
  ),
];
ThemeData myTheme = ThemeData(
  fontFamily: 'font'.tr,
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    centerTitle: true,
    titleTextStyle: AppStyles.styleExtraBold24,
  ),
);
const Color kPrimeryColor = Color(0xffF83758);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
