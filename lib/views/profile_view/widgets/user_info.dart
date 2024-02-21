import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Ahmed Gamal',
          style: AppStyles.styleExtraBold24.copyWith(color: kTextColor),
        ),
        const Gap(5),
        const Text('myrealpage00@gmail.com'),
        const Gap(10),
      ],
    );
  }
}
