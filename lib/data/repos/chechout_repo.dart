import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class CheckOutRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map>> checkOut({
    required String userId,
    required String addressId,
    required String deliveryType,
    required String deliveryPrice,
    required String paymentMethod,
    required String orderPrice,
    required String couponId,
    required String couponDiscount,
  }) async {
    try {
      var data =
          await apiService.post(link: AppLinks.ordersCheckOutLink, data: {
        "user_id": userId,
        "address_id": addressId,
        "delivery_type": deliveryType,
        "delivery_price": deliveryPrice,
        "orders_price": orderPrice,
        "payment_method": paymentMethod,
        "coupon_id": couponId,
        "coupon_discount": couponDiscount,
      });
      if (data['status'] == 'success') {
        return right(data);
      } else {
        return left(ServerFailure(data['massage']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
