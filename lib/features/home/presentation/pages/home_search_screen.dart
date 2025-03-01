import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/brand_details_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/home_search_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/one_section_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchScreen extends StatefulWidget {
  const HomeSearchScreen({super.key});

  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, "Search Result", true),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(12.0.sp),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return BlocBuilder<LocaleCubit, LocaleState>(
                    builder: (context, locale) {
                      return state.laodingFullSearch
                          ? HomeSearchSkeleton()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 0.9.sw,
                                    child: TextField(
                                      textInputAction: TextInputAction.search,
                                      onSubmitted: (value) {
                                        if (value.isNotEmpty) {
                                          context
                                              .read<HomeCubit>()
                                              .getFullSearch(context, value);
                                          // AppConstant.customNavigation(context,
                                          //     HomeSearchScreen(), 1, 0);
                                        }
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: AppColors.primaryColor,
                                        ),
                                        filled: false,
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width:
                                                2.0, // Adjust the border width as needed
                                          ),
                                        ),
                                        hintStyle: TextStyle(
                                            color: AppColors.primaryColor),
                                        hintText:
                                            "Find what you want".tr(context),
                                      ),
                                    )),
                                10.verticalSpace,
                                Text(
                                  "Sections".tr(context),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34.sp),
                                ),
                                state.searchData!.categories!.length == 0
                                    ? Center(
                                        child: Text(
                                        "No search results".tr(context),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                    : GridView.count(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 15,
                                        childAspectRatio: (1.0 / 1.8),
                                        mainAxisSpacing: 30,
                                        children: List.generate(
                                            state.searchData!.categories!
                                                .length, (index) {
                                          return FadeInUp(
                                              child: OneSectionWidget(
                                                  categoryId: state.searchData!
                                                      .categories![index].id
                                                      .toString(),
                                                  logo: state
                                                      .searchData!
                                                      .categories![index]
                                                      .imageUrl,
                                                  title: locale.locale
                                                              .languageCode ==
                                                          "en"
                                                      ? state
                                                          .searchData!
                                                          .categories![index]
                                                          .nameEn
                                                      : locale.locale
                                                                  .languageCode ==
                                                              "ar"
                                                          ? state
                                                              .searchData!
                                                              .categories![
                                                                  index]
                                                              .nameAr
                                                          : state
                                                              .searchData!
                                                              .categories![
                                                                  index]
                                                              .nameKu));
                                        }),
                                      ),
                                20.verticalSpace,
                                Text(
                                  "Brands".tr(context),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34.sp),
                                ),
                                state.searchData!.brands!.length == 0
                                    ? Center(
                                        child: Text(
                                        "No search results".tr(context),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                    : GridView.count(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 15,
                                        childAspectRatio: (1.0 / 1.8),
                                        mainAxisSpacing: 30,
                                        children: List.generate(
                                            state.searchData!.brands!.length,
                                            (index) {
                                          return FadeInUp(
                                              child: InkWell(
                                            onTap: () {
                                              AppConstant.customNavigation(
                                                  context,
                                                  BrandDetailsScreen(
                                                    brandId: state.searchData!
                                                        .brands![index].id
                                                        .toString(),
                                                  ),
                                                  -1,
                                                  0);
                                            },
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    // margin: EdgeInsetsDirectional.only(end: 10),
                                                    // width: 60,
                                                    // height: 110,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.3),
                                                          blurRadius: 7.0,
                                                          spreadRadius: 1.0,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0)
                                                                        .withOpacity(
                                                                            0.3),
                                                                    blurRadius:
                                                                        2.0,
                                                                    spreadRadius:
                                                                        1.0,
                                                                  ),
                                                                ],
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                width: 90,
                                                                height: 90,
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                imageUrl: state
                                                                        .searchData!
                                                                        .brands![
                                                                            index]
                                                                        .logoUrl ??
                                                                    "",
                                                                errorWidget: (context,
                                                                        name,
                                                                        imageProvider) =>
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.r),
                                                                    // image:
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/logo.jpg",
                                                                    fit: BoxFit
                                                                        .scaleDown,
                                                                  ),
                                                                ),
                                                                imageBuilder:
                                                                    (context,
                                                                            imageProvider) =>
                                                                        Container(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              5),
                                                                  width: 90,
                                                                  height: 90,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(0.3),
                                                                        blurRadius:
                                                                            7.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    image:
                                                                        DecorationImage(
                                                                      image:
                                                                          imageProvider,
                                                                      fit: BoxFit
                                                                          .scaleDown,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  5.verticalSpace,
                                                  Text(
                                                    state
                                                            .searchData!
                                                            .brands![index]
                                                            .name ??
                                                        "",
                                                    // overflow: TextOverflow.fade,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ));
                                        }),
                                      ),
                                20.verticalSpace,
                                Text(
                                  "Products".tr(context),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34.sp),
                                ),
                                state.searchData!.products!.length == 0
                                    ? Center(
                                        child: Text(
                                        "No search results".tr(context),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                    : GridView.count(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: (1 / 2),
                                        children: List.generate(
                                            state.searchData!.products!.length,
                                            (index) {
                                          return FadeInUp(
                                              child: ProductCardWidget(
                                            fromSimilarProduct: false,
                                            productDetails: Products(
                                                points: state.searchData!
                                                    .products![index].points,
                                                finalPrice: state
                                                    .searchData!
                                                    .products![index]
                                                    .finalPrice,
                                                discount: state.searchData!
                                                    .products![index].discount,
                                                id: state.searchData!
                                                    .products![index].id,
                                                imageUrl: state.searchData!
                                                    .products![index].imageUrl,
                                                isDiscount: state
                                                    .searchData!
                                                    .products![index]
                                                    .isDiscount,
                                                isFavorite: false,
                                                nameAr: state.searchData!
                                                    .products![index].nameAr,
                                                nameEn: state.searchData!
                                                    .products![index].nameEn,
                                                nameKu: state.searchData!
                                                    .products![index].nameKu,
                                                isFeatured: state
                                                    .searchData!
                                                    .products![index]
                                                    .isFeatured,
                                                price: state.searchData!
                                                    .products![index].price,
                                                reviewAvg: state.searchData!
                                                    .products![index].reviewAvg,
                                                reviewCount: state
                                                    .searchData!
                                                    .products![index]
                                                    .reviewCount),
                                          ));
                                        }),
                                      )
                              ],
                            );
                    },
                  );
                },
              ))),
    );
  }
}
