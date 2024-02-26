import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class CategoryItemsRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map<String, dynamic>>> getCategoryItems(
      {required String userId, required String categoryId}) async {
    try {
      var data = await apiService.post(link: AppLinks.categoryItemsLink, data: {
        "user_id": userId,
        "category_id": categoryId,
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
