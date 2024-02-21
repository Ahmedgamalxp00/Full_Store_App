import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/home_controller.dart';
import 'package:full_store_app/views/home_views/widgets/product_item2.dart';
import 'package:get/get.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return GetBuilder<HomeController>(builder: (controller) {
      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return ProductItem2(
            item: controller.searchItems[index],
          );
        },
        itemCount: controller.searchItems.length,
      );
    });
  }
}
