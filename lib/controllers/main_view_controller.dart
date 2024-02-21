import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/home_controller.dart';
import 'package:full_store_app/views/cart_view/cart_view.dart';
import 'package:full_store_app/views/favorite_views/favorite_view.dart';
import 'package:full_store_app/views/home_views/home_view.dart';
import 'package:full_store_app/views/profile_view/profile_view.dart';
import 'package:get/get.dart';

class MainViewController extends GetxController {
  List<Widget> screens = [
    const HomeView(),
    const FavoriteView(),
    const CartView(),
    const ProfileView(),
  ];
  Widget currentView = const HomeView();
  int selectedIndx = 0;
  onTabChange(int index) {
    currentView = screens[index];
    selectedIndx = index;
    update();
  }
}
