import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/repos/auth_repos/otp_repo.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  OtpRepo otpRepo = Get.put(OtpRepo());
  late String email;
  RequestState? requestState;

  late String requestError;

  checkCode(String verifyCode) async {
    requestState = RequestState.loading;
    update();
    var resulte = await otpRepo.checkCode(
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
        Get.offAllNamed(AppRoute.successView);
      } else {
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: 'Unexpected Error');
      }
    });
    update();
  }

  resendVerifyCode() async {
    requestState = RequestState.loading;
    update();
    var resulte = await otpRepo.resendVerifyCode(
      email: email,
    );

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (status) {
      if (status == 1) {
        requestState = RequestState.success;
        customDialog(title: 'Success', body: 'Verify Code Sent Successfully');
      } else {
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: 'Unexpected Error');
      }
    });
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
