import 'package:flutter/material.dart';
import 'package:full_store_app/core/shared/rounded_btn.dart';

class ProductCount extends StatelessWidget {
  const ProductCount(
      {super.key, this.onAddTap, this.onRemoveTap, required this.itemCount});
  final void Function()? onAddTap;
  final void Function()? onRemoveTap;
  final String itemCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedBTN(
          width: 30,
          height: 30,
          color: Colors.white,
          icon: Icons.add,
          ontap: onAddTap,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            itemCount,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        RoundedBTN(
          width: 30,
          height: 30,
          color: Colors.white,
          icon: Icons.remove,
          ontap: onRemoveTap,
        ),
      ],
    );
  }
}
