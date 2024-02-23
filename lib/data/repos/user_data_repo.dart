import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';

import 'package:get/get.dart';

class UserDataRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map<String, dynamic>>> addImage({
    required String email,
    required File file,
  }) async {
    try {
      var data = await apiService.postRequestWithFile(
          link: AppLinks.addImageLink,
          data: {
            "email": email,
          },
          file: file);

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

  Future<Either<Failure, Map<String, dynamic>>> editImage({
    required String email,
    required String oldImage,
    required File file,
  }) async {
    try {
      var data = await apiService.postRequestWithFile(
          link: AppLinks.editImageLink,
          data: {
            "email": email,
            "oldimage": oldImage,
          },
          file: file);

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

  Future<Either<Failure, Map<String, dynamic>>> view({
    required String email,
  }) async {
    try {
      var data = await apiService.post(
        link: AppLinks.getUserDataLink,
        data: {
          "email": email,
        },
      );

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
