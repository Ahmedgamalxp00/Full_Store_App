import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/address_controller.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/views/address_views/widgets/address_listview.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body: const AddressListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.toNamed(AppRoute.addAddressView);
        },
      ),
    );
  }
}
