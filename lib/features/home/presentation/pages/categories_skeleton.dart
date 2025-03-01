import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesSkeleton extends StatefulWidget {
  const CategoriesSkeleton({super.key});

  @override
  State<CategoriesSkeleton> createState() => _CategoriesSkeletonState();
}

class _CategoriesSkeletonState extends State<CategoriesSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 0.9.sw,
        height: 1.sh,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.sp),
                      child: Container(
                        color: Colors.black,
                        width: 0.4.sw,
                        height: 30.h,
                      ),
                    )),
                20.ph,
                SizedBox(
                  height: 30,
                  width: 0.9.sw,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: Colors.black,
                                width: 0.2.sw,
                                height: 30.h,
                              ),
                            )),
                      );
                    },
                  ),
                ),
                20.ph,
                SizedBox(
                  width: 0.9.sw,
                  height: 30,
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
                              height: 30.h,
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
                              height: 30.h,
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
                              height: 30.h,
                            ),
                          )),
                    ],
                  ),
                ),
                30.ph,
                Container(
                  width: 0.9.sw,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            color: Colors.black,
                            width: 0.3.sw,
                            height: 125.h,
                          )),
                      10.pw,
                      Column(
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18.sp),
                                child: Container(
                                  color: Colors.black,
                                  width: 0.2.sw,
                                  height: 30.h,
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
                                  height: 30.h,
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
                                  height: 30.h,
                                ),
                              )),
                          10.ph
                        ],
                      )
                    ],
                  ),
                ),
                20.ph,
                Container(
                  width: 0.9.sw,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            color: Colors.black,
                            width: 0.3.sw,
                            height: 125.h,
                          )),
                      10.pw,
                      Column(
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18.sp),
                                child: Container(
                                  color: Colors.black,
                                  width: 0.2.sw,
                                  height: 30.h,
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
                                  height: 30.h,
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
                                  height: 30.h,
                                ),
                              )),
                          10.ph
                        ],
                      )
                    ],
                  ),
                ),
                20.ph,
                Container(
                  width: 0.9.sw,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            color: Colors.black,
                            width: 0.3.sw,
                            height: 125.h,
                          )),
                      10.pw,
                      Column(
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18.sp),
                                child: Container(
                                  color: Colors.black,
                                  width: 0.2.sw,
                                  height: 30.h,
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
                                  height: 30.h,
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
                                  height: 30.h,
                                ),
                              )),
                          10.ph
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
