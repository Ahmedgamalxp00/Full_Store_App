import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/notification_controller.dart';
import 'package:full_store_app/views/notification_view/widgets/notification_listview.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const NotificationListView(),
    );
  }
}
