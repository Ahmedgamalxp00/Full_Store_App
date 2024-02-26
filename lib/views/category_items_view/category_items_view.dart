import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/category_items_view_controller.dart';
import 'package:full_store_app/core/shared/custom_appbar.dart';
import 'package:full_store_app/views/category_items_view/widgets/Categories_list.dart';
import 'package:full_store_app/views/category_items_view/widgets/categories_items_list.dart';
import 'package:get/get.dart';

class CategoryItemsView extends StatelessWidget {
  const CategoryItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryItemsViewController itemsViewController =
        Get.put(CategoryItemsViewController());
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 120),
              ),
              const SliverToBoxAdapter(
                child: CategoriesList(),
              ),
              SliverFillRemaining(
                  child: GetBuilder<CategoryItemsViewController>(
                builder: (controller) {
                  return CategoriesItemsList(
                      categoryItems: controller.searchController.text.isNotEmpty
                          ? controller.searchItems
                          : controller.categoryItems);
                },
              )),
            ],
          ),
          CustomAppBar(
            back: true,
            controller: itemsViewController.searchController,
            onchange: (value) {
              itemsViewController.addProductToSearchList(searchName: value);
            },
          ),
        ],
      ),
    );
  }
}
