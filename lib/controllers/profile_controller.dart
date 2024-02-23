import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:full_store_app/core/utils/app_router.dart';
import 'package:full_store_app/services/services.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:full_store_app/core/functions/custom_dialog.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/data/models/user_model/user_model.dart';
import 'package:full_store_app/data/repos/user_data_repo.dart';

import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  MyServices myServices = Get.find();

  UserDataRepo userDataRepo = Get.put(UserDataRepo());
  logOut() {
    String userId = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.loginView);
  }

  RequestState? requestState;
  late String requestError;

  File? image;

  late UserModel userData;

  addUserImage() async {
    if (image == null) {
      customDialog(title: 'Error', body: 'Please Add an Image');
    }
    if (image != null) {
      requestState = RequestState.loading;
      update();
      var resulte = await userDataRepo.addImage(
        email: myServices.sharedPreferences.getString("email") as String,
        file: image!,
      );

      resulte.fold((failure) {
        requestError = failure.erorrMassage;
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: failure.erorrMassage);
      }, (data) {
        requestState = RequestState.success;
        Get.back();
        getUserData();
      });
      update();
    }
  }

  editUserImage({required String oldImage}) async {
    if (image == null) {
      customDialog(title: 'Error', body: 'Please add an Image');
    }
    if (image != null) {
      requestState = RequestState.loading;
      update();
      var resulte = await userDataRepo.editImage(
        email: myServices.sharedPreferences.getString("email") as String,
        file: image!,
        oldImage: oldImage,
      );

      resulte.fold((failure) {
        requestError = failure.erorrMassage;
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: failure.erorrMassage);
      }, (data) {
        requestState = RequestState.success;
        Get.back();
        getUserData();
      });
      update();
    }
  }

  getUserData() async {
    requestState = RequestState.loading;
    update();
    var resulte = await userDataRepo.view(
      email: myServices.sharedPreferences.getString("email") as String,
    );
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      userData = UserModel.fromJson(data['data'][0]);
      requestState = RequestState.success;
    });
    update();
  }

  pickImagefromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    Get.back();
    if (xFile != null) {
      image = File(xFile.path);
    }
    update();
  }

  pickImagefromCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    Get.back();
    if (xFile != null) {
      image = File(xFile.path);
    }

    update();
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}
