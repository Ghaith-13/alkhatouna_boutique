// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/product_details_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/widgets/product_details_widgets/dimensions_drop_down.dart';
import 'package:alkhatouna/features/home/presentation/widgets/product_details_widgets/weights_drop_down.dart';
import 'package:alkhatouna/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/widgets/product_details_widgets/color_drop_down.dart';
import 'package:alkhatouna/features/home/presentation/widgets/product_details_widgets/product_description_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/product_details_widgets/product_details_bottom_navigation.dart';
import 'package:alkhatouna/features/home/presentation/widgets/product_details_widgets/product_slider_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/product_details_widgets/similar_products.dart';
import 'package:alkhatouna/features/home/presentation/widgets/product_details_widgets/sizes_drop_down.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getProductDetails(context, widget.productId);
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
  void deactivate() {
    super.deactivate();
    context.read<HomeCubit>().removeProductInfoForCart();
  }

  bool loadingshare = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ProductDetailsBottomNavigation(),
      appBar: AppConstant.customAppBar(
        context,
        "",
        true,
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
                            builder: (context) => mainScreen(navigateIndex: 1)),
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
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return loadingToken
                          ? SizedBox()
                          : state.loadingProductDetails
                              ? SizedBox()
                              : state.productData == null
                                  ? SizedBox()
                                  : BlocBuilder<LocaleCubit, LocaleState>(
                                      builder: (context, locale) {
                                        return InkWell(
                                          onTap: () async {
                                            if (loadingshare) {
                                            } else {
                                              setState(() {
                                                loadingshare = true;
                                              });
                                              String imageUrl = "";
                                              for (int i = 0;
                                                  i <
                                                      state
                                                          .productData!
                                                          .product!
                                                          .attachments!
                                                          .length;
                                                  i++) {
                                                if (state.productData!.product!
                                                        .attachments![i].type ==
                                                    "image") {
                                                  imageUrl = state
                                                      .productData!
                                                      .product!
                                                      .attachments![i]
                                                      .imageUrl!;
                                                  break;
                                                }
                                              }
                                              print(imageUrl);
                                              final url = Uri.parse(imageUrl);
                                              final response =
                                                  await http.get(url);
                                              final bytes = response.bodyBytes;
                                              final temp =
                                                  await getTemporaryDirectory();
                                              final path =
                                                  '${temp.path}/image.jpg';
                                              File(path)
                                                  .writeAsBytesSync(bytes);
                                              XFile file = new XFile(path);
                                              setState(() {
                                                loadingshare = false;
                                              });
                                              await Share.shareXFiles([file],
                                                  text:
                                                      '${"Product link".tr(context)} : https://alkhatouna-boutique-8d85a.web.app/productDetails/?id=${state.productData!.product!.id!} \n ${locale.locale.languageCode == "en" ? state.productData!.product!.descriptionEn ?? "" : locale.locale.languageCode == "ar" ? state.productData!.product!.descriptionAr ?? "" : state.productData!.product!.descriptionKu ?? ""} \n ${state.productData!.product!.finalPrice} د.ع');
                                            }
                                          },
                                          child: loadingshare
                                              ? CircularProgressIndicator(
                                                  color: AppColors.primaryColor,
                                                )
                                              : Icon(
                                                  Icons.share,
                                                  size: 24.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                        );
                                      },
                                    );
                    },
                  ),
                ],
              )),
        ],
      ),
      body: loadingToken
          ? SizedBox()
          : BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.loadingProductDetails
                    ? ProductDetailsSkeleton()
                    : state.productData == null
                        ? ProductDetailsSkeleton()
                        : BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ProductSliderWidget(),
                                    20.ph,
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizesDropDown(
                                            productdata: state.productData!,
                                          ),
                                          ColorDropDown(
                                            productData: state.productData!,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(10),
                                              width: 36.0.sp,
                                              height: 36.0.sp,
                                              decoration: BoxDecoration(
                                                // border: Border.all(
                                                //   color: AppColors.blackColor,
                                                //   width: 1.0,
                                                // ),
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    blurRadius: 5.0,
                                                    spreadRadius: 1.0,
                                                  ),
                                                ],
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  if (token == null) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        backgroundColor:
                                                            Colors.red,
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 30.h,
                                                                top: 30.h,
                                                                left: 50.w,
                                                                right: 50.w),
                                                        content: Text(
                                                          "Log in to enjoy these features."
                                                              .tr(context),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        duration:
                                                            const Duration(
                                                                seconds: 2),
                                                      ),
                                                    );
                                                  } else {
                                                    context
                                                        .read<HomeCubit>()
                                                        .toggleFavorite(
                                                            context,
                                                            state.productData!
                                                                .product!.id
                                                                .toString(),
                                                            fromProductDetails:
                                                                true);
                                                  }
                                                },
                                                child: state.productData!
                                                        .product!.isFavorite!
                                                    ? Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                        size: 18.sp,
                                                      )
                                                    : SvgPicture.asset(
                                                        "assets/icons/favorite.svg",
                                                        width: 24.sp,
                                                        height: 24.sp,
                                                      ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    20.ph,
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          WeightsDropDown(
                                            productdata: state.productData!,
                                          ),
                                          DimensionsDropDown(
                                            productdata: state.productData!,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(10),
                                              width: 36.0.sp,
                                              height: 36.0.sp,
                                              child: Text(""))
                                        ],
                                      ),
                                    ),
                                    20.ph,
                                    ProductDescriptionWidget(),
                                    20.ph,
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child:
                                          BlocBuilder<LocaleCubit, LocaleState>(
                                        builder: (context, locale) {
                                          return Text(
                                            locale.locale.languageCode == "en"
                                                ? state.productData!.product!
                                                        .descriptionEn ??
                                                    ""
                                                : locale.locale.languageCode ==
                                                        "ar"
                                                    ? state
                                                            .productData!
                                                            .product!
                                                            .descriptionAr ??
                                                        ""
                                                    : state
                                                            .productData!
                                                            .product!
                                                            .descriptionKu ??
                                                        "",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.blackColor),
                                          );
                                        },
                                      ),
                                    ),
                                    20.ph,
                                    // Divider(),
                                    // 5.ph,
                                    // Padding(
                                    //   padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Text(
                                    //         "Shipping info".tr(context),
                                    //         style: TextStyle(
                                    //             fontSize: 16.sp,
                                    //             fontWeight: FontWeight.w400,
                                    //             color: AppColors.blackColor),
                                    //       ),
                                    //       Icon(Icons.arrow_forward_ios_outlined)
                                    //     ],
                                    //   ),
                                    // ),
                                    // 5.ph,
                                    // Divider(),
                                    // 5.ph,
                                    // Padding(
                                    //   padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Text(
                                    //         "Support".tr(context),
                                    //         style: TextStyle(
                                    //             fontSize: 16.sp,
                                    //             fontWeight: FontWeight.w400,
                                    //             color: AppColors.blackColor),
                                    //       ),
                                    //       Icon(Icons.arrow_forward_ios_outlined)
                                    //     ],
                                    //   ),
                                    // ),
                                    // 5.ph,
                                    Divider(),
                                    5.ph,
                                    state.productData!.relatedProducts == null
                                        ? SizedBox()
                                        : state.productData!.relatedProducts!
                                                .isEmpty
                                            ? SizedBox()
                                            : SimilarProducts(),
                                    20.ph,
                                  ],
                                ),
                              );
                            },
                          );
              },
            ),
    );
  }
}
