import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsSkeleton extends StatefulWidget {
  const ProductDetailsSkeleton({super.key});

  @override
  State<ProductDetailsSkeleton> createState() => _ProductDetailsSkeletonState();
}

class _ProductDetailsSkeletonState extends State<ProductDetailsSkeleton> {
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
                  width: 1.sw,
                  height: 413.h,
                ),
              )),
          10.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        width: 0.2.sw,
                        height: 20.h,
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
                        width: 0.2.sw,
                        height: 20.h,
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
                        width: 0.1.sw,
                        height: 20.h,
                      ),
                    )),
              ],
            ),
          ),
          10.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        width: 0.2.sw,
                        height: 20.h,
                      ),
                    )),
                Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 0.2.sw,
                        height: 20.h,
                      ),
                    )),
              ],
            ),
          ),
          10.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 0.2.sw,
                    height: 20.h,
                  ),
                )),
          ),
          10.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 0.2.sw,
                    height: 20.h,
                  ),
                )),
          ),
          10.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 20.h,
                  ),
                )),
          ),
          10.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 20.h,
                  ),
                )),
          ),
          10.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 20.h,
                  ),
                )),
          ),
          10.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 20.h,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
