import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/order_controller.dart';
import 'package:full_store_app/views/archived_orders_view/widgets/orders_listview.dart';
import 'package:get/get.dart';

class ArchivedOrdersView extends StatelessWidget {
  const ArchivedOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archived Orders'),
      ),
      body: const ArchivedOrdersListView(),
    );
  }
}
