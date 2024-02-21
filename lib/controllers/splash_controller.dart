import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  PageController pageController = PageController();
  MyServices myServices = Get.find();
  int currentPage = 0;
  next() {
    currentPage++;
    if (currentPage < splashList.length) {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    } else {
      myServices.sharedPreferences.setString('step', "1");
      Get.toNamed(AppRoute.loginView);
    }
  }

  onPageChange(int index) {
    currentPage = index;
    update();
  }
}
