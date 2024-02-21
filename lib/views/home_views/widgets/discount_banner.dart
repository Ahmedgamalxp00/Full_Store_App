import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: kPrimeryColor),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' A Summer Surprise',
                  style:
                      AppStyles.styleSemiBold14.copyWith(color: Colors.white),
                ),
                Text(
                  'Cashback 20%',
                  style:
                      AppStyles.styleExtraBold24.copyWith(color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
