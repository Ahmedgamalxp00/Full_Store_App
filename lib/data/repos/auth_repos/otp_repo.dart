import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class OtpRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, int>> checkCode({
    required String email,
    required String verifyCode,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.verifyCodeLink, data: {
        "email": email,
        "verifycode": verifyCode,
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

  Future<Either<Failure, int>> resendVerifyCode({
    required String email,
  }) async {
    try {
      var data =
          await apiService.post(link: AppLinks.resendVerifyCodeLink, data: {
        "email": email,
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
