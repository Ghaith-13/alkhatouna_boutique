import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CartSkeleton extends StatefulWidget {
  const CartSkeleton({super.key});

  @override
  State<CartSkeleton> createState() => _CartSkeletonState();
}

class _CartSkeletonState extends State<CartSkeleton> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  width: 100.w,
                  height: 40.h,
                ),
              )),
          30.ph,
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.sp),
                child: Container(
                  color: Colors.black,
                  width: 1.sw,
                  height: 0.15.sh,
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
                  height: 0.15.sh,
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
                  height: 0.15.sh,
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
                  height: 0.15.sh,
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
                  height: 0.15.sh,
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
                  height: 0.15.sh,
                ),
              )),
          10.ph,
        ],
      ),
    );
  }
}
