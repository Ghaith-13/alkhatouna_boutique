import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool sales = false;
  bool newArrival = false;
  bool changeDelivery = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Notifications".tr(context),
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sales".tr(context),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
            ),
            Switch(
              activeColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: AppColors.greyColor,
              value: sales,
              onChanged: (value) {
                setState(() {
                  sales = !sales;
                });
              },
            ),
          ],
        ),
        10.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New arrivals".tr(context),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
            ),
            Switch(
              activeColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: AppColors.greyColor,
              value: newArrival,
              onChanged: (value) {
                setState(() {
                  newArrival = !newArrival;
                });
              },
            ),
          ],
        ),
        10.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery status changes".tr(context),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
            ),
            Switch(
              activeColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: AppColors.greyColor,
              value: changeDelivery,
              onChanged: (value) {
                setState(() {
                  changeDelivery = !changeDelivery;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
