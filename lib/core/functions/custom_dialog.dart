import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:get/get.dart';

customDialog({
  String? title,
  String? body,
  String? confirmText,
  String? cancelText,
  void Function()? onConfirmTap,
}) {
  Get.defaultDialog(
    title: title ?? '',
    titleStyle: AppStyles.styleExtraBold24.copyWith(color: kPrimeryColor),
    content: Text(
      body ?? '',
      textAlign: TextAlign.center,
      style: AppStyles.styleSemiBold18,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    cancel: Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          width: 90,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: kPrimeryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              'Cancel',
              style: AppStyles.styleSemiBold18,
            ),
          ),
        ),
      ),
    ),
    confirm: confirmText == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: onConfirmTap,
              child: Container(
                width: 90,
                height: 45,
                decoration: BoxDecoration(
                  color: kPrimeryColor,
                  border: Border.all(color: kPrimeryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    confirmText,
                    style:
                        AppStyles.styleSemiBold18.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
  );
}
