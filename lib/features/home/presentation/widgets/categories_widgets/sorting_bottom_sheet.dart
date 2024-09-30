import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';

Widget sortingProductsBotomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  return Container(
    child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView(
          controller: scrollController,
          children: [
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                )
              ],
            ),
            15.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sort by".tr(context),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                      fontSize: 18.sp),
                ),
              ],
            ),
            10.ph,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context.read<HomeCubit>().changeSortName("Popular");
                Navigator.pop(context);
                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                List<Products>? product = [];
                for (int i = 0;
                    i <
                        state.subCategoriesData![state.subCategoryId].products!
                            .length;
                    i++) {
                  if (state.subCategoriesData![state.subCategoryId].products![i]
                          .isFeatured ==
                      "1") {
                    product.add(state
                        .subCategoriesData![state.subCategoryId].products![i]);
                  }
                }

                newsubCategoriesData[state.subCategoryId].products = [];
                newsubCategoriesData[state.subCategoryId].products = product;
                context.read<HomeCubit>().changeSubCategory([]);
                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color:
                    state.sortName == "Popular" ? AppColors.primaryColor : null,
                child: Row(
                  children: [
                    Text(
                      "Popular".tr(context),
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: state.sortName == "Popular"
                              ? Colors.white
                              : AppColors.blackColor),
                    ),
                  ],
                ),
              ),
            ),
            10.ph,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context.read<HomeCubit>().changeSortName("Newest");
                Navigator.pop(context);
                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                newsubCategoriesData[state.subCategoryId].products!.sort(
                    (b, a) => DateTime.parse(a.createdAt ?? "")
                        .compareTo(DateTime.parse(b.createdAt ?? "")));
                context.read<HomeCubit>().changeSubCategory([]);
                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color:
                    state.sortName == "Newest" ? AppColors.primaryColor : null,
                child: Row(children: [
                  Text(
                    "Newest".tr(context),
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: state.sortName == "Newest"
                            ? Colors.white
                            : AppColors.blackColor),
                  ),
                ]),
              ),
            ),
            10.ph,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context.read<HomeCubit>().changeSortName("Customer Review");

                Navigator.pop(context);
                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                newsubCategoriesData[state.subCategoryId]
                    .products!
                    .sort((b, a) => a.reviewAvg!.compareTo(b.reviewAvg!));
                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: state.sortName == "Customer Review"
                    ? AppColors.primaryColor
                    : null,
                child: Row(children: [
                  Text(
                    "Customer Review".tr(context),
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: state.sortName == "Customer Review"
                            ? Colors.white
                            : AppColors.blackColor),
                  ),
                ]),
              ),
            ),
            10.ph,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context
                    .read<HomeCubit>()
                    .changeSortName("Price : lowest to high");
                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                newsubCategoriesData[state.subCategoryId].products!.sort(
                    (b, a) => double.parse(b.finalPrice ?? "0")
                        .compareTo(double.parse(a.finalPrice ?? "0")));
                context.read<HomeCubit>().changeSubCategory([]);
                Future.delayed(Duration(seconds: 3));

                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                Navigator.pop(context);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: state.sortName == "Price : lowest to high"
                    ? AppColors.primaryColor
                    : null,
                child: Row(children: [
                  Text(
                    "Price : lowest to high".tr(context),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: state.sortName == "Price : lowest to high"
                          ? Colors.white
                          : AppColors.blackColor,
                    ),
                  ),
                ]),
              ),
            ),
            10.ph,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeLoadingSubCateogries(true);

                context
                    .read<HomeCubit>()
                    .changeSortName("Price : highest to low");

                List<SubCategoryData> newsubCategoriesData =
                    state.subCategoriesData ?? [];
                newsubCategoriesData[state.subCategoryId].products!.sort(
                    (b, a) => double.parse(a.finalPrice ?? "0")
                        .compareTo(double.parse(b.finalPrice ?? "0")));
                context.read<HomeCubit>().changeSubCategory([]);
                Future.delayed(Duration(seconds: 3));

                context
                    .read<HomeCubit>()
                    .changeSubCategory(newsubCategoriesData);
                Navigator.pop(context);
                context.read<HomeCubit>().changeLoadingSubCateogries(false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: state.sortName == "Price : highest to low"
                    ? AppColors.primaryColor
                    : null,
                child: Row(children: [
                  Text(
                    "Price : highest to low".tr(context),
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: state.sortName == "Price : highest to low"
                            ? Colors.white
                            : AppColors.blackColor),
                  ),
                ]),
              ),
            ),
          ],
        );
      },
    ),
  );
}
