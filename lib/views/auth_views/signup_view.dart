import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/signup_controller.dart';
import 'package:full_store_app/core/functions/eixt_app_alert.dart';
import 'package:full_store_app/core/functions/validate_formfield.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/core/shared/custom_formfiled.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/views/auth_views/widgets/agree_terms.dart';
import 'package:full_store_app/views/auth_views/widgets/auth_footer.dart';
import 'package:full_store_app/views/auth_views/widgets/social_section.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => exitAppAlert(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<SignUpController>(
              builder: (controller) {
                if (controller.requestState == RequestState.loading) {
                  return const CustomLoadingWidget1();
                } else {
                  return Form(
                    key: controller.signUpformKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(50),
                        Text(
                          '17'.tr,
                          textAlign: TextAlign.start,
                          style: AppStyles.styleBold36,
                        ),
                        const Gap(20),
                        Customformfield(
                          validator: (value) {
                            return validateInput(value!, 5, 30, 'username');
                          },
                          controller: controller.userNameController,
                          hint: '20'.tr,
                          prefixIcon: Icons.person_2_rounded,
                        ),
                        const Gap(20),
                        Customformfield(
                          validator: (value) {
                            return validateInput(value!, 5, 50, 'email');
                          },
                          controller: controller.emailController,
                          hint: '18'.tr,
                          prefixIcon: Icons.email,
                        ),
                        const Gap(20),
                        Customformfield(
                          validator: (value) {
                            return validateInput(value!, 5, 12, 'phone');
                          },
                          controller: controller.phoneController,
                          hint: '21'.tr,
                          prefixIcon: Icons.phone,
                        ),
                        const Gap(20),
                        GetBuilder<SignUpController>(builder: (controller) {
                          return Column(
                            children: [
                              Customformfield(
                                obscuretext: controller.isScure,
                                onSuffixTap: () {
                                  controller.chanePassVisibility();
                                },
                                validator: (value) {
                                  return validateInput(
                                      value!, 8, 20, 'password');
                                },
                                controller: controller.passwordController,
                                hint: '19'.tr,
                                prefixIcon: Icons.lock,
                                suffixIcon: controller.isScure
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined,
                              ),
                              const Gap(20),
                              Customformfield(
                                onSuffixTap: () {
                                  controller.chanePassVisibility();
                                },
                                obscuretext: controller.isScure,
                                validator: (value) {
                                  return controller.confirmPassValidator(
                                      value, 8, 20, 'password');
                                },
                                controller:
                                    controller.confirmPasswordController,
                                hint: '40'.tr,
                                prefixIcon: Icons.lock,
                                suffixIcon: controller.isScure
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined,
                              ),
                            ],
                          );
                        }),
                        const Gap(10),
                        const AgreeTrems(),
                        const Gap(20),
                        CustomBottn(
                          text: '42'.tr,
                          onTap: () async {
                            await controller.signup();
                          },
                        ),
                        const Gap(20),
                        const Align(
                          alignment: Alignment.center,
                          child: ScocialSection(),
                        ),
                        AuthFooter(
                          onPressed: () {
                            Get.offNamed(AppRoute.loginView);
                          },
                          text1: '25'.tr,
                          text2: '26'.tr,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
