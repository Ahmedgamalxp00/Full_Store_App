import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/order_model/order_model.dart';
import 'package:full_store_app/data/repos/orders_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  OrderRepo orderRepo = Get.put(OrderRepo());

  RequestState? requestState;
  late String requestError;
  MyServices myServices = Get.find();
  List<OrderModel> ordersList = [];
  List<OrderModel> archivedList = [];
  List<OrderModel> pendingList = [];

  printOrderStatus(String value) {
    if (value == '0') {
      return "Pending approval";
    } else if (value == '1') {
      return "Order being prepared";
    } else if (value == '2') {
      return "order ready for delivery";
    } else if (value == '3') {
      return "Order on the way";
    } else {
      return "Oreder archived";
    }
  }

  viewOrders() async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderRepo.view(
      userId: myServices.sharedPreferences.getString("id") as String,
    );
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      data['data'].sort((a, b) {
        return DateTime.parse(b['orders_datetime'])
            .compareTo(DateTime.parse(a['orders_datetime']));
      });

      for (var item in data['data']) {
        ordersList.add(OrderModel.fromJson(item));
      }
      for (var item in ordersList) {
        if (item.ordersStatus == 4) {
          archivedList.add(item);
        }
        if (item.ordersStatus != 4) {
          pendingList.add(item);
        }
      }

      requestState = RequestState.success;
    });
    update();
  }

  removeOrder(String orderId) async {
    var resulte = await orderRepo.remove(orderId: orderId);
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
    }, (data) {
      pendingList.removeWhere((element) => '${element.ordersId}' == orderId);
    });
    update();
  }

  refreshOrdersView() {
    ordersList = [];
    archivedList = [];
    pendingList = [];
    viewOrders();
  }

  @override
  void onInit() {
    viewOrders();
    super.onInit();
  }
}
