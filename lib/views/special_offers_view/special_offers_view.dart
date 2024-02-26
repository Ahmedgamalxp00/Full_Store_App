import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/home_controller.dart';
import 'package:full_store_app/core/shared/custom_appbar.dart';
import 'package:full_store_app/views/special_offers_view/widgets/special_offers_grid.dart';
import 'package:get/get.dart';

class SpecialOffersView extends StatelessWidget {
  const SpecialOffersView({super.key});

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
                  return SpecialOffersGrid(
                      items: controller.searchController.text.isNotEmpty
                          ? controller.searchItems
                          : controller.specialOfferItems);
                },
              )),
            ],
          ),
          CustomAppBar(
            back: true,
            controller: homeController.searchController,
            onchange: (value) {
              homeController.addProductToSearchList(
                  searchName: value, items: homeController.specialOfferItems);
            },
          ),
        ],
      ),
    );
  }
}
