import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/cart_controller.dart';
import 'package:full_store_app/core/functions/eixt_app_alert.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/views/cart_view/widgets/bottom_bar.dart';
import 'package:full_store_app/views/cart_view/widgets/cart_listview.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController(), fenix: true);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitAppAlert();
      },
      child: GetBuilder<CartController>(
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Your Cart', style: AppStyles.styleSemiBold18),
                  Text('  ( ${controller.totalcount} item )',
                      style: const TextStyle(fontSize: 14))
                ],
              ),
            ),
            body: const CartListView(),
            bottomNavigationBar: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: const BottonBar(),
            ),
          );
        },
      ),
    );
  }
}
