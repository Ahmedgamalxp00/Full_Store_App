import 'dart:convert';

import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/errors/exceptions.dart';
import 'package:full_store_app/core/utils/api_services.dart';
import 'package:full_store_app/data/models/place_model/place_model.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationService {
  ApiService apiService = Get.find();
  Location location = Get.put(Location());
  Future<void> checkAndRequestLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw LocationServiceException();
      }
    }
  }

  Future<void> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPermissionException();
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
  }

  Future<LocationData> getMyLocation() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }

  Future<List<PlaceModel>> getPredictions({
    required String text,
  }) async {
    var response = await http.get(Uri.parse(
        '${AppLinks.placesAPILink}input=$text&key=${AppLinks.apiKey}'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<PlaceModel> predictionsList = [];
      var data = jsonDecode(response.body)['predictions'];
      for (var item in data) {
        predictionsList.add(PlaceModel.fromJson(item));
      }
      return predictionsList;
    } else {
      throw Exception();
    }
  }
}
