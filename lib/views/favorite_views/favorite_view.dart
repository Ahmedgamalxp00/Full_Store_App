import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/myfavorite_controller.dart';
import 'package:full_store_app/core/functions/eixt_app_alert.dart';
import 'package:full_store_app/core/shared/custom_appbar.dart';
import 'package:full_store_app/views/favorite_views/myfavorite_view_list.dart';
import 'package:get/get.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyFavoritesController(), fenix: true);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitAppAlert();
      },
      child: GetBuilder<MyFavoritesController>(builder: (controller) {
        return Scaffold(
            body: Stack(
          children: [
            MyFavoriteViewList(
                myFavorites: controller.searchController.text.isNotEmpty
                    ? controller.searchItems
                    : controller.myFavorites),
            CustomAppBar(
              controller: controller.searchController,
              onchange: (value) {
                controller.addProductToSearchList(searchName: value);
              },
            ),
          ],
        ));
      }),
    );
  }
}
