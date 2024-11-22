// ignore_for_file: deprecated_member_use

import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/auth/presentation/pages/otp_confirmation.dart';
import 'package:alkhatouna/features/auth/presentation/pages/whatss_up_confirmation.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:flutter_svg/svg.dart';

Widget ConfirmationTypeBottomSheet(BuildContext context,
    ScrollController scrollController, double bottomSheetOffset,
    {int? ordeId}) {
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
          30.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose a method to verify your account".tr(context),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )
            ],
          ),
          50.ph,
          InkWell(
            onTap: () {
              AppConstant.customNavigation(
                  context, OtpConfirmationScreen(), -1, 0);
            },
            child: Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Send confirmation code via Email".tr(context),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset(
                      'assets/icons/email.svg',
                      color: AppColors.primaryColor,
                      width: 30.sp,
                      height: 30.sp,
                    ),
                  ],
                )),
          ),
          30.ph,
          InkWell(
            onTap: () {
              AppConstant.customNavigation(
                  context, WhatsappConfirmScreen(), -1, 0);
            },
            child: Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Send confirmation code via WhatsApp".tr(context),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/WhatsApp_icon.png',
                      // color: AppColors.primaryColor,
                      width: 35.sp,
                      height: 35.sp,
                    ),
                  ],
                )),
          ),
          30.ph,
        ],
      ),
    ),
  );
}
