import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

Widget addPaymentBottomSheet(
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
                "Add new card".tr(context),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                    fontSize: 18.sp),
              ),
            ],
          ),
          20.ph,
          FadeInLeft(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Name on card".tr(context),
                  hintStyle: TextStyle(color: AppColors.greyColor),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
          20.ph,
          FadeInRight(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Card number".tr(context),
                  hintStyle: TextStyle(color: AppColors.greyColor),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
          20.ph,
          FadeInLeft(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Expire Date".tr(context),
                  hintStyle: TextStyle(color: AppColors.greyColor),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
          20.ph,
          FadeInRight(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "CVV".tr(context),
                  hintStyle: TextStyle(color: AppColors.greyColor),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
          40.ph,
          FadeInLeft(
            child: Row(
              children: [
                SizedBox(
                  width: 20.sp,
                  height: 20.sp,
                  child: Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                5.pw,
                Text(
                  "Set as default payment method".tr(context),
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          40.ph,
          SizedBox(
            width: 343.w,
            height: 48.h,
            child: FadeIn(
              delay: Duration(milliseconds: 500),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "ADD CARD".tr(context),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          )
        ],
      ),
    ),
  );
}
