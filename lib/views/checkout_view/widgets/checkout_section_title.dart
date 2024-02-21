import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';

class CheckOutSectionTiTle extends StatelessWidget {
  const CheckOutSectionTiTle({super.key, required this.title, this.ontap});
  final String title;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: AppStyles.styleSemiBold20.copyWith(color: kPrimeryColor)),
        ],
      ),
    );
  }
}
