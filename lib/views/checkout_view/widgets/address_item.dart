import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';

class AddressItem extends StatelessWidget {
  const AddressItem(
      {super.key,
      required this.addressName,
      required this.addressCity,
      required this.addressStreet,
      this.onTap,
      required this.active});
  final String addressName;
  final String addressCity;
  final String addressStreet;
  final void Function()? onTap;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: AnimatedContainer(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: active == true
                ? kPrimeryColor
                : kSecondaryColor.withOpacity(0.1),
          ),
          duration: const Duration(milliseconds: 500),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            title: Text(
              addressName,
              style: AppStyles.styleSemiBold18
                  .copyWith(color: active == true ? Colors.white : kTextColor),
            ),
            subtitle: Text(
              '$addressCity , $addressStreet',
              style: AppStyles.styleSemiBold14
                  .copyWith(color: active == true ? Colors.white : null),
            ),
          ),
        ),
      ),
    );
  }
}
