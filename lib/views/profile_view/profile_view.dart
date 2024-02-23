import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/profile_controller.dart';
import 'package:full_store_app/core/functions/eixt_app_alert.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/views/profile_view/widgets/profile_list.dart';
import 'package:full_store_app/views/profile_view/widgets/user_info.dart';
import 'package:get/get.dart';

import 'widgets/profile_picture.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitAppAlert();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<ProfileController>(builder: (controller) {
            if (controller.requestState == RequestState.loading) {
              return const CustomLoadingWidget1();
            } else {
              return const Padding(
                padding: EdgeInsets.only(bottom: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfilePicture(),
                    UserInfo(),
                    ProfileList(),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
