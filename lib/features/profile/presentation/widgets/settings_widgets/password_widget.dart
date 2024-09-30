import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/profile/presentation/widgets/settings_widgets/password_drop_down.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Password".tr(context),
              style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () {
                showFlexibleBottomSheet(
                  bottomSheetColor: AppColors.whiteColor,
                  barrierColor: Color.fromARGB(94, 83, 83, 83),
                  bottomSheetBorderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.sp),
                      topRight: Radius.circular(40.sp)),
                  minHeight: 0,
                  initHeight: 0.7,
                  maxHeight: 0.7,
                  anchors: [0, 0.7],
                  isSafeArea: true,
                  context: context,
                  builder: passwordDropDown,
                );
              },
              child: Text(
                "Change".tr(context),
                style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        20.ph,
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
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
            readOnly: true,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "*********",
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
      ],
    );
  }
}
