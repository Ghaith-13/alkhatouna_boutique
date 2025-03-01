import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AllProductsSkeleton extends StatefulWidget {
  const AllProductsSkeleton({super.key});

  @override
  State<AllProductsSkeleton> createState() => _AllProductsSkeletonState();
}

class _AllProductsSkeletonState extends State<AllProductsSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0.sp),
      child: Column(
        children: [
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
                      width: 0.45.sw,
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
                      width: 0.45.sw,
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
                      width: 0.45.sw,
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
                      width: 0.45.sw,
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
                      width: 0.45.sw,
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
                      width: 0.45.sw,
                      height: 250.h,
                    ),
                  ))
            ],
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
