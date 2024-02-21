import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/cart_model/cart_model.dart';
import 'package:full_store_app/data/models/order_model/order_model.dart';
import 'package:full_store_app/data/repos/order_details_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  OrderDetailsRepo orderDetailsRepo = Get.put(OrderDetailsRepo());

  RequestState? requestState;
  late String requestError;
  MyServices myServices = Get.find();
  late OrderModel order;
  List<CartModel> itemsList = [];

  viewOrderDetails() async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderDetailsRepo.view(
      orderId: "${order.ordersId}",
    );
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      for (var item in data['data']) {
        itemsList.add(CartModel.fromJson(item));
      }

      requestState = RequestState.success;
    });
    update();
  }

  // refreshOrdersView() {
  //   ordersList = [];
  //   viewOrders();
  // }

  @override
  void onInit() {
    order = Get.arguments["order"];
    viewOrderDetails();

    super.onInit();
  }
}
