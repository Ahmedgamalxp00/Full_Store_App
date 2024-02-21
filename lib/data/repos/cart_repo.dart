import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class CartRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map<String, dynamic>>> addToCart(
      {required String userId, required String itemId}) async {
    try {
      var data = await apiService.post(link: AppLinks.addToCartLink, data: {
        "user_id": userId,
        "item_id": itemId,
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

  Future<Either<Failure, Map<String, dynamic>>> removeFromCart(
      {required String userId, required String itemId}) async {
    try {
      var data =
          await apiService.post(link: AppLinks.removeFromCartLink, data: {
        "user_id": userId,
        "item_id": itemId,
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

  Future<Either<Failure, Map<String, dynamic>>> deleteFromCart(
      {required String userId, required String itemId}) async {
    try {
      var data =
          await apiService.post(link: AppLinks.deleteFromCartLink, data: {
        "user_id": userId,
        "item_id": itemId,
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

  Future<Either<Failure, Map<String, dynamic>>> getItemCount(
      {required String userId, required String itemId}) async {
    try {
      var data = await apiService.post(link: AppLinks.getItemCountLink, data: {
        "user_id": userId,
        "item_id": itemId,
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

  Future<Either<Failure, Map<String, dynamic>>> viewCart(
      {required String userId}) async {
    try {
      var data = await apiService.post(link: AppLinks.viewCartLink, data: {
        "user_id": userId,
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

  Future<Either<Failure, Map<String, dynamic>>> checkcoupon(
      {required String couponName}) async {
    try {
      var data = await apiService.post(link: AppLinks.checkcouponLink, data: {
        "coupon_name": couponName,
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
