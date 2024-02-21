import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:get/get.dart';

exitAppAlert() {
  Get.defaultDialog(
    title: 'Alert',
    titleStyle: AppStyles.styleExtraBold24.copyWith(color: kPrimeryColor),
    content: const Text(
      'Are you sure you want to exit',
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
    confirm: Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => exit(0),
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
              'Exit',
              style: AppStyles.styleSemiBold18.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  );
}
