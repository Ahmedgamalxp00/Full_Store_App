import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class ResetPassRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, int>> resetPassword({
    required String email,
    required String password,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.resetPassLink, data: {
        "email": email,
        "password": password,
      });

      if (data['status'] == 'success') {
        return right(1);
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
