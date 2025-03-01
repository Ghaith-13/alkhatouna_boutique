// ignore_for_file: must_be_immutable

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/home/presentation/widgets/rating_widgets/chart_row.dart';
import 'package:intl/intl.dart';

class RatingInfo extends StatefulWidget {
  var finalRating;
  final List<Reviews>? reviews;

  RatingInfo({super.key, required this.reviews, required this.finalRating});

  @override
  State<RatingInfo> createState() => _RatingInfoState();
}

class _RatingInfoState extends State<RatingInfo> {
  int numberofRateingOne = 0;
  int numberofRateingTow = 0;
  int numberofRateingThree = 0;
  int numberofRateingFour = 0;
  int numberofRateingFive = 0;
  ///////////////////////
  int totalRating = 0;
  //////////////////////
  int onePercentge = 0;
  int towPercentge = 0;
  int threePercentge = 0;
  int fourPercentge = 0;
  int fivePercentge = 0;
  @override
  void initState() {
    if (widget.reviews != null) {
      setState(() {
        totalRating = widget.reviews!.length;
      });
      for (int i = 0; i < widget.reviews!.length; i++) {
        if (widget.reviews![i].rate == "1") {
          setState(() {
            numberofRateingOne = numberofRateingOne + 1;
          });
        } else if (widget.reviews![i].rate == "2") {
          setState(() {
            numberofRateingTow = numberofRateingTow + 1;
          });
        } else if (widget.reviews![i].rate == "3") {
          setState(() {
            numberofRateingThree = numberofRateingThree + 1;
          });
        } else if (widget.reviews![i].rate == "4") {
          setState(() {
            numberofRateingFour = numberofRateingFour + 1;
          });
        } else {
          setState(() {
            numberofRateingFive = numberofRateingFive + 1;
          });
        }
      }

      setState(() {
        onePercentge = (numberofRateingOne / totalRating * 100).toInt();
        towPercentge = (numberofRateingTow / totalRating * 100).toInt();
        threePercentge = (numberofRateingThree / totalRating * 100).toInt();
        fourPercentge = (numberofRateingFour / totalRating * 100).toInt();
        fivePercentge = (numberofRateingFive / totalRating * 100).toInt();
      });
    }
    super.initState();
  }

  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "${formatCurrency.format(widget.finalRating)}",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 44.sp,
                  color: AppColors.blackColor),
            ),
            Text(
              "${totalRating} ${"rating".tr(context)}",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.greyColor),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            chartRow(context, '5', fivePercentge),
            chartRow(context, '4', fourPercentge),
            chartRow(context, '3', threePercentge),
            chartRow(context, '2', towPercentge),
            chartRow(context, '1', onePercentge),
            SizedBox(height: 8),
          ],
        ),
      ],
    );
  }
}
