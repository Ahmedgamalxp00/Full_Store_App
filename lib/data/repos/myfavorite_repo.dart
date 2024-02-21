import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class MyFavoritesRepo {
  ApiService apiService = Get.find();

  Future<Either<Failure, Map<String, dynamic>>> viewFavorites(
      {required String userId}) async {
    try {
      var data = await apiService.post(link: AppLinks.viewFavoritesLink, data: {
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

  Future<Either<Failure, Map<String, dynamic>>> deleteFromMyFavorites(
      {required String userId, required String itemId}) async {
    try {
      var data =
          await apiService.post(link: AppLinks.removeFromFavoritesLink, data: {
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
}
