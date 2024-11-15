import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/auth/presentation/pages/log_in_screen.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:alkhatouna/features/home/presentation/pages/categories_skeleton.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/favorite/presentation/widgets/favorite_widgets.dart/favorite_card_widget.dart';
import 'package:alkhatouna/features/favorite/presentation/widgets/favorite_widgets.dart/favorite_product_list.dart';
import 'package:alkhatouna/features/favorite/presentation/widgets/favorite_widgets.dart/header_section.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    checkIfGuest();
  }

  String? token;
  bool loadingToken = false;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });
    token = await CacheHelper.getData(key: "USER_TOKEN");
    // print(token);
    if (token != null) {
      context.read<FavoriteCubit>().getFavoritesProduct(context);
      controller.addListener(() {
        if (controller.position.maxScrollExtent == controller.position.pixels) {
          context.read<FavoriteCubit>().getFavoritesProduct(context);
        }
      });
    }
    setState(() {
      loadingToken = false;
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<FavoriteCubit>().clearAll();
    context.read<FavoriteCubit>().removeAllFilters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          drawer: loadingToken
              ? SizedBox()
              : AppConstant.CustomDrawer(context, token),
          backgroundColor: AppColors.whiteColor,
          appBar: AppConstant.customAppBar(context,
              state.showmeshProducts ? "Favorites".tr(context) : "", false,
              withTranslate: false,
              IconColor: AppColors.blackColor,
              backgroundColor: Colors.white,
              elvation: 0,
              actions: [
                Padding(
                    padding: EdgeInsetsDirectional.only(end: 15.w),
                    child: SizedBox())
              ]),
          body: loadingToken
              ? SizedBox()
              : token == null
                  ? Padding(
                      padding: EdgeInsets.all(12.0.sp),
                      child: Column(
                        children: [
                          Lottie.asset('assets/images/log_in.json'),
                          Text(
                            "Log in to enjoy these features.".tr(context),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                          ),
                          10.ph,
                          AppConstant.customElvatedButton(context, "Login", () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const LogInScreen()),
                              (Route route) => false,
                            );
                          },
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  : BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, value) {
                        return value.loadingFavorite
                            ? CategoriesSkeleton()
                            : value.favoriteData == null
                                ? CategoriesSkeleton()
                                : value.favoriteData!.isEmpty
                                    ? Center(
                                        child: Column(
                                          children: [
                                            Lottie.asset(
                                                'assets/images/empty_data.json'),
                                            Text(
                                              "There are no products in the favorites"
                                                  .tr(context),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    : BlocBuilder<HomeCubit, HomeState>(
                                        builder: (context, state) {
                                          return SingleChildScrollView(
                                            controller: controller,
                                            child: Column(
                                              children: [
                                                HeaderSection(),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 14.w),
                                                  child: state.showmeshProducts ==
                                                          false
                                                      ? ListView.builder(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 10),
                                                          shrinkWrap: true,
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          itemCount: value
                                                                      .favoriteData![
                                                                          value
                                                                              .subCategoryId]
                                                                      .products ==
                                                                  null
                                                              ? 0
                                                              : value
                                                                      .favoriteData![
                                                                          value
                                                                              .subCategoryId]
                                                                      .products!
                                                                      .length +
                                                                  1,
                                                          itemBuilder:
                                                              (context, index) {
                                                            if (index ==
                                                                value
                                                                    .favoriteData![
                                                                        value
                                                                            .subCategoryId]
                                                                    .products!
                                                                    .length) {
                                                              return index == 0
                                                                  ? Center(
                                                                      child:
                                                                          Column(
                                                                      children: [
                                                                        Lottie.asset(
                                                                            'assets/images/empty_data.json'),
                                                                        Text(
                                                                          "Sorry, there are no products."
                                                                              .tr(context),
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 20.sp),
                                                                        ),
                                                                      ],
                                                                    ))
                                                                  : index % 20 ==
                                                                          0
                                                                      ? Shimmer.fromColors(
                                                                          baseColor: Colors.grey.shade300,
                                                                          highlightColor: Colors.grey.shade100,
                                                                          child: ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(18.sp),
                                                                            child:
                                                                                Container(
                                                                              color: Colors.black,
                                                                              width: 1.sw,
                                                                              height: 104.sp,
                                                                            ),
                                                                          ))
                                                                      : SizedBox();
                                                            } else {
                                                              return index %
                                                                          2 ==
                                                                      0
                                                                  ? FadeInLeft(
                                                                      child:
                                                                          FavoriteProductList(
                                                                      soldOut: value
                                                                              .favoriteData![value.subCategoryId]
                                                                              .products![index]
                                                                              .displayProduct!
                                                                          ? false
                                                                          : true,
                                                                      favoriteProduct: value
                                                                          .favoriteData![
                                                                              value.subCategoryId]
                                                                          .products![index],
                                                                    ))
                                                                  : FadeInRight(
                                                                      child:
                                                                          FavoriteProductList(
                                                                      soldOut: value
                                                                              .favoriteData![value.subCategoryId]
                                                                              .products![index]
                                                                              .displayProduct!
                                                                          ? false
                                                                          : true,
                                                                      favoriteProduct: value
                                                                          .favoriteData![
                                                                              value.subCategoryId]
                                                                          .products![index],
                                                                    ));
                                                            }
                                                          },
                                                        )
                                                      : value
                                                                  .favoriteData![
                                                                      value
                                                                          .subCategoryId]
                                                                  .products!
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
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.sp),
                                                                ),
                                                              ],
                                                            ))
                                                          : GridView.count(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          10),
                                                              shrinkWrap: true,
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              crossAxisCount: 2,
                                                              crossAxisSpacing:
                                                                  10,
                                                              childAspectRatio:
                                                                  (1 / 2),
                                                              children: List.generate(
                                                                  value.favoriteData![value.subCategoryId].products ==
                                                                          null
                                                                      ? 0
                                                                      : value
                                                                              .favoriteData![value
                                                                                  .subCategoryId]
                                                                              .products!
                                                                              .length +
                                                                          2,
                                                                  (index) {
                                                                if (index >=
                                                                    value
                                                                        .favoriteData![
                                                                            value.subCategoryId]
                                                                        .products!
                                                                        .length) {
                                                                  return index %
                                                                              20 ==
                                                                          0
                                                                      ? Shimmer.fromColors(
                                                                          baseColor: Colors.grey.shade300,
                                                                          highlightColor: Colors.grey.shade100,
                                                                          child: ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(18.sp),
                                                                            child:
                                                                                Container(
                                                                              color: Colors.black,
                                                                              width: 0.4.sw,
                                                                              height: 100.h,
                                                                            ),
                                                                          ))
                                                                      : SizedBox();
                                                                } else
                                                                  return index %
                                                                              2 ==
                                                                          0
                                                                      ? FadeInLeft(
                                                                          child: FavoriteCardWidget(
                                                                              soldOut: value.favoriteData![value.subCategoryId].products![index].displayProduct!
                                                                                  ? false
                                                                                  : true,
                                                                              favoriteProduct: value.favoriteData![value.subCategoryId].products![
                                                                                  index]))
                                                                      : FadeInRight(
                                                                          child: FavoriteCardWidget(
                                                                              soldOut: value.favoriteData![value.subCategoryId].products![index].displayProduct! ? false : true,
                                                                              favoriteProduct: value.favoriteData![value.subCategoryId].products![index]));
                                                              }),
                                                            ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                      },
                    ),
        );
      },
    );
  }
}
