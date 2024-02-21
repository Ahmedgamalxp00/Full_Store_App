import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/views/home_views/widgets/icon_bottn_with_counter.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, this.onchange, required this.controller, this.back = false});
  final TextEditingController controller;
  final void Function(String)? onchange;
  final bool back;
  @override
  Widget build(BuildContext context) {
    int badgeContent = 0;
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
        top: 40,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (back == true)
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_sharp),
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF2F5F1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                controller: controller,
                onChanged: onchange,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: const InputDecoration(
                  hintText: 'Search product',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 13,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          const Gap(10),
          badgeContent == 0
              ? IconBWithCounter(
                  svgPicture: Assets.iconsBell,
                  onTap: () {
                    Get.toNamed(AppRoute.notificationView);
                  },
                )
              : badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -5, end: -3),
                  badgeStyle:
                      const badges.BadgeStyle(badgeColor: kPrimeryColor),
                  badgeAnimation: const badges.BadgeAnimation.scale(
                    animationDuration: Duration(seconds: 1),
                  ),
                  badgeContent: Text(
                    badgeContent.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconBWithCounter(
                    svgPicture: Assets.iconsBell,
                    onTap: () {
                      Get.toNamed(AppRoute.notificationView);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
