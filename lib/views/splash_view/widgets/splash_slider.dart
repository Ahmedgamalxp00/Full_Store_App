import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/splash_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/views/splash_view/widgets/splash_item.dart';
import 'package:get/get.dart';

class SplashSlider extends GetView<SplashController> {
  const SplashSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChange(value);
      },
      itemCount: splashList.length,
      itemBuilder: (BuildContext context, int index) {
        return SplashItem(
            image: splashList[index].image,
            title: splashList[index].title,
            describtion: splashList[index].describtion);
      },
    );
  }
}
