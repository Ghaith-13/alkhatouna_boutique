import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProfileSkeleton extends StatefulWidget {
  const ProfileSkeleton({super.key});

  @override
  State<ProfileSkeleton> createState() => _ProfileSkeletonState();
}

class _ProfileSkeletonState extends State<ProfileSkeleton> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
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
            10.ph,
            Row(
              children: [
                Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.sp),
                        child: CircleAvatar(
                          radius: 45.sp,
                        ))),
                10.pw,
                Column(
                  children: [
                    Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.sp),
                          child: Container(
                            color: Colors.black,
                            width: 0.3.sw,
                            height: 20.h,
                          ),
                        )),
                    5.ph,
                    Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.sp),
                          child: Container(
                            color: Colors.black,
                            width: 0.3.sw,
                            height: 20.h,
                          ),
                        )),
                  ],
                )
              ],
            ),
            40.ph,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 50.h,
                  ),
                )),
            40.ph,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 50.h,
                  ),
                )),
            40.ph,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 50.h,
                  ),
                )),
            40.ph,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 50.h,
                  ),
                )),
            40.ph,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 50.h,
                  ),
                )),
            40.ph,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 50.h,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
