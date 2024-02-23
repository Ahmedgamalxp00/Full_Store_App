import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as gett;
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

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
    return jsonDecode(response.data);
  }

  Future<dynamic> post({
    required Map<String, dynamic> data,
    required String link,
  }) async {
    var response = await dio.post(
      link,
      data: FormData.fromMap(data),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.data);
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postRequestWithFile({
    required Map<String, String> data,
    required String link,
    required File file,
  }) async {
    var request = http.MultipartRequest("POST", Uri.parse(link));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multiPartFile = http.MultipartFile("image", stream, length,
        filename: basename(file.path));
    request.files.add(multiPartFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);

    return jsonDecode(response.body);
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
