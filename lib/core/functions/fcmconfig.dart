import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:full_store_app/controllers/notification_controller.dart';
import 'package:full_store_app/controllers/order_controller.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:get/get.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;
requestPermissionNotifications() async {
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((massage) {
    print('========================= Notification ========================');
    print(massage.notification!.title);
    print(massage.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(massage.notification!.title!, massage.notification!.body!);
    notificationRefreshPage(massage.data);
  });
}

notificationRefreshPage(Map data) {
  if (Get.currentRoute == AppRoute.ordersView &&
      data['pagename'] == "refreshorderview") {
    OrderController orderController = Get.find();
    orderController.refreshOrdersView();
  }
  if (Get.currentRoute == AppRoute.notificationView &&
      data['pagename'] == "refreshorderview") {
    NotificationController notificationController = Get.find();
    notificationController.refreshData();
  }
}
