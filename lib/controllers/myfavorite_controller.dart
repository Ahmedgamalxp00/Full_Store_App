import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/favorites_controller.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/my_favorite/my_favorite.dart';
import 'package:full_store_app/data/repos/myfavorite_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class MyFavoritesController extends GetxController {
  MyFavoritesRepo myFavoritesRepo = Get.put(MyFavoritesRepo());
  MyServices myServices = Get.find<MyServices>();
  FavoritesController favoritesController = Get.put(FavoritesController());
  TextEditingController searchController = TextEditingController();
  List<MyFavoriteModel> myFavorites = [];
  List<MyFavoriteModel> searchItems = [];

  RequestState? requestState;

  late String requestError;

  viewFavorites() async {
    requestState = RequestState.loading;
    update();
    var resulte = await myFavoritesRepo.viewFavorites(
      userId: myServices.sharedPreferences.getString("id") as String,
    );

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
    }, (data) {
      for (var item in data['data']) {
        myFavorites.add(MyFavoriteModel.fromJson(item));
      }
      requestState = RequestState.success;
    });
    update();
  }

  deleteFromMyFavorites(String itemId) {
    myFavoritesRepo.deleteFromMyFavorites(
        userId: myServices.sharedPreferences.getString("id") as String,
        itemId: itemId);
    myFavorites.removeWhere((element) => '${element.itemsId}' == itemId);
    favoritesController.setFavorite(itemId, "0");

    update();
  }

  void addProductToSearchList({
    required String searchName,
  }) {
    searchItems.clear();
    searchName.toLowerCase();
    searchItems = myFavorites.where((element) {
      String title = element.itemsName!.toLowerCase();
      String price = element.itemsPrice!.toString().toLowerCase();
      return title.contains(searchName) || price.contains(searchName);
    }).toList();
    update();
  }

  @override
  void onInit() {
    viewFavorites();
    super.onInit();
  }
}
