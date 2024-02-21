import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/items_model/item.dart';
import 'package:full_store_app/data/repos/cart_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class ProductDetailesController extends GetxController {
  late ItemModel product;
  CartRepo cartRepo = Get.put(CartRepo());
  int itemcount = 1;
  RequestState? requestState;
  MyServices myServices = Get.find<MyServices>();
  late String requestError;

  bool seeMore = false;
  seeMoreDetailes() {
    seeMore = !seeMore;
    update();
  }

  addToCart(String itemId) async {
    var resulte = await cartRepo.addToCart(
        userId: myServices.sharedPreferences.getString("id") as String,
        itemId: itemId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      print('=========================================================');
      print("item added successfully");
    });
  }

  removeFromCart(String itemId) async {
    var resulte = await cartRepo.removeFromCart(
        userId: myServices.sharedPreferences.getString("id") as String,
        itemId: itemId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      print('=========================================================');
      print("item removed successfully");
    });
  }

  getItemCount(String itemId) async {
    requestState = RequestState.loading;
    update();
    var resulte = await cartRepo.getItemCount(
        userId: myServices.sharedPreferences.getString("id") as String,
        itemId: itemId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      requestState = RequestState.success;
      print(data['data']);
      itemcount = data['data'];
    });
    update();
  }

  inialData() async {
    requestState = RequestState.loading;
    product = Get.arguments["item"];
    await getItemCount('${product.itemsId}');
    requestState = RequestState.success;
    update();
  }

  add() {
    itemcount++;
    update();
    addToCart('${product.itemsId}');
  }

  remove() {
    if (itemcount > 0) {
      itemcount--;
      update();
      removeFromCart('${product.itemsId}');
    }
  }

  @override
  void onInit() {
    inialData();

    super.onInit();
  }
}
