import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/shared/rounded_btn.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:full_store_app/data/models/cart_model/cart_model.dart';
import 'package:gap/gap.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({
    super.key,
    required this.product,
    required this.numberOfProduct,
    this.onAddTap,
    this.onRemoveTap,
  });

  final CartModel product;
  final int numberOfProduct;
  final void Function()? onAddTap;
  final void Function()? onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: (88),
                child: AspectRatio(
                  aspectRatio: .88,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CachedNetworkImage(
                        imageUrl:
                            '${AppLinks.imageItemsLink}/${product.itemsImage}'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.itemsName as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const Gap(10),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: ' \$${product.itemsPriceAfterDiscount}  ',
                              style: const TextStyle(
                                color: kPrimeryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'x$numberOfProduct',
                              style: const TextStyle(color: kTextColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  RoundedBTN(
                    width: 30,
                    height: 30,
                    color: kSecondaryColor.withOpacity(0.2),
                    icon: Icons.add,
                    ontap: onAddTap,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '$numberOfProduct',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  RoundedBTN(
                    width: 30,
                    height: 30,
                    color: kSecondaryColor.withOpacity(0.2),
                    icon: Icons.remove,
                    ontap: onRemoveTap,
                  ),
                ],
              ),
            ],
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
