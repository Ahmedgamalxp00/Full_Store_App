import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/home_controller.dart';
import 'package:full_store_app/core/shared/custom_appbar.dart';
import 'package:full_store_app/views/category_items_view/widgets/categories_items_list.dart';
import 'package:get/get.dart';

class TopSellingView extends StatelessWidget {
  const TopSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              ),
              SliverFillRemaining(child: GetBuilder<HomeController>(
                builder: (controller) {
                  return CategoriesItemsList(
                      categoryItems: controller.searchController.text.isNotEmpty
                          ? controller.searchItems
                          : controller.topSellingItems);
                },
              )),
            ],
          ),
          CustomAppBar(
            back: true,
            controller: homeController.searchController,
            onchange: (value) {
              homeController.addProductToSearchList(
                  searchName: value, items: homeController.topSellingItems);
            },
          ),
        ],
      ),
    );
  }
}
