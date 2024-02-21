import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/product_detailes_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/items_model/item.dart';
import 'package:full_store_app/views/product_detailes/widgets/product_count.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DescribtionSection extends StatelessWidget {
  const DescribtionSection({
    super.key,
    required this.product,
  });
  final ItemModel product;
  @override
  Widget build(BuildContext context) {
    Get.find<ProductDetailesController>();
    return GetBuilder<ProductDetailesController>(
      builder: (controller) {
        return controller.requestState == RequestState.loading
            ? const CustomLoadingWidget1()
            : Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 10),
                        child: Text('${product.itemsName}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.styleExtraBold24),
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${product.itemsPriceAfterDiscount}',
                            style: AppStyles.styleExtraBold24
                                .copyWith(color: kPrimeryColor),
                          ),
                          ProductCount(
                            itemCount: "${controller.itemcount}",
                            onAddTap: () => controller.add(),
                            onRemoveTap: () => controller.remove(),
                          ),
                        ],
                      ),
                      if (product.itemsDiscount != 0)
                        Text(
                          '\$ ${product.itemsPrice}',
                          style: AppStyles.styleSemiBold18.copyWith(
                            color: kTextColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          '${product.itemsDesc}',
                          maxLines: controller.seeMore == false ? 3 : 100,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.styleSemiBold14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.seeMoreDetailes();
                        },
                        child: Text(
                          'See More detailes >',
                          style: AppStyles.styleSemiBold14
                              .copyWith(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
