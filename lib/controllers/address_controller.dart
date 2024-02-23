import 'package:flutter/material.dart';
import 'package:full_store_app/core/errors/exceptions.dart';
import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/address_model/address_model.dart';
import 'package:full_store_app/data/models/place_model/place_model.dart';
import 'package:full_store_app/data/repos/address_repo.dart';
import 'package:full_store_app/services/location_service.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class AddressController extends GetxController {
  AddressRepo addressRepo = Get.put(AddressRepo());
  LocationService locationService = Get.put(LocationService());

  // CheckOutController checkOutController = Get.put(CheckOutController());
  GlobalKey<FormState> addressformKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController latController;
  late TextEditingController longController;
  late TextEditingController searchController;
  late GoogleMapController mapController;
  RequestState? requestState;
  late String requestError;
  MyServices myServices = Get.find();
  List<AddressModel> addressList = [];
  List<PlaceModel> predictionsList = [];
  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(26.8206, 30.8025), zoom: 5);
  late CameraPosition myCurrentCameraPosition;
  Set<Marker> markers = {};
  double? lat;
  double? long;
  String? currentLocationDesc;

  viewAddress() async {
    addressList = [];
    requestState = RequestState.loading;
    update();
    var resulte = await addressRepo.view(
      userId: myServices.sharedPreferences.getString("id") as String,
    );

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      for (var item in data['data']) {
        addressList.add(AddressModel.fromJson(item));
      }
      requestState = RequestState.success;
    });
    update();
  }

  addAddress() async {
    if (addressformKey.currentState!.validate()) {
      addressformKey.currentState!.save();
      requestState = RequestState.loading;
      update();
      var resulte = await addressRepo.add(
          userId: myServices.sharedPreferences.getString("id") as String,
          name: nameController.text,
          city: cityController.text,
          street: streetController.text,
          lat: lat.toString(),
          long: long.toString(),
          desc: currentLocationDesc.toString());
      resulte.fold((failure) {
        requestError = failure.erorrMassage;
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: failure.erorrMassage);
      }, (data) {
        Get.offAllNamed(AppRoute.mainView);
        customDialog(title: 'Success', body: 'Address Added Successfully');

        // refreshData();
      });
      update();
    }
  }

  removeAddress(String addressId) async {
    update();
    var resulte = await addressRepo.remove(addressId: addressId);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {});
    update();
  }

  refreshData() async {
    addressList = [];
    await viewAddress();
  }

  addMarker(LatLng myposition) async {
    markers.clear();
    markers.add(
        Marker(markerId: const MarkerId('my location'), position: myposition));
    lat = myposition.latitude;
    long = myposition.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(
        myposition.latitude, myposition.longitude);
    currentLocationDesc =
        '${placemarks[0].country}, ${placemarks[0].administrativeArea}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].name}';
    cityController.text = '${placemarks[0].subAdministrativeArea}';
    streetController.text = '${placemarks[0].name}';
    update();
  }

  void updateCurrentLocation() async {
    try {
      var locationData = await locationService.getMyLocation();
      LatLng myPosition =
          LatLng(locationData.latitude!, locationData.longitude!);
      myCurrentCameraPosition = CameraPosition(zoom: 17, target: myPosition);
      mapController.animateCamera(
          CameraUpdate.newCameraPosition(myCurrentCameraPosition));
      addMarker(myPosition);
    } on LocationServiceException {
      customDialog(
          title: 'Alert',
          body:
              'Please enable location service to choose your location faster');
    } on LocationPermissionException {
      customDialog(
          title: 'Alert',
          body:
              'Please give location permission  to choose your location faster');
    } catch (e) {
      customDialog(title: 'Error', body: 'Unexpected Error');
    }
  }

  getPredictions() async {
    searchController.addListener(() async {
      if (searchController.text.isNotEmpty) {
        predictionsList.clear();
        var data =
            await locationService.getPredictions(text: searchController.text);
        predictionsList.addAll(data);
        update();
      } else {
        predictionsList.clear();
        update();
      }
    });
  }

  getLocationDetailes(String placeName) async {
    List<Location> locations = await locationFromAddress(placeName);
    LatLng myPosition = LatLng(locations[0].latitude, locations[0].longitude);
    myCurrentCameraPosition = CameraPosition(zoom: 13, target: myPosition);
    mapController
        .animateCamera(CameraUpdate.newCameraPosition(myCurrentCameraPosition));
    addMarker(myPosition);
    searchController.clear();
    predictionsList.clear();
    update();
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    cityController = TextEditingController();
    streetController = TextEditingController();
    latController = TextEditingController();
    longController = TextEditingController();
    searchController = TextEditingController();
    getPredictions();
    viewAddress();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    cityController.dispose();
    streetController.dispose();
    latController.dispose();
    longController.dispose();
    searchController.dispose();

    super.dispose();
  }
}
