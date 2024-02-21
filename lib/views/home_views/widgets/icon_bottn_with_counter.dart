import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconBWithCounter extends StatelessWidget {
  const IconBWithCounter({
    super.key,
    this.numberOfItem = 0,
    required this.svgPicture,
    this.onTap,
  });
  final int numberOfItem;
  final String svgPicture;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xffF2F5F1),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(
                svgPicture,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
