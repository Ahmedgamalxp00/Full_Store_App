import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:full_store_app/controllers/checkout_controller.dart';
import 'package:full_store_app/views/checkout_view/widgets/choose_payment_item.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChoosePaymentSection extends StatelessWidget {
  const ChoosePaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CheckOutController>();
    return GetBuilder<CheckOutController>(
      builder: (controller) {
        return Column(
          children: [
            ChoosePaymentItem(
                title: 'Cash',
                active: controller.paymentMethod == '0' ? true : false,
                ontap: () {
                  controller.choosePaymentMethod('0');
                }),
            const Gap(10),
            ChoosePaymentItem(
                title: 'payment cards',
                active: controller.paymentMethod == '1' ? true : false,
                ontap: () {
                  controller.choosePaymentMethod('1');
                }),
          ],
        );
      },
    );
  }
}
