import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/myfavorite_controller.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/data/models/items_model/item.dart';
import 'package:full_store_app/data/models/my_favorite/my_favorite.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MyFavoriteListItem extends GetView<MyFavoritesController> {
  const MyFavoriteListItem({super.key, required this.product});
  final MyFavoriteModel product;

  @override
  Widget build(BuildContext context) {
    final ItemModel item = ItemModel.fromJson(product.toJson());
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.productDetailesView, arguments: {"item": item});
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: (100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        '${AppLinks.imageItemsLink}/${product.itemsImage}',
                    width: 50,
                  ),
                  const Gap(20),
                  SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.itemsName as String,
                            maxLines: 1, style: AppStyles.styleSemiBold18),
                        const Gap(8),
                        Row(
                          children: [
                            Text('\$ ${product.itemsPriceAfterDiscount}',
                                style: AppStyles.styleSemiBold18
                                    .copyWith(color: kPrimeryColor)),
                            const Gap(20),
                            if (product.itemsDiscount != 0)
                              Text('\$ ${product.itemsPrice}',
                                  style: AppStyles.styleSemiBold14.copyWith(
                                      color: kTextColor,
                                      decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      controller.deleteFromMyFavorites('${product.itemsId}');
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: kPrimeryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (product.itemsDiscount != 0)
            Positioned(
              top: 7,
              left: 7,
              child: Image.asset(
                Assets.imagesSale,
                width: 30,
              ),
            ),
        ],
      ),
    );
  }
}
