import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as gett;

Dio dio = gett.Get.find();

class ApiService {
  ApiService();

  Future<dynamic> get({
    required String link,
    Map<String, dynamic>? data,
  }) async {
    var response = await dio.post(
      link,
      data: data,
    );
    // Future.delayed(const Duration(microseconds: 1000));
    return jsonDecode(response.data);
  }

  Future<dynamic> post({
    required Map<String, String> data,
    required String link,
  }) async {
    var response = await dio.post(
      link,
      data: FormData.fromMap(data),
    );
    // Future.delayed(const Duration(microseconds: 1000));
    return jsonDecode(response.data);
  }

  // Future<dynamic> put({
  //   required int id,
  //   required Map<String, dynamic> data,
  // }) async {
  //   var response = await dio.put(
  //     '$baseUrl/$id',
  //     data: data,
  //   );
  //   return response.data;
  // }

  // Future<dynamic> delete({
  //   required int id,
  // }) async {
  //   var response = await dio.delete(
  //     '$baseUrl/$id',
  //   );
  //   return response.data;
  // }
}
