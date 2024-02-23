import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/profile_controller.dart';
import 'package:full_store_app/core/app_links.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/views/profile_view/widgets/choose_image_bottomsheet.dart';
import 'package:get/get.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ProfileController>();
    return GetBuilder<ProfileController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: 70, bottom: 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                  color: Color(0xffE8EBE8), shape: BoxShape.circle),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    '${AppLinks.userImageLink}${controller.userData.usersImage}',
                errorWidget: (context, url, error) => const Icon(
                  Icons.person_2_outlined,
                  color: kPrimeryColor,
                  size: 50,
                ),
                placeholder: (context, url) => const Icon(
                  Icons.person_2_outlined,
                  color: kPrimeryColor,
                  size: 50,
                ),
              ),
            ),
            Positioned(
              bottom: -5,
              right: -10,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return ChooseImageBottmSheet(
                          onCameraTap: () async {
                            await controller.pickImagefromCamera();
                            if (controller.userData.usersImage == '0') {
                              controller.addUserImage();
                            } else {
                              controller.editUserImage(
                                  oldImage:
                                      '${controller.userData.usersImage}');
                            }
                          },
                          onGalleryTap: () async {
                            await controller.pickImagefromGallery();
                            if (controller.userData.usersImage == '0') {
                              controller.addUserImage();
                            } else {
                              controller.editUserImage(
                                  oldImage:
                                      '${controller.userData.usersImage}');
                            }
                          },
                        );
                      });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    color: const Color(0xffE8EBE8),
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: kTextColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
