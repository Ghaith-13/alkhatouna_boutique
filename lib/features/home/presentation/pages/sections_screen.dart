import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/widgets/sections_widgets/section_details_widget.dart';

class SectionsScreen extends StatefulWidget {
  final int initalIndex;
  const SectionsScreen({super.key, required this.initalIndex});

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppConstant.customAppBar(context, "Sections", true,
          IconColor: AppColors.blackColor,
          backgroundColor: Colors.white,
          elvation: 0,
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 15.w),
              child: Icon(
                Icons.search,
                size: 24.sp,
                color: AppColors.blackColor,
              ),
            )
          ]),
      body: DefaultTabController(
          initialIndex: widget.initalIndex,
          length: 6,
          child: Column(
            children: [
              10.ph,
              Container(
                color: Colors.white,
                child: SizedBox(
                  height: 44.h,
                  width: 1.sw,
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.all(0),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 3.0.h, color: AppColors.primaryColor),
                    ),
                    dividerHeight: 0,
                    labelStyle:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                    labelColor: AppColors.blackColor,
                    indicatorColor: AppColors.primaryColor,
                    tabs: [
                      Tab(
                        text: "Make Up",
                      ),
                      Tab(
                        text: "Hair",
                      ),
                      Tab(
                        text: "Body Care",
                      ),
                      Tab(
                        text: "Body Care",
                      ),
                      Tab(
                        text: "Body Care",
                      ),
                      Tab(
                        text: "Body Care",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  SectionDetailsWidget(),
                  SectionDetailsWidget(),
                  SectionDetailsWidget(),
                  SectionDetailsWidget(),
                  SectionDetailsWidget(),
                  SectionDetailsWidget(),
                ],
              ))
            ],
          )),
    );
  }
}
