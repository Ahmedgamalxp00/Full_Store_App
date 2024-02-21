import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/address_controller.dart';
import 'package:full_store_app/controllers/main_view_controller.dart';
import 'package:full_store_app/core/functions/validate_formfield.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:full_store_app/views/address_views/widgets/address_formfiled.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    AddressController addressController = Get.put(AddressController());
    MainViewController mainViewController = Get.put(MainViewController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: addressController.addressformKey,
          child: Column(
            children: [
              AddressFormfield(
                validator: (value) => validateInput(value, 2, 50, ''),
                keyboardType: TextInputType.name,
                hint: 'Name',
                controller: addressController.nameController,
              ),
              const Gap(10),
              AddressFormfield(
                validator: (value) => validateInput(value, 2, 50, ''),
                keyboardType: TextInputType.text,
                hint: 'City',
                controller: addressController.cityController,
              ),
              const Gap(10),
              AddressFormfield(
                validator: (value) => validateInput(value, 2, 50, ''),
                keyboardType: TextInputType.text,
                hint: 'Street',
                controller: addressController.streetController,
              ),
              const Gap(10),
              AddressFormfield(
                validator: (value) => validateInput(value, 2, 50, ''),
                keyboardType: TextInputType.number,
                hint: 'latitude',
                controller: addressController.latController,
              ),
              const Gap(10),
              AddressFormfield(
                validator: (value) => validateInput(value, 2, 50, ''),
                keyboardType: TextInputType.number,
                hint: 'longitude',
                controller: addressController.longController,
              ),
              const Gap(20),
              CustomBottn(
                text: 'Add Address',
                onTap: () async {
                  await addressController.addAddress();
                  mainViewController.onTabChange(0);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
