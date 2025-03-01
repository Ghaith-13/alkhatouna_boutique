// ignore_for_file: deprecated_member_use

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/features/home/presentation/pages/categories_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/pages/search_screen.dart';
import 'package:alkhatouna/main_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/filter_section_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_list_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class CategoriesScreen extends StatefulWidget {
  final String categoryId, title;
  const CategoriesScreen(
      {super.key, required this.categoryId, required this.title});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getSubCategoriesInfo(context, widget.categoryId);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        context
            .read<HomeCubit>()
            .getSubCategoriesInfo(context, widget.categoryId);
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<HomeCubit>().changePageNumberForSub(1);
    context.read<HomeCubit>().changeSubCategoryId(0);
    context.read<HomeCubit>().removeAllFilters();
    context.read<HomeCubit>().cahngesearchValue("");
    context.read<HomeCubit>().cahngeactiveTabIndex(0);
    context.read<HomeCubit>().cahngedontshowSearchIcon(false);
    context.read<HomeCubit>().changestopLoadingCategorey(false);
    // context.read<HomeCubit>().changestopLoadingCategorey(true);

    // context.read<HomeCubit>().ChangeCategoryIndex(1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppConstant.customAppBar(
              context, state.showmeshProducts ? widget.title : "", true,
              withTranslate: false,
              IconColor: AppColors.blackColor,
              backgroundColor: Colors.white,
              elvation: 0,
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 15.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => mainScreen(
                                      navigateIndex: 1,
                                      refresheveyThing: false,
                                    )),
                            (Route route) => false,
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/icons/basket.svg",
                          width: 25.sp,
                          height: 25.sp,
                          color: AppColors.blackColor,
                        ),
                      ),
                      10.horizontalSpace,
                      state.dontshowSearchIcon
                          ? InkWell(
                              onTap: () {
                                context
                                    .read<HomeCubit>()
                                    .EditeVariableForSearch();
                                context.read<HomeCubit>().cahngesearchValue("");
                                context
                                    .read<HomeCubit>()
                                    .cahngedontshowSearchIcon(false);
                                context.read<HomeCubit>().getSubCategoriesInfo(
                                    context, widget.categoryId);
                              },
                              child: Icon(
                                Icons.cancel,
                                size: 24.sp,
                                color: AppColors.blackColor,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                AppConstant.customNavigation(
                                    context,
                                    TypeaheadExample(
                                      categorryId: widget.categoryId,
                                    ),
                                    -1,
                                    -1);
                              },
                              child: Icon(
                                Icons.search,
                                size: 24.sp,
                                color: AppColors.blackColor,
                              ),
                            ),
                    ],
                  ),
                )
              ]),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.loadingSubCateogries
                  ? CategoriesSkeleton()
                  : state.subCategoriesData == null
                      ? CategoriesSkeleton()
                      : SingleChildScrollView(
                          controller: controller,
                          child: Column(
                            children: [
                              FilterSectionWidget(
                                  title: widget.title,
                                  categoryId: widget.categoryId),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 14.w),
                                child: state.showmeshProducts == false
                                    ? ListView.builder(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            state.subCategoriesData!.products ==
                                                    null
                                                ? 0
                                                : state.subCategoriesData!
                                                        .products!.length +
                                                    1,
                                        itemBuilder: (context, index) {
                                          if (index ==
                                              state.subCategoriesData!.products!
                                                  .length) {
                                            return index == 0
                                                ? Center(
                                                    child: Column(
                                                    children: [
                                                      Lottie.asset(
                                                          'assets/images/empty_data.json'),
                                                      Text(
                                                        "Sorry, there are no products."
                                                            .tr(context),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.sp),
                                                      ),
                                                    ],
                                                  ))
                                                : index % 20 == 0
                                                    ? Shimmer.fromColors(
                                                        baseColor: Colors
                                                            .grey.shade300,
                                                        highlightColor: Colors
                                                            .grey.shade100,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.sp),
                                                          child: Container(
                                                            color: Colors.black,
                                                            width: 1.sw,
                                                            height: 104.sp,
                                                          ),
                                                        ))
                                                    : SizedBox();
                                          } else {
                                            return index % 2 == 0
                                                ? FadeInLeft(
                                                    child: ProductListWidget(
                                                    productDetails: state
                                                        .subCategoriesData!
                                                        .products![index],
                                                  ))
                                                : FadeInRight(
                                                    child: ProductListWidget(
                                                    productDetails: state
                                                        .subCategoriesData!
                                                        .products![index],
                                                  ));
                                          }
                                        },
                                      )
                                    : state.subCategoriesData!.products!
                                                .length ==
                                            0
                                        ? Center(
                                            child: Column(
                                            children: [
                                              Lottie.asset(
                                                'assets/images/empty_data.json',
                                              ),
                                              Text(
                                                "Sorry, there are no products."
                                                    .tr(context),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.sp),
                                              ),
                                            ],
                                          ))
                                        : GridView.count(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: (1 / 2),
                                            children: List.generate(
                                                state.subCategoriesData!
                                                            .products ==
                                                        null
                                                    ? 0
                                                    : state.stopLoadingCategorey
                                                        ? state
                                                            .subCategoriesData!
                                                            .products!
                                                            .length
                                                        : state
                                                                .subCategoriesData!
                                                                .products!
                                                                .length +
                                                            2, (index) {
                                              if (index >=
                                                  state.subCategoriesData!
                                                      .products!.length) {
                                                return
                                                    // index % 20 == 0
                                                    //     ?
                                                    Shimmer.fromColors(
                                                        baseColor: Colors
                                                            .grey.shade300,
                                                        highlightColor: Colors
                                                            .grey.shade100,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.sp),
                                                          child: Container(
                                                            color: Colors.black,
                                                            width: 0.4.sw,
                                                            height: 100.h,
                                                          ),
                                                        ));
                                                // : SizedBox();
                                              } else
                                                return index % 2 == 0
                                                    ? FadeInLeft(
                                                        child: ProductCardWidget(
                                                            productDetails: state
                                                                    .subCategoriesData!
                                                                    .products![
                                                                index]))
                                                    : FadeInRight(
                                                        child: ProductCardWidget(
                                                            productDetails: state
                                                                .subCategoriesData!
                                                                .products![index]));
                                            }),
                                          ),
                              )
                            ],
                          ),
                        );
            },
          ),
        );
      },
    );
  }
}
