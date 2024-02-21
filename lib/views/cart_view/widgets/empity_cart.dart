import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:gap/gap.dart';

class EmpityCart extends StatelessWidget {
  const EmpityCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.add_shopping_cart_outlined,
            size: 100,
            color: kSecondaryColor,
          ),
          Gap(33),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Your Cart is ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Empity ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kPrimeryColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Go Home to add items',
            style: TextStyle(
              fontSize: 16,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
