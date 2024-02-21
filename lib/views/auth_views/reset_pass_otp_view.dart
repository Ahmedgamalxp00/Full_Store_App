import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:full_store_app/controllers/forget_pass_otp_controller.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ResetPassOtpView extends StatelessWidget {
  const ResetPassOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPassOtpController());
    return Scaffold(
      body: GetBuilder<ForgetPassOtpController>(
        builder: (controller) {
          if (controller.requestState == RequestState.loading) {
            return const CustomLoadingWidget1();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(50),
                  Text(
                    '47'.tr,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold36,
                  ),
                  const Gap(20),
                  Text('48'.tr,
                      textAlign: TextAlign.center,
                      style: AppStyles.styleMedium12),
                  const Gap(40),
                  OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(10),
                    numberOfFields: 5,
                    cursorColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    autoFocus: true,
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    // onCodeChanged: (String code) {
                    //   //handle validation or checks here
                    // },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.checkCode(verificationCode);
                    }, // end onSubmit
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
