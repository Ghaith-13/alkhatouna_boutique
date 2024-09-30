import 'package:alkhatouna/features/favorite/data/models/favorite_model.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';

Widget SortingFavorite(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  return Container(
    child: BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, value) {
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
                    context.read<HomeCubit>().changeSortName("Popular");
                    Navigator.pop(context);
                    List<FavoriteData> newsubCategoriesData =
                        state.favoriteData ?? [];
                    List<FavoriteProduct>? product = [];
                    for (int i = 0;
                        i <
                            state.favoriteData![state.subCategoryId].products!
                                .length;
                        i++) {
                      if (state.favoriteData![state.subCategoryId].products![i]
                              .isFeatured ==
                          "1") {
                        product.add(state
                            .favoriteData![state.subCategoryId].products![i]);
                      }
                    }

                    newsubCategoriesData[state.subCategoryId].products = [];
                    newsubCategoriesData[state.subCategoryId].products =
                        product;
                    context.read<FavoriteCubit>().changeFavoriteData([]);
                    context
                        .read<FavoriteCubit>()
                        .changeFavoriteData(newsubCategoriesData);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: value.sortName == "Popular"
                        ? AppColors.primaryColor
                        : null,
                    child: Row(
                      children: [
                        Text(
                          "Popular".tr(context),
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: value.sortName == "Popular"
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
                    context.read<HomeCubit>().changeSortName("Newest");
                    Navigator.pop(context);
                    List<FavoriteData> newsubCategoriesData =
                        state.favoriteData ?? [];
                    newsubCategoriesData[state.subCategoryId].products!.sort(
                        (b, a) => DateTime.parse(a.createdAt ?? "")
                            .compareTo(DateTime.parse(b.createdAt ?? "")));
                    context.read<FavoriteCubit>().changeFavoriteData([]);
                    context
                        .read<FavoriteCubit>()
                        .changeFavoriteData(newsubCategoriesData);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: value.sortName == "Newest"
                        ? AppColors.primaryColor
                        : null,
                    child: Row(children: [
                      Text(
                        "Newest".tr(context),
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: value.sortName == "Newest"
                                ? Colors.white
                                : AppColors.blackColor),
                      ),
                    ]),
                  ),
                ),
                10.ph,
                InkWell(
                  onTap: () {
                    context.read<HomeCubit>().changeSortName("Customer Review");

                    Navigator.pop(context);
                    List<FavoriteData> newsubCategoriesData =
                        state.favoriteData ?? [];
                    newsubCategoriesData[state.subCategoryId]
                        .products!
                        .sort((b, a) => a.reviewAvg!.compareTo(b.reviewAvg!));
                    context
                        .read<FavoriteCubit>()
                        .changeFavoriteData(newsubCategoriesData);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: value.sortName == "Customer Review"
                        ? AppColors.primaryColor
                        : null,
                    child: Row(children: [
                      Text(
                        "Customer Review".tr(context),
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: value.sortName == "Customer Review"
                                ? Colors.white
                                : AppColors.blackColor),
                      ),
                    ]),
                  ),
                ),
                10.ph,
                InkWell(
                  onTap: () {
                    context
                        .read<HomeCubit>()
                        .changeSortName("Price : lowest to high");
                    List<FavoriteData> newsubCategoriesData =
                        state.favoriteData ?? [];
                    newsubCategoriesData[state.subCategoryId].products!.sort(
                        (b, a) => double.parse(b.finalPrice ?? "0")
                            .compareTo(double.parse(a.finalPrice ?? "0")));
                    context.read<FavoriteCubit>().changeFavoriteData([]);

                    context
                        .read<FavoriteCubit>()
                        .changeFavoriteData(newsubCategoriesData);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: value.sortName == "Price : lowest to high"
                        ? AppColors.primaryColor
                        : null,
                    child: Row(children: [
                      Text(
                        "Price : lowest to high".tr(context),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: value.sortName == "Price : lowest to high"
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
                    context
                        .read<HomeCubit>()
                        .changeSortName("Price : highest to low");

                    List<FavoriteData> newsubCategoriesData =
                        state.favoriteData ?? [];
                    newsubCategoriesData[state.subCategoryId].products!.sort(
                        (b, a) => double.parse(a.finalPrice ?? "0")
                            .compareTo(double.parse(b.finalPrice ?? "0")));
                    context.read<FavoriteCubit>().changeFavoriteData([]);
                    Future.delayed(Duration(seconds: 3));

                    context
                        .read<FavoriteCubit>()
                        .changeFavoriteData(newsubCategoriesData);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: value.sortName == "Price : highest to low"
                        ? AppColors.primaryColor
                        : null,
                    child: Row(children: [
                      Text(
                        "Price : highest to low".tr(context),
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: value.sortName == "Price : highest to low"
                                ? Colors.white
                                : AppColors.blackColor),
                      ),
                    ]),
                  ),
                ),
              ],
            );
          },
        );
      },
    ),
  );
}
