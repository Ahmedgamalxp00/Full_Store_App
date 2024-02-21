import 'package:dio/dio.dart';
import 'package:full_store_app/controllers/signup_controller.dart';
import 'package:full_store_app/core/utils/api_services.dart';

import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.put(Dio());
    Get.put(ApiService());
    // Get.put(MainViewController());
  }
}
