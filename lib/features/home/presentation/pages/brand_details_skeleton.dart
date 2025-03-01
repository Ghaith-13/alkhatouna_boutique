import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BrandDetailsSkeleton extends StatefulWidget {
  const BrandDetailsSkeleton({super.key});

  @override
  State<BrandDetailsSkeleton> createState() => _BrandDetailsSkeletonState();
}

class _BrandDetailsSkeletonState extends State<BrandDetailsSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0.sp),
      child: Column(
        children: [
          Row(
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipOval(
                    child: Container(
                      color: Colors.black,
                      width: 130.w,
                      height: 130.w,
                      // width: 0.4.sw,
                      // height: 100.h,
                    ),
                  )),
              10.horizontalSpace,
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.sp),
                    child: Container(
                      color: Colors.black,
                      width: 0.5.sw,
                      height: 40.h,
                    ),
                  ))
            ],
          ),
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
          )
        ],
      ),
    );
  }
}
