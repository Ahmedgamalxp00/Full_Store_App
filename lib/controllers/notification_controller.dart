import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/notification_model/notification_model.dart';
import 'package:full_store_app/data/repos/notification_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationRepo notificationRepo = Get.put(NotificationRepo());

  RequestState? requestState;
  late String requestError;
  MyServices myServices = Get.find();
  List<NotificationModel> notificationList = [];

  viewNotification() async {
    notificationList = [];
    requestState = RequestState.loading;
    update();
    var resulte = await notificationRepo.view(
      userId: myServices.sharedPreferences.getString("id") as String,
    );

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      data['data'].sort((a, b) {
        return DateTime.parse(b['notification_datetime'])
            .compareTo(DateTime.parse(a['notification_datetime']));
      });
      for (var item in data['data']) {
        notificationList.add(NotificationModel.fromJson(item));
      }
      requestState = RequestState.success;
    });
    update();
  }

  removeNotification(String notificationId) async {
    var resulte = await notificationRepo.remove(notificationId: notificationId);
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
    }, (data) {
      notificationList.removeWhere(
          (element) => '${element.notificationId}' == notificationId);
    });
    update();
  }

  refreshData() async {
    notificationList = [];
    await viewNotification();
  }

  @override
  void onInit() {
    viewNotification();
    super.onInit();
  }
}
