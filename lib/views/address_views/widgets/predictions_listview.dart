import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/address_controller.dart';
import 'package:full_store_app/data/models/place_model/place_model.dart';
import 'package:get/get.dart';

class PredictionsListView extends StatelessWidget {
  const PredictionsListView({super.key, required this.predictions});
  final List<PlaceModel> predictions;
  @override
  Widget build(BuildContext context) {
    Get.find<AddressController>();
    return GetBuilder<AddressController>(builder: (controller) {
      return Expanded(
        child: Container(
          color: Colors.white,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.getLocationDetailes(
                        '${predictions[index].description}');
                  },
                  child: ListTile(
                    leading: const Icon(Icons.place_outlined),
                    trailing: const Icon(Icons.arrow_forward),
                    title: Text('${predictions[index].description}'),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                    height: 0,
                  ),
              itemCount: predictions.length),
        ),
      );
    });
  }
}
