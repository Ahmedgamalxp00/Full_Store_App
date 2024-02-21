import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/items_view_controller.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:get/get.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ItemsViewController>();
    return GetBuilder<ItemsViewController>(
      builder: (controller) {
        return SizedBox(
          height: 35,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            controller: controller.categoriesScrollController,
            scrollDirection: Axis.horizontal,
            itemCount: controller.categoies.length,
            itemBuilder: (context, index) => CategoryItem(
              ontap: () {
                controller.changeCategory(index);
                controller
                    .getData(controller.categoies[index].categoriesId as int);
              },
              categoryName:
                  controller.categoies[index].categoriesName as String,
              active: controller.currentCat == index ? true : false,
            ),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 20,
              );
            },
          ),
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.categoryName,
      required this.active,
      this.ontap});
  final String categoryName;
  final bool active;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        decoration: BoxDecoration(
            border: active
                ? const Border(
                    bottom: BorderSide(
                    color: Colors.red,
                    width: 5,
                  ))
                : const Border()),
        duration: const Duration(microseconds: 9000),
        curve: Curves.easeInOut,
        child: Text(
          categoryName,
          style: AppStyles.styleSemiBold18,
        ),
      ),
    );
  }
}
