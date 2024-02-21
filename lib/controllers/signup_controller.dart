import 'package:flutter/material.dart';
import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/repos/auth_repos/signup_repo.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  SignUpRepo signUpRepo = Get.put(SignUpRepo());

  bool isScure = false;
  GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController userNameController;
  late TextEditingController phoneController;

  RequestState? requestState;
  String status = '';
  late String requestError;

  signup() async {
    if (signUpformKey.currentState!.validate()) {
      signUpformKey.currentState!.save();
      requestState = RequestState.loading;
      update();
      var resulte = await signUpRepo.signUp(
          name: userNameController.text,
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text);
      resulte.fold((failure) {
        requestError = failure.erorrMassage;
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: failure.erorrMassage);
      }, (status) {
        if (status == 1) {
          requestState = RequestState.success;
          Get.toNamed(AppRoute.otpView,
              arguments: {'email': emailController.text});
        } else {
          requestState = RequestState.failure;
          customDialog(title: 'Error', body: 'Unexpected error');
        }
      });
      update();
    }
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
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    userNameController.dispose();
    userNameController.dispose();
    super.dispose();
  }
}
