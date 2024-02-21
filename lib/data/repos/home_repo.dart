import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class HomeRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map<String, dynamic>>> getAllData(
      String userId) async {
    try {
      var data = await apiService
          .post(link: AppLinks.homeLink, data: {"user_id": userId});

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
