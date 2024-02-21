import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddAddressSection extends StatelessWidget {
  const AddAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'click botton to add you shipping address',
          style: AppStyles.styleSemiBold18.copyWith(color: kPrimeryColor),
        ),
        const Gap(10),
        SizedBox(
          width: 200,
          child: CustomBottn(
            text: 'Add Address',
            onTap: () async {
              Get.toNamed(
                AppRoute.addAddressView,
              );
            },
          ),
        ),
      ],
    );
  }
}
