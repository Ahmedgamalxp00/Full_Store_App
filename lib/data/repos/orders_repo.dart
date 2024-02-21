import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class OrderRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map>> view({
    required String userId,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.ordersViewLink, data: {
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

  Future<Either<Failure, Map>> remove({
    required String orderId,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.ordersRemoveLink, data: {
        "order_id": orderId,
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
