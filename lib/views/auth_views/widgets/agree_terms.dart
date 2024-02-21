import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:get/get.dart';

class AgreeTrems extends StatelessWidget {
  const AgreeTrems({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppStyles.styleMedium12,
        children: [
          TextSpan(text: '41'.tr),
          TextSpan(
              text: '42'.tr,
              style: AppStyles.styleMedium12.copyWith(color: kPrimeryColor)),
          TextSpan(text: '43'.tr),
        ],
      ),
    );
  }
}
