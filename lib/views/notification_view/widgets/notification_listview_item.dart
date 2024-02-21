import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/notification_controller.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';
import 'package:full_store_app/data/models/notification_model/notification_model.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationListItem extends GetView<NotificationController> {
  const NotificationListItem(this.notification, {super.key});
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('${notification.notificationTitle}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.styleSemiBold18.copyWith()),
                      ),
                      const Gap(20),
                      Text(
                          Jiffy.parse(
                            '${notification.notificationDatetime}',
                          ).fromNow(),
                          style: AppStyles.styleSemiBold14
                              .copyWith(color: kPrimeryColor)),
                    ],
                  ),
                  const Gap(8),
                  Text('${notification.notificationBody}xxxxxxxxxxxxxxxxxxxxxx',
                      style: AppStyles.styleSemiBold18
                          .copyWith(color: kTextColor)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
