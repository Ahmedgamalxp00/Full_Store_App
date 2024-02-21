import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/order_details_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/views/orders_details_view/widgets/item_row.dart';
import 'package:full_store_app/views/orders_details_view/widgets/table_headers.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OrdersDetailsView extends StatelessWidget {
  const OrdersDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: GetBuilder<OrderDetailsController>(builder: (controller) {
          if (controller.requestState == RequestState.loading) {
            return const CustomLoadingWidget1();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  const TableHeaders(),
                  ...List.generate(
                    controller.itemsList.length,
                    (index) => ItemRow(
                      item: controller.itemsList[index],
                    ),
                  ),
                  const Divider(),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total Price : ',
                          style: AppStyles.styleSemiBold18
                              .copyWith(color: kPrimeryColor)),
                      Text('${controller.order.ordersTotalprice}',
                          style: AppStyles.styleSemiBold18
                              .copyWith(color: kTextColor)),
                    ],
                  ),
                  const Gap(10),
                  const Divider(),
                  const Gap(10),
                  if (controller.order.ordersDeliveryType == 0)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Shipping Address',
                            style: AppStyles.styleSemiBold18
                                .copyWith(color: kPrimeryColor)),
                        Text(
                            '${controller.order.adressCity} , ${controller.order.adressStreet}',
                            style: AppStyles.styleSemiBold18
                                .copyWith(color: kTextColor)),
                      ],
                    ),
                ],
              ),
            );
          }
        }));
  }
}
