import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/category_items_view_controller.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/shared/empty_widget.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/items_model/item.dart';

import 'package:full_store_app/views/home_views/widgets/product_item2.dart';
import 'package:get/get.dart';

class CategoriesItemsList extends StatelessWidget {
  const CategoriesItemsList({super.key, required this.categoryItems});
  final List<ItemModel> categoryItems;
  @override
  Widget build(BuildContext context) {
    Get.find<CategoryItemsViewController>();
    return GetBuilder<CategoryItemsViewController>(builder: (controller) {
      if (controller.requestState == RequestState.loading) {
        return const CustomLoadingWidget1();
      } else if (controller.requestState == RequestState.failure) {
        return const CustomEmptyWidget();
      } else {
        return GridView.builder(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return ProductItem2(
                item: categoryItems[index],
              );
            },
            itemCount: categoryItems.length);
      }
    });
  }
}
