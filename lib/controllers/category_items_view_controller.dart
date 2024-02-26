import 'package:flutter/material.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/category_model/category_model.dart';
import 'package:full_store_app/data/models/items_model/item.dart';
import 'package:full_store_app/data/repos/category_items_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class CategoryItemsViewController extends GetxController {
  CategoryItemsRepo categoryItemsRepo = Get.put(CategoryItemsRepo());

  RequestState? requestState;

  late String requestError;
  List<CategoryModel> categoies = [];
  late int currentCat;
  late ScrollController categoriesScrollController;
  MyServices myServices = Get.find<MyServices>();
  List<ItemModel> categoryItems = [];
  List<ItemModel> searchItems = [];
  TextEditingController searchController = TextEditingController();

  changeCategory(int index) async {
    if (currentCat != index) {
      categoryItems.clear();
      currentCat = index;
      await getCategoryItems();
      update();
    }
  }

  getCategoryItems() async {
    requestState = RequestState.loading;
    update();
    var resulte = await categoryItemsRepo.getCategoryItems(
        userId: myServices.sharedPreferences.getString("id") as String,
        categoryId: "${categoies[currentCat].categoriesId}");

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
    }, (data) {
      for (var item in data['data']) {
        categoryItems.add(ItemModel.fromJson(item));
      }
      requestState = RequestState.success;
    });
    update();
  }

  void addProductToSearchList({
    required String searchName,
  }) {
    searchName.toLowerCase();
    searchItems = categoryItems.where((element) {
      String title = element.itemsName!.toLowerCase();
      String price = element.itemsPrice!.toString().toLowerCase();
      return title.contains(searchName) || price.contains(searchName);
    }).toList();
    update();
  }

  inialData() {
    categoies = Get.arguments["categories"];
    currentCat = Get.arguments["currentcat"];
  }

  @override
  void onInit() {
    inialData();
    getCategoryItems();
    categoriesScrollController =
        ScrollController(initialScrollOffset: 50 * currentCat.toDouble());
    super.onInit();
  }
}
