import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/login_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/functions/eixt_app_alert.dart';
import 'package:full_store_app/core/functions/validate_formfield.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/core/shared/custom_formfiled.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/views/auth_views/widgets/auth_footer.dart';
import 'package:full_store_app/views/auth_views/widgets/social_section.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitAppAlert();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<LoginController>(
              builder: (controller) {
                if (controller.requestState == RequestState.loading) {
                  return const CustomLoadingWidget1();
                } else {
                  return Form(
                    key: loginController.loginformKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(50),
                        Text(
                          '10'.tr,
                          textAlign: TextAlign.start,
                          style: AppStyles.styleBold36,
                        ),
                        const Gap(40),
                        Customformfield(
                          validator: (value) {
                            return validateInput(value!, 5, 30, 'email');
                          },
                          controller: loginController.emailController,
                          hint: '12'.tr,
                          prefixIcon: Icons.email,
                        ),
                        const Gap(20),
                        GetBuilder<LoginController>(
                          builder: (controller) {
                            return Customformfield(
                              onSuffixTap: () {
                                controller.chanePassVisibility();
                              },
                              obscuretext: controller.isScure,
                              validator: (value) {
                                return validateInput(value!, 5, 20, 'password');
                              },
                              controller: controller.passwordController,
                              hint: '13'.tr,
                              prefixIcon: Icons.lock,
                              suffixIcon: controller.isScure
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                            );
                          },
                        ),
                        const Gap(10),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.forgetPassView);
                            },
                            child: Text(
                              '14'.tr,
                              textAlign: TextAlign.end,
                              style: AppStyles.styleSemiBold14.copyWith(
                                  color: kPrimeryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kPrimeryColor),
                            ),
                          ),
                        ),
                        const Gap(50),
                        CustomBottn(
                          text: '15'.tr,
                          onTap: () async {
                            await loginController.login();
                          },
                        ),
                        const Gap(50),
                        const Align(
                          alignment: Alignment.center,
                          child: ScocialSection(),
                        ),
                        AuthFooter(
                          onPressed: () {
                            Get.offNamed(AppRoute.signUp);
                          },
                          text1: '16'.tr,
                          text2: '9'.tr,
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
