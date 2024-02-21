import 'package:flutter/material.dart';
import 'package:full_store_app/core/utils/app_assets.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(100),
        child: LottieBuilder.asset(Assets.lottieEmpty),
      ),
    );
  }
}
