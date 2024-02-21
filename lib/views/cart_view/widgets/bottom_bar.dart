import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/cart_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:get/get.dart';

class BottonBar extends StatelessWidget {
  const BottonBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>();
    return GetBuilder<CartController>(
      builder: (controller) {
        return Container(
          height: 260,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, -10),
                blurRadius: 20,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 120,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'price : ${controller.totalPrice}',
                            style: AppStyles.styleSemiBold14,
                          ),
                          Text(
                            'discount : ${controller.discount}%',
                            style: AppStyles.styleSemiBold14,
                          ),
                        ]),
                    Column(
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kSecondaryColor.withOpacity(0.1),
                          ),
                          child: TextFormField(
                            enabled:
                                controller.couponName == null ? true : false,
                            controller: controller.couponController,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  await controller.checkcoupon();
                                  if (controller.discount != 0) {
                                    FocusScope.of(context).unfocus();
                                    controller.couponController.clear();
                                  }
                                },
                                icon: const Icon(Icons.arrow_forward_ios),
                              ),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: controller.couponName == null
                                  ? 'Add voncher code'
                                  : '" ${controller.couponName} " is applied',
                              hintStyle: AppStyles.styleSemiBold14,
                            ),
                          ),
                        ),
                        if (controller.discount == 0)
                          Text(
                            controller.couponeRquestError ?? '',
                            style: AppStyles.styleSemiBold14
                                .copyWith(color: kPrimeryColor),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Total :\n',
                            style: AppStyles.styleSemiBold18,
                          ),
                          TextSpan(
                            text:
                                '\$${controller.getTotalPrice() ?? controller.totalPrice} ',
                            style: AppStyles.styleSemiBold20
                                .copyWith(color: kPrimeryColor, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: CustomBottn(
                        text: "Check out",
                        onTap: () {
                          controller.goToCheckOutPage();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
