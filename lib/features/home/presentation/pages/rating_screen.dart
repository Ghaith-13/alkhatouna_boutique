// ignore_for_file: must_be_immutable

import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/home/data/models/product_model.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/widgets/rating_widgets/one_review.dart';
import 'package:alkhatouna/features/home/presentation/widgets/rating_widgets/rating_bottom_sheet.dart';
import 'package:alkhatouna/features/home/presentation/widgets/rating_widgets/rating_info.dart';

class RatingScreen extends StatefulWidget {
  List<Reviews>? reviews;
  var finalRating;
  RatingScreen({super.key, required this.reviews, required this.finalRating});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  String? token;
  Future checkIfGuest() async {
    token = await CacheHelper.getData(key: "USER_TOKEN");
    if (token != null) {}
  }

  initState() {
    super.initState();
    checkIfGuest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: ElevatedButton(
        child: Container(
          width: 100.w,
          height: 36.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/pen.svg"),
              Text(
                "Write a review".tr(context),
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        onPressed: () {
          if (token == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                padding: EdgeInsets.only(
                    bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
                content: Text(
                  "Log in to enjoy these features.".tr(context),
                  style: const TextStyle(color: Colors.white),
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          } else {
            showFlexibleBottomSheet(
              bottomSheetColor: AppColors.whiteColor,
              barrierColor: Color.fromARGB(94, 83, 83, 83),
              bottomSheetBorderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.sp),
                  topRight: Radius.circular(40.sp)),
              minHeight: 0,
              initHeight: 0.8,
              maxHeight: 0.8,
              anchors: [0, 0.8],
              isSafeArea: true,
              context: context,
              builder: ratingBottomSheet,
            );
          }
        },
      ),
      appBar: AppConstant.customAppBar(
        context,
        "",
        true,
        withTranslate: true,
        IconColor: AppColors.blackColor,
        backgroundColor: AppColors.whiteColor,
        elvation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rating&Reviews".tr(context),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34.sp,
                    color: AppColors.blackColor),
              ),
              20.ph,
              widget.reviews == null
                  ? SizedBox()
                  : widget.reviews!.isEmpty
                      ? SizedBox()
                      : RatingInfo(
                          finalRating: widget.finalRating,
                          reviews: widget.reviews,
                        ),
              20.ph,
              widget.reviews == null
                  ? SizedBox()
                  : widget.reviews!.isEmpty
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.reviews == null ? 0 : widget.reviews!.length} ${"reviews".tr(context)}",
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            // Row(
                            //   children: [
                            //     Checkbox(value: false, onChanged: (value) {}),
                            //     Text(
                            //       "With photo".tr(context),
                            //       style: TextStyle(
                            //           fontSize: 14.sp,
                            //           fontWeight: FontWeight.w400,
                            //           color: AppColors.blackColor),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
              widget.reviews == null
                  ? Center(
                      child: Text(
                        "There are no reviews yet".tr(context),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                    )
                  : widget.reviews!.length == 0
                      ? Center(
                          child: Text(
                            "There are no reviews yet".tr(context),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.sp),
                          ),
                        )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.reviews!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return OneReview(
                              review: widget.reviews![index],
                            );
                          },
                        )
            ],
          ),
        ),
      ),
    );
  }
}
