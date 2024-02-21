import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  MyServices myServices = Get.find();
  logOut() {
    String userId = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.loginView);
  }
}
