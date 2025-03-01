import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/pages/categories_screen.dart';

class SectionCardWidget extends StatefulWidget {
  final String title;
  final String image;
  const SectionCardWidget(
      {super.key, required this.title, required this.image});

  @override
  State<SectionCardWidget> createState() => _SectionCardWidgetState();
}

class _SectionCardWidgetState extends State<SectionCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConstant.customNavigation(
            context,
            CategoriesScreen(
              categoryId: "9",
              title: "",
            ),
            -1,
            0);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.sp),
                    topRight: Radius.circular(8.sp)),
                child: Image.asset(
                  widget.image,
                  height: 125.h,
                  fit: BoxFit.fill,
                  width: 1.sw,
                ),
              ),
              Expanded(
                  child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
