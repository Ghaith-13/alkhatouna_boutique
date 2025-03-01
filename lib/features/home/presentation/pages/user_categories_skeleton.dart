import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class UserCategoriesSkeleton extends StatefulWidget {
  const UserCategoriesSkeleton({super.key});

  @override
  State<UserCategoriesSkeleton> createState() => _ProductDetailsSkeletonState();
}

class _ProductDetailsSkeletonState extends State<UserCategoriesSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: AppColors.primaryColor),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.blackColor,
            )),
        title: Text('User Categories'.tr(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 50.h,
                  ),
                )),
            50.ph,
            Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(18.sp),
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
                  // borderRadius: BorderRadius.circular(18.sp),
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
                  // borderRadius: BorderRadius.circular(18.sp),
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
                  // borderRadius: BorderRadius.circular(18.sp),
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
                  // borderRadius: BorderRadius.circular(18.sp),
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
                  // borderRadius: BorderRadius.circular(18.sp),
                  child: Container(
                    color: Colors.black,
                    width: 1.sw,
                    height: 100.h,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
