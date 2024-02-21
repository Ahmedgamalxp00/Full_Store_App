import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/main_view_controller.dart';
import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/address_model/address_model.dart';
import 'package:full_store_app/data/repos/address_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  AddressRepo addressRepo = Get.put(AddressRepo());
  // CheckOutController checkOutController = Get.put(CheckOutController());
  GlobalKey<FormState> addressformKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController latController;
  late TextEditingController longController;
  RequestState? requestState;
  late String requestError;
  MyServices myServices = Get.find();
  List<AddressModel> addressList = [];

  viewAddress() async {
    addressList = [];
    requestState = RequestState.loading;
    update();
    var resulte = await addressRepo.view(
      userId: myServices.sharedPreferences.getString("id") as String,
    );

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      for (var item in data['data']) {
        addressList.add(AddressModel.fromJson(item));
      }
      requestState = RequestState.success;
    });
    update();
  }

  addAddress() async {
    if (addressformKey.currentState!.validate()) {
      addressformKey.currentState!.save();
      requestState = RequestState.loading;
      update();
      var resulte = await addressRepo.add(
          userId: myServices.sharedPreferences.getString("id") as String,
          name: nameController.text,
          city: cityController.text,
          street: streetController.text,
          lat: latController.text,
          long: longController.text);
      resulte.fold((failure) {
        requestError = failure.erorrMassage;
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: failure.erorrMassage);
      }, (data) {
        Get.offAllNamed(AppRoute.mainView);
        customDialog(title: 'Success', body: 'Address Added Successfully');

        // refreshData();
      });
      update();
    }
  }

  removeAddress(String addressId) async {
    update();
    var resulte = await addressRepo.remove(addressId: addressId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {});
    update();
  }

  refreshData() async {
    addressList = [];
    await viewAddress();
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    cityController = TextEditingController();
    streetController = TextEditingController();
    latController = TextEditingController();
    longController = TextEditingController();

    viewAddress();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    cityController.dispose();
    streetController.dispose();
    latController.dispose();
    longController.dispose();

    super.dispose();
  }
}
