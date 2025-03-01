import 'package:alkhatouna/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/stars_widget.dart';
import 'package:intl/intl.dart';

class OneReview extends StatefulWidget {
  final Reviews review;
  const OneReview({super.key, required this.review});

  @override
  State<OneReview> createState() => _OneReviewState();
}

class _OneReviewState extends State<OneReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.sp),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.all(25.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Helene Moore",
          //   style: TextStyle(
          //       fontSize: 14.sp,
          //       fontWeight: FontWeight.w600,
          //       color: AppColors.blackColor),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StarsWidget(
                reviewAvg: int.parse(widget.review.rate ?? ""),
                reviewCount: int.parse(widget.review.rate ?? ""),
              ),
              Text(
                "${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(widget.review.createdAt ?? ""))}",
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor),
              )
            ],
          ),
          10.ph,
          Text(
            "${widget.review.review}",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
          ),
          10.ph,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     Text(
          //       "Helpful",
          //       style: TextStyle(
          //           color: AppColors.greyColor,
          //           fontSize: 11.sp,
          //           fontWeight: FontWeight.w400),
          //     ),
          //     SvgPicture.asset("assets/icons/like.svg")
          //   ],
          // )
        ],
      ),
    );
  }
}
