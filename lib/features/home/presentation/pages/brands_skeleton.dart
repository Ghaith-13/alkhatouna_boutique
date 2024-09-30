import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BrandsSkeleton extends StatefulWidget {
  const BrandsSkeleton({super.key});

  @override
  State<BrandsSkeleton> createState() => _BrandsSkeletonState();
}

class _BrandsSkeletonState extends State<BrandsSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
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
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
