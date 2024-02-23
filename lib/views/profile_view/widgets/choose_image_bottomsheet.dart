import 'package:flutter/material.dart';
import 'package:full_store_app/core/shared/custom_botton.dart';
import 'package:gap/gap.dart';

class ChooseImageBottmSheet extends StatelessWidget {
  const ChooseImageBottmSheet({super.key, this.onCameraTap, this.onGalleryTap});
  final void Function()? onCameraTap;
  final void Function()? onGalleryTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.transparent, //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBottn(
                text: 'choose from Gallery',
                onTap: onGalleryTap,
              ),
              const Gap(10),
              CustomBottn(
                text: 'choose from Camera',
                onTap: onCameraTap,
              ),
            ],
          )),
    );
  }
}
