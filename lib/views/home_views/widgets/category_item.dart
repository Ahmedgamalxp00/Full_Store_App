import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.text,
    required this.press,
    this.image,
  }) : super(key: key);

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
                child: image == null
                    ? const Icon(Icons.error_outline)
                    : Padding(
                        padding: const EdgeInsets.all(13),
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
