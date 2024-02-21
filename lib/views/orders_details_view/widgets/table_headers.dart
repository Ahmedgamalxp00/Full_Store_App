import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';

class TableHeaders extends StatelessWidget {
  const TableHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Items',
            style: AppStyles.styleSemiBold18.copyWith(color: kPrimeryColor)),
        Text('QTY',
            style: AppStyles.styleSemiBold18.copyWith(color: kPrimeryColor)),
        Text('Price',
            style: AppStyles.styleSemiBold18.copyWith(color: kPrimeryColor)),
      ],
    );
  }
}
