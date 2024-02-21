import 'package:flutter/material.dart';
import 'package:full_store_app/views/address_views/widgets/add_address_form.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
      ),
      body: const AddAddressForm(),
    );
  }
}
