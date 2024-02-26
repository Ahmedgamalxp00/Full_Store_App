import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.text,
    required this.press,
    this.image,
  });

  final String? text;
  final String? image;

  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Container(
                // padding: const EdgeInsets.all(15),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: !image!.contains('svg')
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: CachedNetworkImage(
                          imageUrl: "${AppLinks.imageCategoriesLink}/$image",
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.network(
                          "${AppLinks.imageCategoriesLink}/$image",
                          color: kPrimeryColor,
                        ),
                      )),
            const SizedBox(height: 5),
            Text(
              text!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
