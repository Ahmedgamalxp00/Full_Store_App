import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:full_store_app/data/models/items_model/item.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: (220),
              child: AspectRatio(
                aspectRatio: 1.3,
                child: Hero(
                    tag: "${item.itemsId}",
                    child: CachedNetworkImage(
                        imageUrl:
                            '${AppLinks.imageItemsLink}/${item.itemsImage}')),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //     4,
            //     (index) => Padding(
            //       padding: const EdgeInsets.all(8),
            //       child: GestureDetector(
            //         onTap: () => setState(() {
            //           selected = index;
            //         }),
            //         child: Container(
            //           width: (50),
            //           height: (50),
            //           decoration: BoxDecoration(
            //             border: Border.all(
            //               color: selected == index
            //                   ? kPrimeryColor
            //                   : Colors.transparent,
            //             ),
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //           child: Padding(
            //             padding: const EdgeInsets.all(6),
            //             child: CachedNetworkImage(imageUrl: widget.imageUrl),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
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
    );
  }
}
