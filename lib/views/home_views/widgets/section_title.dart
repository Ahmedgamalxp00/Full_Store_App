import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';

class SectionTiTle extends StatelessWidget {
  const SectionTiTle({super.key, required this.title, this.ontap});
  final String title;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 20,
        // top: 30,
        // bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyles.styleSemiBold18),
          TextButton(
            onPressed: ontap,
            child: Text('See More',
                style:
                    AppStyles.styleSemiBold14.copyWith(color: kPrimeryColor)),
          )
        ],
      ),
    );
  }
}
