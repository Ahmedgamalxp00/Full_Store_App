import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/failures.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class AddressRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map>> view({
    required String userId,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.viewAddressLink, data: {
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

  Future<Either<Failure, Map>> add({
    required String userId,
    required String name,
    required String city,
    required String street,
    required String lat,
    required String long,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.addAddressLink, data: {
        "user_id": userId,
        "name": name,
        "city": city,
        "street": street,
        "lat": lat,
        "long": long,
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
    required String addressId,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.removeAddressLink, data: {
        "adress_id": addressId,
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

  Future<Either<Failure, Map>> edit({
    required String addressId,
    required String name,
    required String city,
    required String street,
    required String lat,
    required String long,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.editAddressLink, data: {
        "adress_id": addressId,
        "name": name,
        "city": city,
        "street": street,
        "lat": lat,
        "long": long,
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
