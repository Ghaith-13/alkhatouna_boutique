import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeSearchSkeleton extends StatelessWidget {
  const HomeSearchSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.sp),
              child: Container(
                color: Colors.black,
                width: 0.3.sw,
                height: 50.h,
              ),
            )),
        20.verticalSpace,
        Row(
          children: [
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipOval(
                  child: Container(
                    color: Colors.black,
                    width: 100.w,
                    height: 100.w,
                    // width: 0.4.sw,
                    // height: 100.h,
                  ),
                )),
            10.horizontalSpace,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipOval(
                  child: Container(
                    color: Colors.black,
                    width: 100.w,
                    height: 100.w,
                    // width: 0.4.sw,
                    // height: 100.h,
                  ),
                )),
          ],
        ),
        10.verticalSpace,
        Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.sp),
              child: Container(
                color: Colors.black,
                width: 0.3.sw,
                height: 50.h,
              ),
            )),
        20.verticalSpace,
        Row(
          children: [
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipOval(
                  child: Container(
                    color: Colors.black,
                    width: 100.w,
                    height: 100.w,
                    // width: 0.4.sw,
                    // height: 100.h,
                  ),
                )),
            10.horizontalSpace,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipOval(
                  child: Container(
                    color: Colors.black,
                    width: 100.w,
                    height: 100.w,
                    // width: 0.4.sw,
                    // height: 100.h,
                  ),
                )),
          ],
        ),
        20.verticalSpace,
        Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.sp),
              child: Container(
                color: Colors.black,
                width: 0.3.sw,
                height: 50.h,
              ),
            )),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 0.4.sw,
                    height: 250.h,
                  ),
                )),
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 0.4.sw,
                    height: 250.h,
                  ),
                ))
          ],
        ),
        10.verticalSpace,
      ],
    );
  }
}
