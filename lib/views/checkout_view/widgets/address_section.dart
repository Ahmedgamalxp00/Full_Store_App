import 'package:flutter/widgets.dart';
import 'package:full_store_app/controllers/checkout_controller.dart';

import 'package:full_store_app/views/checkout_view/widgets/address_item.dart';

import 'package:get/get.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CheckOutController>();
    return GetBuilder<CheckOutController>(builder: (controller) {
      return Column(
        children: [
          ...List.generate(
            controller.addressList.length,
            (index) => AddressItem(
              onTap: () {
                controller.chooseshippingAddress(
                  '${controller.addressList[index].adressId}',
                );
              },
              addressName: '${controller.addressList[index].adressName}',
              addressCity: '${controller.addressList[index].adressCity}',
              addressStreet: '${controller.addressList[index].adressStreet}',
              active: controller.addressId ==
                      '${controller.addressList[index].adressId}'
                  ? true
                  : false,
            ),
          )
        ],
      );
    });
  }
}
