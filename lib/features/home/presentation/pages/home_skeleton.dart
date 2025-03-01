import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeSkeleton extends StatefulWidget {
  const HomeSkeleton({super.key});

  @override
  State<HomeSkeleton> createState() => _HomeSkeletonState();
}

class _HomeSkeletonState extends State<HomeSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.verticalSpace,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 0.9.sw,
                    height: 196.h,
                  ),
                )),
            40.verticalSpace,
            SizedBox(
              width: 0.9.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.sp),
                        child: Container(
                          color: Colors.black,
                          width: 0.3.sw,
                          height: 30.h,
                        ),
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.sp),
                        child: Container(
                          color: Colors.black,
                          width: 0.1.sw,
                          height: 30.h,
                        ),
                      )),
                ],
              ),
            ),
            40.verticalSpace,
            SizedBox(
              width: 0.9.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                ],
              ),
            ),
            20.verticalSpace,
            SizedBox(
              width: 0.9.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                ],
              ),
            ),
            20.verticalSpace,
            SizedBox(
              width: 0.9.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                ],
              ),
            ),
            20.verticalSpace,
            SizedBox(
              width: 0.9.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 35.sp,
                      )),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
