import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_store_app/core/utils/app_styles.dart';

class SplashItem extends StatelessWidget {
  const SplashItem(
      {super.key,
      required this.image,
      required this.title,
      required this.describtion});
  final String image;
  final String title;
  final String describtion;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset(image),
        const Spacer(),
        Text(
          title,
          style: AppStyles.styleExtraBold24.copyWith(height: 2.5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            describtion,
            textAlign: TextAlign.center,
            style: AppStyles.styleSemiBold14,
          ),
        )
      ],
    );
  }
}
