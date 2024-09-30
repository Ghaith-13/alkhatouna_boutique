// ignore_for_file: must_be_immutable

import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/features/favorite/data/models/favorite_model.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_price_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/stars_widget.dart';

class FavoriteProductList extends StatefulWidget {
  bool soldOut;
  final FavoriteProduct favoriteProduct;
  FavoriteProductList(
      {super.key, this.soldOut = false, required this.favoriteProduct});

  @override
  State<FavoriteProductList> createState() => _FavoriteProductListState();
}

class _FavoriteProductListState extends State<FavoriteProductList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConstant.customNavigation(
            context,
            ProductDetailsScreen(
              productId: widget.favoriteProduct.id.toString(),
            ),
            -1,
            0);
      },
      child: Column(
        children: [
          Stack(children: [
            Container(
              margin: EdgeInsets.only(bottom: 15.h),
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.sp),
                          bottomLeft: Radius.circular(8.sp)),
                      child: CachedNetworkImage(
                        width: 104.sp,
                        height: 104.sp,
                        fit: BoxFit.fill,
                        imageUrl: widget.favoriteProduct.imageUrl ?? '',
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                  10.pw,
                  Expanded(
                    child: BlocBuilder<LocaleCubit, LocaleState>(
                      builder: (context, locale) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              locale.locale.languageCode == "en"
                                  ? widget.favoriteProduct.nameEn ?? ""
                                  : locale.locale.languageCode == "ar"
                                      ? widget.favoriteProduct.nameAr ?? ""
                                      : widget.favoriteProduct.nameKu ?? "",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            // Text(
                            //   "Mango",
                            //   style: TextStyle(
                            //       fontSize: 11.sp,
                            //       color: AppColors.greyColor,
                            //       fontWeight: FontWeight.w600),
                            // ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "${"Color".tr(context)} :",
                            //       style: TextStyle(
                            //           fontSize: 11.sp,
                            //           fontWeight: FontWeight.w400,
                            //           color: AppColors.greyColor),
                            //     ),
                            //     5.pw,
                            //     Text(
                            //       "Gray",
                            //       style: TextStyle(
                            //           fontSize: 11.sp,
                            //           fontWeight: FontWeight.w400,
                            //           color: AppColors.blackColor),
                            //     ),
                            //     30.pw,
                            //     Text(
                            //       "${"Size".tr(context)} :",
                            //       style: TextStyle(
                            //           fontSize: 11.sp,
                            //           fontWeight: FontWeight.w400,
                            //           color: AppColors.greyColor),
                            //     ),
                            //     5.pw,
                            //     Text(
                            //       "L",
                            //       style: TextStyle(
                            //           fontSize: 11.sp,
                            //           fontWeight: FontWeight.w400,
                            //           color: AppColors.blackColor),
                            //     ),
                            //   ],
                            // ),
                            ProductPriceWidget(
                              productDetails: Products(
                                  finalPrice: widget.favoriteProduct.finalPrice,
                                  price: widget.favoriteProduct.price,
                                  discount: widget.favoriteProduct.discount),
                              haveOffer: widget.favoriteProduct.isDiscount!,
                            ),
                            StarsWidget(
                              reviewAvg: widget.favoriteProduct.reviewAvg,
                              reviewCount: widget.favoriteProduct.reviewCount,
                            ),
                            5.ph,
                            Row(
                              children: [
                                widget.favoriteProduct.isDiscount!
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: AppColors.redColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          "- ${widget.favoriteProduct.discount} %",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11.sp,
                                              color: Colors.white),
                                        ))
                                    : SizedBox(),
                                widget.favoriteProduct.isDiscount!
                                    ? 10.pw
                                    : SizedBox(),
                                widget.favoriteProduct.isFeatured == "1"
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          "New".tr(context),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11.sp,
                                              color: Colors.white),
                                        ))
                                    : SizedBox(),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            widget.soldOut
                ? SizedBox()
                : PositionedDirectional(
                    bottom: 5,
                    end: 0,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        width: 36.0.sp,
                        height: 36.0.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/budget.svg",
                          width: 26.sp,
                          height: 26.sp,
                        ))),
            PositionedDirectional(
                top: 5,
                end: 3,
                child: InkWell(
                  onTap: () {
                    context.read<HomeCubit>().toggleFavorite(
                        context, widget.favoriteProduct.id.toString());
                    context
                        .read<FavoriteCubit>()
                        .toggleFavorite(widget.favoriteProduct.id ?? -1);
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.greyColor,
                  ),
                )),
            widget.soldOut
                ? ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                    child: Container(
                      height: 130.sp,
                      width: 1.sw,
                      color: const Color.fromARGB(185, 255, 255, 255),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sorry, this item is currently sold out"
                                .tr(context),
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColors.greyColor,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
          ]),
          20.ph
        ],
      ),
    );
  }
}
