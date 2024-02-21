import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/repos/favorites_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  FavoritesRepo favoritesRepo = Get.put(FavoritesRepo());

  RequestState? requestState;
  MyServices myServices = Get.find<MyServices>();
  late String requestError;
  Map<String, String> isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addToFavorites(String itemId) async {
    requestState = RequestState.loading;
    update();
    var resulte = await favoritesRepo.addToFavorites(
        userId: myServices.sharedPreferences.getString("id") as String,
        itemId: itemId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      print('=========================================================');
      print("item added successfully");

      requestState = RequestState.success;
    });
    update();
  }

  removeFromFavorites(String itemId) async {
    requestState = RequestState.loading;
    update();
    var resulte = await favoritesRepo.removeFromFavorites(
        userId: myServices.sharedPreferences.getString("id") as String,
        itemId: itemId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      setFavorite(itemId, "0");
      print('=========================================================');
      print("item removed successfully");
      requestState = RequestState.success;
    });
    update();
  }
}
