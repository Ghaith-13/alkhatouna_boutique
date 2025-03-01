import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoreyChildrenSkeleton extends StatefulWidget {
  const CategoreyChildrenSkeleton({super.key});

  @override
  State<CategoreyChildrenSkeleton> createState() =>
      _CategoreyChildrenSkeletonState();
}

class _CategoreyChildrenSkeletonState extends State<CategoreyChildrenSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
              ClipOval(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
