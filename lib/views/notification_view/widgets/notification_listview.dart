import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/notification_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/shared/empty_widget.dart';
import 'package:full_store_app/core/shared/custom_loading1.dart';
import 'package:full_store_app/core/utils/request_state.dart';
import 'package:full_store_app/views/notification_view/widgets/notification_listview_item.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<NotificationController>();
    return GetBuilder<NotificationController>(
      builder: (controller) {
        if (controller.requestState == RequestState.loading) {
          return const CustomLoadingWidget1();
        } else if (controller.requestState == RequestState.failure ||
            controller.notificationList.isEmpty) {
          return const CustomEmptyWidget();
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                top: 10,
              ),
              itemBuilder: (context, index) {
                return Dismissible(
                    onDismissed: (direction) async {
                      await controller.removeNotification(
                          '${controller.notificationList[index].notificationId}');
                    },
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffe6e6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        children: [
                          Spacer(),
                          Icon(
                            Icons.delete,
                            color: kPrimeryColor,
                          ),
                          Gap(20),
                        ],
                      ),
                    ),
                    child: NotificationListItem(
                        controller.notificationList[index]));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: controller.notificationList.length,
            ),
          );
        }
      },
    );
  }
}
