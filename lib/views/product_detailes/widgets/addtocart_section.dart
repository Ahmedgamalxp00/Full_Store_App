import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/main_view_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:get/get.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainViewController mainViewController = Get.put(MainViewController());
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: MaterialButton(
                color: kPrimeryColor,
                onPressed: () async {
                  await mainViewController.onTabChange(2);
                  Get.offNamed(AppRoute.mainView);
                },
                child: const Text(
                  'Go To Cart',
                  style: AppStyles.styleSemiBold20,
                )),
          ),
        ),
      ),
    );
  }
}
