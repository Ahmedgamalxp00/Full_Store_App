import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/home_controller.dart';
import 'package:full_store_app/controllers/main_view_controller.dart';
import 'package:full_store_app/core/shared/custom_bottom_navbar.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainViewController());
    Get.put(HomeController());
    return GetBuilder<MainViewController>(
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          body: controller.currentView,
          bottomNavigationBar: CustomBottmNavBar(
            onTabChange: (index) => controller.onTabChange(index),
            selectedIndx: controller.selectedIndx,
          ),
        );
      },
    );
  }
}
