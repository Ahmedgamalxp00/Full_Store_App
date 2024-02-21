import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/favorites_controller.dart';
import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/category_model/category_model.dart';
import 'package:full_store_app/data/models/items_model/item.dart';
import 'package:full_store_app/data/repos/home_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepo homeRepo = Get.put(HomeRepo());
  FavoritesController favoritesController = Get.put(FavoritesController());
  TextEditingController searchController = TextEditingController();
  RequestState? requestState;
  MyServices myServices = Get.find<MyServices>();
  late String requestError;

  List<ItemModel> specialOfferItems = [];
  List<ItemModel> topSellingItems = [];
  List<ItemModel> items = [];
  List<CategoryModel> categories = [];
  List<ItemModel> searchItems = [];

  getAllData() async {
    requestState = RequestState.loading;
    update();
    var resulte = await homeRepo
        .getAllData(myServices.sharedPreferences.getString("id") as String);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      for (var item in data['categories']) {
        categories.add(CategoryModel.fromJson(item));
      }
      for (var item in data['items']) {
        items.add(ItemModel.fromJson(item));
      }
      for (var item in data['topselling']) {
        topSellingItems.add(ItemModel.fromJson(item));
      }
      for (var item in items) {
        favoritesController.isFavorite['${item.itemsId}'] = '${item.favorite}';
        if (item.itemsDiscount != 0) {
          specialOfferItems.add(item);
        }
      }
      requestState = RequestState.success;
    });
    update();
  }

  void addProductToSearchList({
    required String searchName,
    required List<ItemModel> items,
  }) {
    searchName.toLowerCase();
    searchItems = items.where((element) {
      String title = element.itemsName!.toLowerCase();
      String price = element.itemsPrice!.toString().toLowerCase();
      String priceAfterDiscount =
          element.itemsPriceAfterDiscount!.toString().toLowerCase();
      return title.contains(searchName) ||
          price.contains(searchName) ||
          priceAfterDiscount.contains(searchName);
    }).toList();
    update();
  }

  @override
  void onInit() {
    getAllData();
    super.onInit();
  }
}
