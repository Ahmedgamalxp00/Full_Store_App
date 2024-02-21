import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';

class ChooseDeliveryItem extends StatelessWidget {
  const ChooseDeliveryItem(
      {super.key,
      required this.image,
      this.onTap,
      required this.active,
      required this.title});
  final String image;
  final String title;
  final void Function()? onTap;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: active == true ? kPrimeryColor : Colors.transparent,
            border: Border.all(color: kPrimeryColor),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 70,
              height: 70,
              color: active == true ? Colors.white : null,
            ),
            Text(
              title,
              style: AppStyles.styleSemiBold18.copyWith(
                  color: active == true ? Colors.white : kPrimeryColor),
            ),
          ],
        ),
      ),
    );
  }
}
