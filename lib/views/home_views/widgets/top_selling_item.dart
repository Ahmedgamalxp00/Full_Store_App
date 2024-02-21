import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/favorites_controller.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/data/models/items_model/item.dart';
import 'package:get/get.dart';

class TopSellingItem extends StatelessWidget {
  const TopSellingItem({
    super.key,
    required this.item,
  });

  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesController());
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.productDetailesView, arguments: {"item": item});
      },
      child: Stack(
        children: [
          Container(
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: kPrimeryColor,
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: const Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 5),
                      //     child: Row(
                      //       children: [
                      //         Text(
                      //           '4.5',
                      //           style: TextStyle(
                      //             fontSize: 16,
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //         Gap(5),
                      //         Icon(
                      //           Icons.star_rounded,
                      //           color: Colors.white,
                      //           size: 20,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const Spacer(),
                      GetBuilder<FavoritesController>(
                        builder: (controller) {
                          return GestureDetector(
                            child:
                                controller.isFavorite['${item.itemsId}'] == "1"
                                    ? const Icon(
                                        Icons.favorite,
                                        color: kPrimeryColor,
                                      )
                                    : const Icon(Icons.favorite_border),
                            onTap: () {
                              if (controller.isFavorite['${item.itemsId}'] ==
                                  "1") {
                                controller.setFavorite('${item.itemsId}', "0");
                                controller
                                    .removeFromFavorites('${item.itemsId}');
                              } else {
                                controller.setFavorite('${item.itemsId}', "1");
                                controller.addToFavorites('${item.itemsId}');
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  CachedNetworkImage(
                    imageUrl: '${AppLinks.imageItemsLink}/${item.itemsImage}',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Text(
                    "${item.itemsName}",
                    style:
                        AppStyles.styleSemiBold14.copyWith(color: kTextColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    '\$ ${item.itemsPriceAfterDiscount}',
                    style: AppStyles.styleSemiBold20.copyWith(
                      color: kPrimeryColor,
                    ),
                  ),
                  if (item.itemsDiscount != 0)
                    Text(
                      '\$ ${item.itemsPrice}',
                      style: AppStyles.styleSemiBold14.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: kTextColor),
                    ),
                ],
              ),
            ),
          ),
          if (item.itemsDiscount != 0)
            Positioned(
              top: 10,
              left: 10,
              child: Image.asset(
                Assets.imagesSale,
                width: 45,
              ),
            ),
        ],
      ),
    );
  }
}
