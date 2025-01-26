import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:alkhatouna/features/favorite/presentation/widgets/favorite_widgets.dart/colors_widget.dart';
import 'package:alkhatouna/features/favorite/presentation/widgets/favorite_widgets.dart/dimensions_filter.dart';
import 'package:alkhatouna/features/favorite/presentation/widgets/favorite_widgets.dart/sizes_fav_widget.dart';
import 'package:alkhatouna/features/favorite/presentation/widgets/favorite_widgets.dart/weights_widget.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/widgets/filter_widgets/range_widget.dart';

class FilterFavScreen extends StatefulWidget {
  const FilterFavScreen({super.key});

  @override
  State<FilterFavScreen> createState() => _FilterFavScreenState();
}

class _FilterFavScreenState extends State<FilterFavScreen> {
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
                    context.read<FavoriteCubit>().deleteFilter(context);
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
                child: BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (state.loadingFilter) {
                        } else {
                          context
                              .read<FavoriteCubit>()
                              .getFavoritesProduct(context, fromFilter: true);
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
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
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
                                context
                                    .read<FavoriteCubit>()
                                    .changefilterFeature();
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
                                    .read<FavoriteCubit>()
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
                state.favoriteData![state.subCategoryId].minPrice ==
                        state.favoriteData![state.subCategoryId].maxPrice
                    ? SizedBox()
                    : state.favoriteData?[state.subCategoryId] == null
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
                state.favoriteData?[state.subCategoryId] == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].minPrice ==
                            state.favoriteData![state.subCategoryId].maxPrice
                        ? SizedBox()
                        : 10.ph,
                state.favoriteData?[state.subCategoryId] == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].minPrice ==
                            state.favoriteData![state.subCategoryId].maxPrice
                        ? SizedBox()
                        : RangeWidget(
                            subCategoryData: SubCategoryData(
                                minPrice: state
                                    .favoriteData![state.subCategoryId]
                                    .minPrice,
                                maxPrice: state
                                    .favoriteData![state.subCategoryId]
                                    .maxPrice)),
                30.ph,
                state.favoriteData![state.subCategoryId].uniqueColors == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueColors!
                                .length ==
                            0
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
                state.favoriteData![state.subCategoryId].uniqueColors == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueColors!
                                .length ==
                            0
                        ? SizedBox()
                        : 10.ph,
                state.favoriteData![state.subCategoryId].uniqueColors == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueColors!
                                .length ==
                            0
                        ? SizedBox()
                        : ColorsFilterFavoriteWidget(),
                state.favoriteData![state.subCategoryId].uniqueColors == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueColors!
                                .length ==
                            0
                        ? SizedBox()
                        : 30.ph,
                state.favoriteData![state.subCategoryId].uniqueSizes == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueSizes!
                            .isEmpty
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
                state.favoriteData![state.subCategoryId].uniqueSizes == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueSizes!
                            .isEmpty
                        ? SizedBox()
                        : 10.ph,
                state.favoriteData![state.subCategoryId].uniqueSizes == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueSizes!
                            .isEmpty
                        ? SizedBox()
                        : SizesFavWidget(),
                state.favoriteData![state.subCategoryId].uniqueSizes == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueSizes!
                            .isEmpty
                        ? SizedBox()
                        : 30.ph,
                state.favoriteData![state.subCategoryId].uniqueWeights == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueWeights!
                            .isEmpty
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
                state.favoriteData![state.subCategoryId].uniqueWeights == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueWeights!
                            .isEmpty
                        ? SizedBox()
                        : 10.ph,
                state.favoriteData![state.subCategoryId].uniqueWeights == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueWeights!
                            .isEmpty
                        ? SizedBox()
                        : WeightsFavWidget(),
                state.favoriteData![state.subCategoryId].uniqueWeights == null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueWeights!
                            .isEmpty
                        ? SizedBox()
                        : 30.ph,
                state.favoriteData![state.subCategoryId].uniqueDimensions ==
                        null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueDimensions!
                            .isEmpty
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
                state.favoriteData![state.subCategoryId].uniqueDimensions ==
                        null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueDimensions!
                            .isEmpty
                        ? SizedBox()
                        : 10.ph,
                state.favoriteData![state.subCategoryId].uniqueDimensions ==
                        null
                    ? SizedBox()
                    : state.favoriteData![state.subCategoryId].uniqueDimensions!
                            .isEmpty
                        ? SizedBox()
                        : dimensionsFavWidget(),

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
