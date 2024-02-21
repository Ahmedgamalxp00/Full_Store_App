import 'package:flutter/material.dart';
import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/repos/forget_password_repos/reset_password_repo.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController {
  ResetPassRepo resetPassRepo = Get.put(ResetPassRepo());
  bool isScure = false;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  RequestState? requestState;
  late String email;
  late String requestError;
  resetPassword() async {
    requestState = RequestState.loading;
    update();
    var resulte = await resetPassRepo.resetPassword(
      email: email,
      password: passwordController.text,
    );

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (status) {
      if (status == 1) {
        requestState = RequestState.success;
        Get.offAllNamed(AppRoute.successView);
      } else {
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: 'Unexpected error');
      }
    });
    update();
  }

  chanePassVisibility() {
    isScure = !isScure;
    update();
  }

  confirmPassValidator(
    String? value,
    int min,
    int max,
    String type,
  ) {
    if (value!.isEmpty) {
      return 'Feild can\'t be empty';
    }
    if (value != passwordController.text) {
      return 'Password does not match';
    }
  }

  @override
  void onInit() {
    confirmPasswordController = TextEditingController();
    passwordController = TextEditingController();
    email = Get.arguments['checkedEmail'];
    super.onInit();
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
