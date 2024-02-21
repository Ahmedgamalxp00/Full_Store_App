import 'package:flutter/material.dart';
import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/cart_model/cart_model.dart';
import 'package:full_store_app/data/models/coupon_model/coupon_model.dart';
import 'package:full_store_app/data/repos/cart_repo.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartRepo cartRepo = Get.put(CartRepo());
  int itemcount = 1;
  RequestState? requestState;
  MyServices myServices = Get.find<MyServices>();
  String? requestError;
  String? couponeRquestError;
  List<CartModel> myCartList = [];
  int totalPrice = 0;
  int totalcount = 0;
  int shipping = 0;
  TextEditingController couponController = TextEditingController();
  List<CouponModel> myCoupons = [];
  int discount = 0;
  String? couponName;
  String? couponId;
  String? couponDiscount = '0';
  addToCart(String itemId) async {
    var resulte = await cartRepo.addToCart(
        userId: myServices.sharedPreferences.getString("id") as String,
        itemId: itemId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      print('=========================================================');
      print("item added successfully");
    });
  }

  removeFromCart(String itemId) async {
    var resulte = await cartRepo.removeFromCart(
        userId: myServices.sharedPreferences.getString("id") as String,
        itemId: itemId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      print('=========================================================');
      print("item removed successfully");
    });
  }

  deleteFromCart(String itemId) async {
    var resulte = await cartRepo.deleteFromCart(
        userId: myServices.sharedPreferences.getString("id") as String,
        itemId: itemId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      print('=========================================================');
      print("item deleted successfully");
    });
  }

  viewCart() async {
    requestState = RequestState.loading;
    update();
    var resulte = await cartRepo.viewCart(
      userId: myServices.sharedPreferences.getString("id") as String,
    );

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
    }, (data) {
      for (var item in data['data']) {
        myCartList.add(CartModel.fromJson(item));
      }
      totalPrice = data['total']['totalprice'];
      totalcount = data['total']['totalcount'];
      requestState = RequestState.success;
    });
    update();
  }

  checkcoupon() async {
    requestError = '';
    var resulte = await cartRepo.checkcoupon(couponName: couponController.text);

    resulte.fold((failure) {
      discount = 0;
      couponName = null;
      couponeRquestError = 'wrong coupon';
    }, (data) {
      for (var item in data['data']) {
        myCoupons.add(CouponModel.fromJson(item));
      }
      for (var item in myCoupons) {
        if (item.couponName == couponController.text) {
          discount = item.couponDiscount!;
          couponName = item.couponName;
          couponId = '${item.couponId}';
          couponDiscount = item.couponDiscount.toString();
        }
      }
    });
    update();
  }

  goToCheckOutPage() {
    if (myCartList.isEmpty) {
      customDialog(title: 'Error', body: 'Your Cart is empty');
    } else {
      Get.toNamed(AppRoute.chechOutView, arguments: {
        "couponid": couponId ?? '0',
        'orderprice': '$totalPrice',
        'coupondiscount': couponDiscount,
      });
    }
  }

  getTotalPrice() {
    if (couponName != null) {
      return (totalPrice - totalPrice * discount / 100);
    }
    return null;
  }

  resetData() {
    myCartList.clear();
    totalPrice = 0;
    totalcount = 0;
  }

  refreshData() async {
    resetData();
    await viewCart();
  }

  @override
  void onInit() async {
    viewCart();

    super.onInit();
  }
}
