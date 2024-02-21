import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/data/models/address_model/address_model.dart';

class AddressListViewItem extends StatelessWidget {
  const AddressListViewItem(
      {super.key, required this.address, this.onDeleteTap});
  final AddressModel address;
  final void Function()? onDeleteTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          '${address.adressName}',
          style: AppStyles.styleSemiBold18.copyWith(color: kTextColor),
        ),
        subtitle: Text(
          '${address.adressCity} , ${address.adressStreet}',
          style: AppStyles.styleSemiBold14,
        ),
        trailing:
            IconButton(onPressed: onDeleteTap, icon: const Icon(Icons.delete)),
      ),
    );
  }
}
