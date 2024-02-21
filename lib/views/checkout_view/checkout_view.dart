import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/checkout_controller.dart';
import 'package:full_store_app/controllers/main_view_controller.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/views/checkout_view/widgets/add_address_section.dart';
import 'package:full_store_app/views/checkout_view/widgets/address_section.dart';
import 'package:full_store_app/views/checkout_view/widgets/checkout_section_title.dart';
import 'package:full_store_app/views/checkout_view/widgets/choose_delivery_section.dart';
import 'package:full_store_app/views/checkout_view/widgets/choose_payment_section.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChechOutView extends StatelessWidget {
  const ChechOutView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CheckOutController(), fenix: true);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Check Out'),
        centerTitle: true,
      ),
      body: GetBuilder<CheckOutController>(builder: (controller) {
        if (controller.requestState == RequestState.loading) {
          return const CustomLoadingWidget1();
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GetBuilder<CheckOutController>(builder: (controller) {
                return Column(
                  children: [
                    const CheckOutSectionTiTle(title: 'choose Payment Method'),
                    const ChoosePaymentSection(),
                    const CheckOutSectionTiTle(title: 'choose Delivery Type'),
                    const ChooseDeliverySection(),
                    const Gap(20),
                    if (controller.deliveryType == '0' &&
                        controller.addressList.isNotEmpty)
                      const AddressSection(),
                    if (controller.deliveryType == '0' &&
                        controller.addressList.isEmpty)
                      const AddAddressSection(),
                    const Gap(20),
                    CustomBottn(
                      text: 'Check Out',
                      onTap: () async {
                        await controller.chechOut();
                      },
                    ),
                    const Gap(20)
                  ],
                );
              }),
            ),
          );
        }
      }),
    );
  }
}
