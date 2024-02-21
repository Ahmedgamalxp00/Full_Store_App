import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class NotificationRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map>> view({
    required String userId,
  }) async {
    try {
      var data =
          await apiService.post(link: AppLinks.notificationviewLink, data: {
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
    required String notificationId,
  }) async {
    try {
      var data =
          await apiService.post(link: AppLinks.notificationRemoveLink, data: {
        "notification_id": notificationId,
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
