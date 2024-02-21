import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/forget_pass_controller.dart';
import 'package:full_store_app/core/functions/validate_formfield.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/core/shared/custom_formfiled.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPassController forgetPassController = Get.put(ForgetPassController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<ForgetPassController>(
          builder: (controller) {
            if (controller.requestState == RequestState.loading) {
              return const CustomLoadingWidget1();
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(50),
                  Text(
                    '14'.tr,
                    textAlign: TextAlign.start,
                    style: AppStyles.styleBold36,
                  ),
                  const Gap(40),
                  Customformfield(
                    validator: (value) {
                      return validateInput(value!, 5, 30, 'email');
                    },
                    controller: forgetPassController.emailController,
                    hint: '45'.tr,
                    prefixIcon: Icons.email,
                  ),
                  const Gap(20),
                  Text('29'.tr, style: AppStyles.styleMedium12),
                  const Gap(50),
                  CustomBottn(
                    text: '46'.tr,
                    onTap: () async {
                      await forgetPassController.chechEmail();
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
