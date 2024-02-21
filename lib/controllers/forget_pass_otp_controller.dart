import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/repos/forget_password_repos/verify_code_repo.dart';
import 'package:get/get.dart';

class ForgetPassOtpController extends GetxController {
  VerifyCodeRepo verifyCodeRepo = Get.put(VerifyCodeRepo());
  late String email;
  RequestState? requestState;
  late String requestError;

  checkCode(String verifyCode) async {
    requestState = RequestState.loading;
    update();
    var resulte = await verifyCodeRepo.checkCode(
      email: email,
      verifyCode: verifyCode,
    );

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (status) {
      if (status == 1) {
        requestState = RequestState.success;
        Get.toNamed(AppRoute.resetPassword, arguments: {'checkedEmail': email});
      } else {
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: 'Unexpected Error');
      }
    });
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['checkedEmail'];
    super.onInit();
  }
}
