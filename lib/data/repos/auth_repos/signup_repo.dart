import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class SignUpRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, int>> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.signUpLink, data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
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
