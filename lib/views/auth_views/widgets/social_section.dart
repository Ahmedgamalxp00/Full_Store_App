import 'package:flutter/material.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/views/auth_views/widgets/social_item.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ScocialSection extends StatelessWidget {
  const ScocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '39'.tr,
          style: AppStyles.styleMedium12,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Socialitem(icon: Assets.imagesGoogleIcon),
              Gap(10),
              Socialitem(icon: Assets.imagesFacebookIcon),
            ],
          ),
        )
      ],
    );
  }
}
