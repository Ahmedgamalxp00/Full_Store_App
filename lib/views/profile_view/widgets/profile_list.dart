import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/profile_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/views/profile_view/widgets/profile_list_item.dart';
import 'package:get/get.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          GetBuilder<ProfileController>(builder: (controller) {
            return ProfileListItem(
              title: 'Notifications',
              icon: Icons.notifications_none_outlined,
              leading: Switch(
                activeColor: kPrimeryColor,
                value: controller.switchValue,
                onChanged: (value) {
                  controller.switchValue = value;
                  controller.changeNotification();
                },
              ),
            );
          }),
          ProfileListItem(
            title: 'My orders',
            icon: Icons.card_travel,
            ontap: () {
              Get.toNamed(AppRoute.ordersView);
            },
          ),
          ProfileListItem(
            title: 'Archived orders',
            icon: Icons.archive_outlined,
            ontap: () {
              Get.toNamed(AppRoute.archivedOrdersView);
            },
          ),
          ProfileListItem(
            title: 'My Adresses',
            icon: Icons.location_on_outlined,
            ontap: () {
              Get.toNamed(
                AppRoute.addressView,
              );
            },
          ),
          ProfileListItem(
            title: 'Settings',
            icon: Icons.settings_outlined,
            ontap: () {},
          ),
          ProfileListItem(
            title: 'Log Out',
            icon: Icons.logout,
            ontap: () {
              profileController.logOut();
            },
          ),
        ],
      ),
    );
  }
}
