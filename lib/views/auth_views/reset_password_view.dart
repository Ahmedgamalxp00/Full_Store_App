import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/reset_pass_controller.dart';
import 'package:full_store_app/core/functions/validate_formfield.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/core/shared/custom_formfiled.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPassController resetPasswordController =
        Get.put(ResetPassController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<ResetPassController>(
            builder: (controller) {
              if (controller.requestState == RequestState.loading) {
                return const CustomLoadingWidget1();
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(50),
                    Text(
                      '49'.tr,
                      textAlign: TextAlign.start,
                      style: AppStyles.styleBold36,
                    ),
                    const Gap(50),
                    GetBuilder<ResetPassController>(builder: (controller) {
                      return Column(
                        children: [
                          Customformfield(
                            obscuretext: controller.isScure,
                            onSuffixTap: () {
                              controller.chanePassVisibility();
                            },
                            validator: (value) {
                              return validateInput(value!, 8, 20, 'password');
                            },
                            controller:
                                resetPasswordController.passwordController,
                            hint: '35'.tr,
                            prefixIcon: Icons.lock,
                            suffixIcon: controller.isScure
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
                          ),
                          const Gap(20),
                          Customformfield(
                            obscuretext: controller.isScure,
                            onSuffixTap: () {
                              controller.chanePassVisibility();
                            },
                            validator: (value) {
                              return controller.confirmPassValidator(
                                  value, 8, 20, 'confirm password');
                            },
                            controller: resetPasswordController
                                .confirmPasswordController,
                            hint: '40'.tr,
                            prefixIcon: Icons.lock,
                            suffixIcon: controller.isScure
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
                          ),
                        ],
                      );
                    }),
                    const Gap(50),
                    CustomBottn(
                      text: '33'.tr,
                      onTap: () {
                        resetPasswordController.resetPassword();
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
