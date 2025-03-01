import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

Widget chartRow(BuildContext context, String label, int pct) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      // Text(
      //   label,
      // ),
      SizedBox(width: 8),
      Container(
        width: 16 * 5.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (int i = 0; i < int.parse(label); i++)
              Icon(
                Icons.star,
                size: 16.sp,
                color: Color.fromARGB(255, 255, 186, 73),
              ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Stack(children: [
          Container(
            width: 130.w,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            child: Text(''),
          ),
          Container(
            width: (pct / 100) * 130.w,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Text(''),
          ),
        ]),
      ),
      Text(
        '$pct%',
      ),
    ],
  );
}
