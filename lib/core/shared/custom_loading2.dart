import 'package:flutter/material.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingWidget2 extends StatelessWidget {
  const CustomLoadingWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(100),
        child: LottieBuilder.asset(
          Assets.lottieCart,
        ),
      ),
    );
  }
}
