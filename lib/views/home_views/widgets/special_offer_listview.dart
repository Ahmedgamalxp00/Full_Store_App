import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/home_controller.dart';
import 'package:full_store_app/views/home_views/widgets/special_offer_card.dart';
import 'package:get/get.dart';

class SpecialOfferListView extends StatelessWidget {
  const SpecialOfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          height: 110,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: controller.specialOfferItems.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 20,
              );
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpecialOfferCard(
                    item: controller.specialOfferItems[index],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
