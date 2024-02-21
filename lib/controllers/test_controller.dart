import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/repos/auth_repos/test_repo.dart';

import 'package:get/get.dart';

class TestController extends GetxController {
  TestRepo testRepo = Get.put(TestRepo());
  RequestState? requestState;
  List myUsers = [];
  late String requestError;
  getUsers() async {
    requestState = RequestState.loading;
    update();
    var resulte = await testRepo.getAllUsers();
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
    }, (users) {
      for (var item in users) {
        myUsers.add(item);
      }
      requestState = RequestState.success;
    });
    update();
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
