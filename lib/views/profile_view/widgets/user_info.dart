import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/profile_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserInfo extends GetView<ProfileController> {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${controller.userData.usersName}',
          style: AppStyles.styleExtraBold24.copyWith(color: kTextColor),
        ),
        const Gap(5),
        Text('${controller.userData.usersEmail}'),
        const Gap(10),
      ],
    );
  }
}
