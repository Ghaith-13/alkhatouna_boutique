// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class StarsWidget extends StatefulWidget {
  var reviewCount, reviewAvg;
  StarsWidget({super.key, required this.reviewAvg, required this.reviewCount});

  @override
  State<StarsWidget> createState() => _StarsWidgetState();
}

class _StarsWidgetState extends State<StarsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 20.sp,
          color: widget.reviewAvg >= 1
              ? Color.fromARGB(255, 255, 186, 73)
              : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 20.sp,
          color: widget.reviewAvg >= 2
              ? Color.fromARGB(255, 255, 186, 73)
              : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 20.sp,
          color: widget.reviewAvg >= 3
              ? Color.fromARGB(255, 255, 186, 73)
              : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 20.sp,
          color: widget.reviewAvg >= 4
              ? Color.fromARGB(255, 255, 186, 73)
              : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 20.sp,
          color: widget.reviewAvg >= 5
              ? Color.fromARGB(255, 255, 186, 73)
              : Colors.grey,
        ),
        5.pw,
        Text(
          "(${widget.reviewCount})",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.greyColor,
              fontSize: 15.sp),
        )
      ],
    );
  }
}
