import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/cart_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/shared/empty_widget.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/views/cart_view/widgets/cart_listview_item.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>();
    return GetBuilder<CartController>(builder: (controller) {
      if (controller.requestState == RequestState.loading) {
        return const CustomLoadingWidget1();
      } else if (controller.requestState == RequestState.failure ||
          controller.myCartList.isEmpty) {
        return const CustomEmptyWidget();
      } else {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 20),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Dismissible(
            onDismissed: (direction) {
              controller
                  .deleteFromCart('${controller.myCartList[index].itemsId}');
            },
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffe6e6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.delete,
                      color: kPrimeryColor,
                    ),
                    Gap(20),
                  ],
                ),
              ),
            ),
            child: CartListViewItem(
                product: controller.myCartList[index],
                numberOfProduct:
                    controller.myCartList[index].itemscounttotal as int,
                onAddTap: () async {
                  await controller
                      .addToCart('${controller.myCartList[index].itemsId}');
                  controller.refreshData();
                },
                onRemoveTap: () async {
                  await controller.removeFromCart(
                      '${controller.myCartList[index].itemsId}');
                  controller.refreshData();
                }),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: controller.myCartList.length,
        );
      }
    });
  }
}
