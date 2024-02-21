import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:get/get.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                const Spacer(),
                Text(
                  '32'.tr,
                  style: AppStyles.styleBold36,
                ),
                const Spacer(),
                const Center(
                  child: Icon(
                    Icons.check_circle_outlined,
                    size: 220,
                    color: kPrimeryColor,
                  ),
                ),
                const Spacer(),
                CustomBottn(
                  text: '31'.tr,
                  onTap: () {
                    Get.offAllNamed(
                      AppRoute.loginView,
                    );
                  },
                ),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
