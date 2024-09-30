import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CheckOutSkeleton extends StatefulWidget {
  const CheckOutSkeleton({super.key});

  @override
  State<CheckOutSkeleton> createState() => _CheckOutSkeletonState();
}

class _CheckOutSkeletonState extends State<CheckOutSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0.sp),
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
                  height: 0.05.sh,
                ),
              )),
          10.ph,
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.sp),
                child: Container(
                  color: Colors.black,
                  width: 1.sw,
                  height: 0.2.sh,
                ),
              )),
          10.ph,
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.sp),
                child: Container(
                  color: Colors.black,
                  width: 1.sw,
                  height: 0.2.sh,
                ),
              )),
          10.ph,
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
                      width: 100.w,
                      height: 0.05.sh,
                    ),
                  )),
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.sp),
                    child: Container(
                      color: Colors.black,
                      width: 100.w,
                      height: 0.05.sh,
                    ),
                  )),
            ],
          ),
          10.ph,
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
                      width: 100.w,
                      height: 0.05.sh,
                    ),
                  )),
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.sp),
                    child: Container(
                      color: Colors.black,
                      width: 100.w,
                      height: 0.05.sh,
                    ),
                  )),
            ],
          ),
          10.ph,
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
                      width: 100.w,
                      height: 0.05.sh,
                    ),
                  )),
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.sp),
                    child: Container(
                      color: Colors.black,
                      width: 100.w,
                      height: 0.05.sh,
                    ),
                  )),
            ],
          ),
          10.ph,
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
                      width: 100.w,
                      height: 0.05.sh,
                    ),
                  )),
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.sp),
                    child: Container(
                      color: Colors.black,
                      width: 100.w,
                      height: 0.05.sh,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
