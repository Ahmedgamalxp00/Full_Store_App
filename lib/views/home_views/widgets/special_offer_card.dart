import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/data/models/items_model/item.dart';
import 'package:get/get.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.item,
  });
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.toNamed(AppRoute.productDetailesView, arguments: {"item": item}),
      child: SizedBox(
        height: 100,
        width: 200,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: CachedNetworkImage(
                height: 80,
                imageUrl: '${AppLinks.imageItemsLink}/${item.itemsImage}',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 15,
            //     vertical: 10,
            //   ),
            //   child: Text.rich(
            //     TextSpan(
            //       style: const TextStyle(
            //         color: Colors.white,
            //       ),
            //       children: [
            //         TextSpan(
            //             text: '$category\n',
            //             style: AppStyles.styleSemiBold18
            //                 .copyWith(color: Colors.white)),
            //         TextSpan(
            //             text: '$numOfbrand Items',
            //             style: AppStyles.styleSemiBold14
            //                 .copyWith(color: Colors.white)),
            //       ],
            //     ),
            //   ),
            // ),
            if (item.itemsDiscount != 0)
              Positioned(
                top: -5,
                left: -5,
                child: Image.asset(
                  Assets.imagesSale,
                  width: 45,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
