import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/filter_widgets/dimensions_filter_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/filter_widgets/weights_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/widgets/filter_widgets/colors_filter_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/filter_widgets/range_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/filter_widgets/sizes_filter_widget.dart';

class FilterScreen extends StatefulWidget {
  final String categoryId;
  const FilterScreen({super.key, required this.categoryId});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<HomeCubit>()
                        .deleteFilter(context, widget.categoryId);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Discard".tr(context),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.blackColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: AppColors.blackColor,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              5.pw,
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (state.loadingFilter) {
                        } else {
                          context.read<HomeCubit>().getSubCategoriesInfo(
                              context, widget.categoryId,
                              fromFilter: true);
                        }
                      },
                      child: state.loadingFilter
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Apply".tr(context),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.white),
                            ),
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(AppColors.primaryColor)),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppConstant.customAppBar(
        context,
        "Filter",
        true,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 5,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: AppColors.primaryColor,
                              value: state.filterFeature,
                              onChanged: (value) {
                                context.read<HomeCubit>().changefilterFeature();
                              }),
                          5.pw,
                          Text("Feautred products".tr(context))
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: AppColors.primaryColor,
                              checkColor: Colors.white,
                              value: state.filterDiscount,
                              onChanged: (value) {
                                context
                                    .read<HomeCubit>()
                                    .changefilterDiscount();
                              }),
                          5.pw,
                          Text("Discount Products".tr(context))
                        ],
                      ),
                    ],
                  ),
                ),
                10.ph,
                state.subCategoriesData!.minPrice ==
                        state.subCategoriesData!.maxPrice
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          "Price range".tr(context),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: AppColors.blackColor),
                        ),
                      ),

                state.subCategoriesData!.minPrice ==
                        state.subCategoriesData!.maxPrice
                    ? SizedBox()
                    : 10.ph,
                state.subCategoriesData == null
                    ? SizedBox()
                    : state.subCategoriesData!.minPrice ==
                            state.subCategoriesData!.maxPrice
                        ? SizedBox()
                        : RangeWidget(
                            subCategoryData: state.subCategoriesData!),
                30.ph,
                state.subCategoriesData!.uniqueColors == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueColors!.length == 0
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              "Colors".tr(context),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: AppColors.blackColor),
                            ),
                          ),

                state.subCategoriesData!.uniqueColors == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueColors!.length == 0
                        ? SizedBox()
                        : 10.ph,

                state.subCategoriesData!.uniqueColors == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueColors!.length == 0
                        ? SizedBox()
                        : ColorsFilterWidget(),
                30.ph,

                state.subCategoriesData!.uniqueSizes == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueSizes!.length == 0
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              "Sizes".tr(context),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: AppColors.blackColor),
                            ),
                          ),

                state.subCategoriesData!.uniqueSizes == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueSizes!.length == 0
                        ? SizedBox()
                        : 10.ph,

                state.subCategoriesData!.uniqueSizes == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueSizes!.length == 0
                        ? SizedBox()
                        : SizesFilterWidget(),
                30.ph,

                state.subCategoriesData!.uniqueWeights == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueWeights!.length == 0
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              "weights".tr(context),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: AppColors.blackColor),
                            ),
                          ),

                state.subCategoriesData!.uniqueWeights == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueWeights!.length == 0
                        ? SizedBox()
                        : 10.ph,

                state.subCategoriesData!.uniqueWeights == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueWeights!.length == 0
                        ? SizedBox()
                        : WeightsFilterWidget(),
                30.ph,

                state.subCategoriesData!.uniqueDimensions == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueDimensions!.length == 0
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              "dimensions".tr(context),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: AppColors.blackColor),
                            ),
                          ),

                state.subCategoriesData!.uniqueDimensions == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueDimensions!.length == 0
                        ? SizedBox()
                        : 10.ph,

                state.subCategoriesData!.uniqueDimensions == null
                    ? SizedBox()
                    : state.subCategoriesData!.uniqueDimensions!.length == 0
                        ? SizedBox()
                        : DimensionsFilterWidget(),
                30.ph,
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 12.w),
                //   child: Text(
                //     "Category".tr(context),
                //     style: TextStyle(
                //         fontWeight: FontWeight.w600,
                //         fontSize: 16.sp,
                //         color: AppColors.blackColor),
                //   ),
                // ),
                // 10.ph,
                // CategoryFilterWidget()
              ],
            ),
          );
        },
      ),
    );
  }
}
