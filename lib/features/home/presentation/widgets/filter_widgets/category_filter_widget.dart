import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class CategoryFilterWidget extends StatefulWidget {
  const CategoryFilterWidget({super.key});

  @override
  State<CategoryFilterWidget> createState() => _CategoryFilterWidgetState();
}

class _CategoryFilterWidgetState extends State<CategoryFilterWidget> {
  List<String> categories = ["All", "Woman", "Man", "Girls", "Boys"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      color: Colors.white,
      child: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 10),
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: (1 / 0.4),
        children: List.generate(categories.length, (index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.blackColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8.0.sp),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor),
              ),
            ),
          );
        }),
      ),
    );
  }
}
