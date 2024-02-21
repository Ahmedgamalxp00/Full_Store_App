import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/address_controller.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/shared/empty_widget.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/views/address_views/widgets/address_listview_item.dart';
import 'package:get/get.dart';

class AddressListView extends StatelessWidget {
  const AddressListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<AddressController>();
    return GetBuilder<AddressController>(builder: (controller) {
      if (controller.requestState == RequestState.loading) {
        return const CustomLoadingWidget1();
      } else if (controller.requestState == RequestState.failure) {
        return const CustomEmptyWidget();
      } else {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: controller.addressList.length,
          itemBuilder: (context, index) {
            return AddressListViewItem(
              onDeleteTap: () async {
                await controller
                    .removeAddress('${controller.addressList[index].adressId}');
                controller.refreshData();
              },
              address: controller.addressList[index],
            );
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
