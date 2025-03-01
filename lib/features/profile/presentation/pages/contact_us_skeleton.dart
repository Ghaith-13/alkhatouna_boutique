import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ContactUsSkeleton extends StatefulWidget {
  const ContactUsSkeleton({super.key});

  @override
  State<ContactUsSkeleton> createState() => _ContactUsSkeletonState();
}

class _ContactUsSkeletonState extends State<ContactUsSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.sp),
                child: Container(
                  color: Colors.black,
                  width: 1.sw,
                  height: 200.h,
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
                  height: 100.h,
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
                  height: 100.h,
                ),
              )),
          10.ph,
        ],
      ),
    );
  }
}
