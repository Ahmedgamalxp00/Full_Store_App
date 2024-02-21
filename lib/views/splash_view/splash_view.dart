import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/splash_controller.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/views/splash_view/widgets/splash_page_indcator.dart';
import 'package:full_store_app/views/splash_view/widgets/splash_slider.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Expanded(
            flex: 14,
            child: SplashSlider(),
          ),
          const Spacer(flex: 2),
          const SplashPageIndcator(),
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomBottn(
              text: '8'.tr,
              onTap: () {
                controller.next();
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
