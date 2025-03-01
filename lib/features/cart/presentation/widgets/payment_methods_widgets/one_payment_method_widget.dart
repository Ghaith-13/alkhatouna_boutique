import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';

class OnePaymentMethodWidget extends StatefulWidget {
  const OnePaymentMethodWidget({super.key});

  @override
  State<OnePaymentMethodWidget> createState() => _OnePaymentMethodWidgetState();
}

class _OnePaymentMethodWidgetState extends State<OnePaymentMethodWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0.sp)),
                child: Container(
                  color: Colors.black,
                  child: SvgPicture.asset(
                    allowDrawingOutsideViewBox: false,
                    "assets/icons/Card.svg",
                  ),
                ),
              ),
              Positioned(
                bottom: 40.h,
                left: 35.w,
                child: Text(
                  "Ghaith Othman",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 40.h,
                left: 175.w,
                child: Text(
                  "12/12/2024",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          10.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
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
          )
        ],
      ),
    );
  }
}
