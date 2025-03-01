import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShippingAddressesSkeleton extends StatefulWidget {
  const ShippingAddressesSkeleton({super.key});

  @override
  State<ShippingAddressesSkeleton> createState() =>
      _ShippingAddressesSkeletonState();
}

class _ShippingAddressesSkeletonState extends State<ShippingAddressesSkeleton> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return index % 2 == 0
            ? FadeInLeft(
                child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.sp),
                      child: Container(
                        color: Colors.black,
                        width: 1.sw,
                        height: 0.2.sh,
                      ),
                    )),
              ))
            : FadeInRight(
                child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.sp),
                      child: Container(
                        color: Colors.black,
                        width: 1.sw,
                        height: 0.2.sh,
                      ),
                    )),
              ));
      },
    );
  }
}
