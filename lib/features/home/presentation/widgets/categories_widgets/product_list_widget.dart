import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_price_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/stars_widget.dart';

class ProductListWidget extends StatefulWidget {
  final Products productDetails;
  const ProductListWidget({super.key, required this.productDetails});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
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
    setState(() {
      loadingToken = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loadingToken
        ? SizedBox()
        : InkWell(
            onTap: () {
              AppConstant.customNavigation(
                  context,
                  ProductDetailsScreen(
                    productId: widget.productDetails.id.toString(),
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
                              imageUrl: widget.productDetails.imageUrl ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                        BlocBuilder<LocaleCubit, LocaleState>(
                          builder: (context, locale) {
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      locale.locale.languageCode == "en"
                                          ? widget.productDetails.nameEn ?? ""
                                          : locale.locale.languageCode == "ar"
                                              ? widget.productDetails.nameAr ??
                                                  ""
                                              : widget.productDetails.nameKu ??
                                                  "",
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
                                    StarsWidget(
                                      reviewAvg:
                                          widget.productDetails.reviewAvg,
                                      reviewCount:
                                          widget.productDetails.reviewCount,
                                    ),
                                    ProductPriceWidget(
                                      productDetails: widget.productDetails,
                                      haveOffer:
                                          widget.productDetails.isDiscount!,
                                    ) // Text(
                                    //   "${widget.productDetails.price} \$",
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.w500,
                                    //       fontSize: 14.sp,
                                    //       color: AppColors.blackColor),
                                    // )
                                    ,
                                    Row(
                                      children: [
                                        widget.productDetails.isFeatured == "1"
                                            ? Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Text(
                                                  // ${(double.parse(widget.productDetails.discount) / double.parse(widget.productDetails.price) * 100).toStringAsFixed(2)}
                                                  "New",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11.sp,
                                                      color: Colors.white),
                                                ))
                                            : SizedBox(),
                                        widget.productDetails.isFeatured == "1"
                                            ? 10.pw
                                            : SizedBox(),
                                        widget.productDetails.isDiscount!
                                            ? Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: AppColors.redColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Text(
                                                  // ${(double.parse(widget.productDetails.discount) / double.parse(widget.productDetails.price) * 100).toStringAsFixed(2)}
                                                  "- ${widget.productDetails.discount} %",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11.sp,
                                                      color: Colors.white),
                                                ))
                                            : SizedBox(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  PositionedDirectional(
                      bottom: 5,
                      end: 0,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          width: 36.0.sp,
                          height: 36.0.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: widget.productDetails.isFavorite!
                              ? InkWell(
                                  onTap: () {
                                    if (token == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          padding: EdgeInsets.only(
                                              bottom: 30.h,
                                              top: 30.h,
                                              left: 50.w,
                                              right: 50.w),
                                          content: Text(
                                            "Log in to enjoy these features."
                                                .tr(context),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      context.read<HomeCubit>().toggleFavorite(
                                            context,
                                            widget.productDetails.id.toString(),
                                          );
                                      setState(() {
                                        widget.productDetails.isFavorite =
                                            !widget.productDetails.isFavorite!;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 18.sp,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    if (token == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          padding: EdgeInsets.only(
                                              bottom: 30.h,
                                              top: 30.h,
                                              left: 50.w,
                                              right: 50.w),
                                          content: Text(
                                            "Log in to enjoy these features."
                                                .tr(context),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      context.read<HomeCubit>().toggleFavorite(
                                            context,
                                            widget.productDetails.id.toString(),
                                          );
                                      setState(() {
                                        widget.productDetails.isFavorite =
                                            !widget.productDetails.isFavorite!;
                                      });
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/favorite.svg",
                                    width: 24.sp,
                                    height: 24.sp,
                                  ),
                                )))
                ]),
                20.ph
              ],
            ),
          );
  }
}
