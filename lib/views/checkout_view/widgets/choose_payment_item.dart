import 'package:flutter/material.dart';
import 'package:full_store_app/core/constants.dart';
import 'package:full_store_app/core/utils/app_styles.dart';

class ChoosePaymentItem extends StatelessWidget {
  const ChoosePaymentItem(
      {super.key, required this.title, this.ontap, required this.active});
  final String title;
  final bool active;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: ontap,
      child: AnimatedContainer(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              active == true ? kPrimeryColor : kSecondaryColor.withOpacity(0.1),
        ),
        duration: const Duration(milliseconds: 500),
        child: Row(
          children: [
            Text(
              title,
              style: AppStyles.styleSemiBold18
                  .copyWith(color: active == true ? Colors.white : kTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
