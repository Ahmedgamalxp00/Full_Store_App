import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/order_controller.dart';
import 'package:full_store_app/core/shared/empty_widget.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/views/archived_orders_view/widgets/orders_listview_item.dart';
import 'package:get/get.dart';

class ArchivedOrdersListView extends StatelessWidget {
  const ArchivedOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<OrderController>();
    return GetBuilder<OrderController>(builder: (controller) {
      if (controller.requestState == RequestState.loading) {
        return const CustomLoadingWidget1();
      } else if (controller.requestState == RequestState.failure ||
          controller.archivedList.isEmpty) {
        return const CustomEmptyWidget();
      } else {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: controller.archivedList.length,
          itemBuilder: (context, index) {
            return ArchivedOrdersListViewItem(
                order: controller.archivedList[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
        );
      }
    });
  }
}
