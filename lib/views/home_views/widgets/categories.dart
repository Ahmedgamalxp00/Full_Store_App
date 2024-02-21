import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/home_controller.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/views/home_views/widgets/category_item.dart';
import 'package:get/get.dart';

class Categories extends GetView<HomeController> {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            image: controller.categories[index].categoriesImage,
            text: controller.categories[index].categoriesName,
            press: () {
              Get.toNamed(AppRoute.itemsView, arguments: {
                "categories": controller.categories,
                "currentcat": index
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}
