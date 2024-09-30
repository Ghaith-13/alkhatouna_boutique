// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class OnOptionWidget extends StatefulWidget {
  String title, subTitle;
  OnOptionWidget({super.key, required this.title, required this.subTitle});

  @override
  State<OnOptionWidget> createState() => _OnOptionWidgetState();
}

class _OnOptionWidgetState extends State<OnOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            widget.title.tr(context),
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor),
          ),
          // Text(
          //   widget.subTitle,
          //   style: TextStyle(
          //       fontSize: 11.sp,
          //       fontWeight: FontWeight.w400,
          //       color: AppColors.greyColor),
          // )
        ]),
        Icon(
          Icons.arrow_forward_ios_outlined,
          color: AppColors.greyColor,
          size: 24.sp,
        )
      ]),
    );
  }
}
