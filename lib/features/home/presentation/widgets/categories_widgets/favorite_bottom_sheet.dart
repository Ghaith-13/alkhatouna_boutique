import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';

List<String> sizes = ["XS", "S", "M", "L", "XL"];
Widget favoriteBottomSheet(
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
          20.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select size".tr(context),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
              )
            ],
          ),
          10.ph,
          GridView.count(
            padding: EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            childAspectRatio: (1.0 / 0.7),
            mainAxisSpacing: 15,
            children: List.generate(sizes.length, (index) {
              return FadeInUp(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      padding: EdgeInsets.all(15.sp),
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.sp),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(child: Text(sizes[index]))));
            }),
          )
        ],
      ),
    ),
  );
}
