import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/address_controller.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/views/address_views/widgets/predictions_listview.dart';
import 'package:full_store_app/views/address_views/widgets/search_formFiled.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatelessWidget {
  const GoogleMapsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return GetBuilder<AddressController>(builder: (addressController) {
      return SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            GoogleMap(
                markers: addressController.markers,
                onTap: (position) {
                  addressController.addMarker(position);
                },
                onMapCreated: (controller) {
                  addressController.mapController = controller;
                  addressController.updateCurrentLocation();
                },
                zoomControlsEnabled: false,
                initialCameraPosition: addressController.initialCameraPosition),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(Icons.arrow_back_ios_sharp),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SearchFormFiled(
                            controller: addressController.searchController),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (addressController.searchController.text.isNotEmpty)
                    PredictionsListView(
                      predictions: addressController.predictionsList,
                    )
                ],
              ),
            ),
            if (addressController.lat != null || addressController.long != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomBottn(
                    text: 'Continue',
                    onTap: () {
                      Get.toNamed(AppRoute.addAddressView);
                    },
                  ),
                ),
              )
          ],
        )),
      );
    });
  }
}
