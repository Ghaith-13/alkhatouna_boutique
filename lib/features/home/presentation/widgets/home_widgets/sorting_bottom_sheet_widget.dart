import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

Widget sortingSectionsBottomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        controller: scrollController,
        children: [
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              )
            ],
          ),
          15.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sort by".tr(context),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 18.sp),
              ),
            ],
          ),
          10.ph,
          Row(
            children: [
              Text(
                "Popular".tr(context),
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          ),
          10.ph,
          Row(children: [
            Text(
              "Newest".tr(context),
              style: TextStyle(fontSize: 16.sp),
            ),
          ]),
          10.ph,
          Row(children: [
            Text(
              "By name".tr(context),
              style: TextStyle(fontSize: 16.sp),
            ),
          ]),
          10.ph,
          Row(children: [
            Text(
              "By favorite".tr(context),
              style: TextStyle(fontSize: 16.sp),
            ),
          ]),
          10.ph,
          Row(children: [
            Text(
              "Most purchased".tr(context),
              style: TextStyle(fontSize: 16.sp),
            ),
          ]),
        ],
      ),
    ),
  );
}
