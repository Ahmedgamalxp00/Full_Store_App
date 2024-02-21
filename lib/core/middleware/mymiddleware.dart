import 'package:flutter/material.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class MyMiddlewalre extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == "2") {
      return const RouteSettings(name: AppRoute.mainView);
    } else if (myServices.sharedPreferences.getString('step') == "1") {
      return const RouteSettings(name: AppRoute.loginView);
    }
    return super.redirect(route);
  }
}
