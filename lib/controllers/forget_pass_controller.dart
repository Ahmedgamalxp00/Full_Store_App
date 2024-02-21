import 'package:flutter/material.dart';
import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/repos/forget_password_repos/chech_email_repo.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  CheckEmailRepo checkEmailRepo = Get.put(CheckEmailRepo());
  late TextEditingController emailController;
  RequestState? requestState;

  late String requestError;
  chechEmail() async {
    requestState = RequestState.loading;
    update();
    var resulte = await checkEmailRepo.checkEmail(
      email: emailController.text,
    );

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (status) {
      if (status == 1) {
        requestState = RequestState.success;
        Get.toNamed(AppRoute.forgetPassotpView,
            arguments: {'checkedEmail': emailController.text});
      } else {
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: 'Unexpected error');
      }
    });
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }
}
