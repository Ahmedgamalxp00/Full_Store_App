import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/splash_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:get/get.dart';

class SplashPageIndcator extends StatelessWidget {
  const SplashPageIndcator({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    splashList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 10),
                          duration: const Duration(milliseconds: 500),
                          width: controller.currentPage == index ? 40 : 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: controller.currentPage == index
                                  ? Colors.black
                                  : const Color(0x3317223B),
                              borderRadius: BorderRadius.circular(10)),
                        )),
              ],
            ));
  }
}
