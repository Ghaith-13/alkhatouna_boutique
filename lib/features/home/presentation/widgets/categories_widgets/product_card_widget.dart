// // ignore_for_file: must_be_immutable

// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
// import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:alkhatouna/core/extensions/padding_extensions.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';
// import 'package:alkhatouna/core/utils/app_constant.dart';
// import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
// import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_image_widget.dart';
// import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_price_widget.dart';
// import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/stars_widget.dart';

// class ProductCardWidget extends StatefulWidget {
//   bool fromSimilarProduct;
//   bool fromHome;
//   Products productDetails;

//   ProductCardWidget(
//       {super.key,
//       required this.productDetails,
//       this.fromSimilarProduct = false,
//       this.fromHome = false});

//   @override
//   State<ProductCardWidget> createState() => _ProductCardWidgetState();
// }

// class _ProductCardWidgetState extends State<ProductCardWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(alignment: Alignment.topCenter, children: [
//       InkWell(onTap: () {
//         AppConstant.customNavigation(
//             context,
//             ProductDetailsScreen(
//               productId: widget.productDetails.id.toString(),
//             ),
//             -1,
//             0);
//       }, child: BlocBuilder<LocaleCubit, LocaleState>(
//         builder: (context, locale) {
//           return SizedBox(
//             // height: 260.h,
//             width: 150.w,
//             child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(8.sp)),
//               child: Container(
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   color: AppColors.whiteColor,
//                   borderRadius: BorderRadius.circular(8.0.sp),
//                 ),
//                 child: Column(
//                   children: [
//                     ClipRRect(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(8.sp),
//                         ),
//                         child: ProductImageWidget(
//                           fromHome: widget.fromHome,
//                           fromSimilarProduct: widget.fromSimilarProduct,
//                           productDetails: widget.productDetails,
//                           haveOffer: widget.productDetails.isDiscount!,
//                         )),
//                     Expanded(
//                         child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             10.ph,
//                             StarsWidget(
//                               reviewAvg: widget.productDetails.reviewAvg,
//                               reviewCount: widget.productDetails.reviewCount,
//                             ),
//                             5.ph,
//                             // Text(
//                             //   "Mango",
//                             //   style: TextStyle(
//                             //       fontSize: 11.sp,
//                             //       color: AppColors.greyColor,
//                             //       fontWeight: FontWeight.w400),
//                             // ),
//                             // 5.ph,
//                             Text(
//                               locale.locale.languageCode == "en"
//                                   ? widget.productDetails.nameEn ?? ""
//                                   : locale.locale.languageCode == "ar"
//                                       ? widget.productDetails.nameAr ?? ""
//                                       : widget.productDetails.nameKu ?? "",
//                               style: TextStyle(
//                                   fontSize: 10.sp,
//                                   color: AppColors.blackColor,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             5.ph,
//                             ProductPriceWidget(
//                               productDetails: widget.productDetails,
//                               haveOffer: widget.productDetails.isDiscount!,
//                             )
//                           ],
//                         ),
//                       ),
//                     ))
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       )),
//       widget.productDetails.displayProduct == false
//           ? ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(8.sp)),
//               child: Container(
//                 margin: EdgeInsets.only(bottom: 20.h),
//                 width: 1.sw,
//                 color: const Color.fromARGB(185, 255, 255, 255),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: 1.sw,
//                       color: Colors.white,
//                       child: Text(
//                         "Sorry, this item is currently sold out".tr(context),
//                         style: TextStyle(
//                             fontSize: 11.sp,
//                             color: AppColors.blackColor,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           : SizedBox(),
//     ]);
//   }
// }

// ignore_for_file: must_be_immutable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_image_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_price_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/stars_widget.dart';

class ProductCardWidget extends StatefulWidget {
  bool fromSimilarProduct;
  bool fromHome;
  Products productDetails;

  ProductCardWidget({
    super.key,
    required this.productDetails,
    this.fromSimilarProduct = false,
    this.fromHome = false,
  });

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
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
    return Stack(alignment: Alignment.topCenter, children: [
      InkWell(onTap: () {
        AppConstant.customNavigation(
            context,
            ProductDetailsScreen(
              productId: widget.productDetails.id.toString(),
            ),
            -1,
            0);
      }, child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, locale) {
          return SizedBox(
            // height: 260.h,
            width: 150.w,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.0.sp),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.sp),
                        ),
                        child: ProductImageWidget(
                          fromHome: widget.fromHome,
                          fromSimilarProduct: widget.fromSimilarProduct,
                          productDetails: widget.productDetails,
                          haveOffer: widget.productDetails.isDiscount!,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          10.ph,
                          StarsWidget(
                            reviewAvg: widget.productDetails.reviewAvg,
                            reviewCount: widget.productDetails.reviewCount,
                          ),
                          5.ph,
                          // Text(
                          //   "Mango",
                          //   style: TextStyle(
                          //       fontSize: 11.sp,
                          //       color: AppColors.greyColor,
                          //       fontWeight: FontWeight.w400),
                          // ),
                          // 5.ph,
                          Text(
                            locale.locale.languageCode == "en"
                                ? widget.productDetails.nameEn ?? ""
                                : locale.locale.languageCode == "ar"
                                    ? widget.productDetails.nameAr ?? ""
                                    : widget.productDetails.nameKu ?? "",
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600),
                          ),
                          5.ph,
                          // Spacer(),
                          ProductPriceWidget(
                            productDetails: widget.productDetails,
                            haveOffer: widget.productDetails.isDiscount!,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )),
      widget.productDetails.displayProduct == false
          ? ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
              child: Container(
                margin: EdgeInsets.only(bottom: 20.h),
                width: 1.sw,
                color: const Color.fromARGB(185, 255, 255, 255),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      SizedBox(
                        height: 210.h,
                      ),
                      SizedBox(
                        height: 184.h,
                        width: 1.sw,
                      ),
                      PositionedDirectional(
                          bottom: 2,
                          end: 7,
                          child: InkWell(
                            onTap: () {
                              if (token == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                if (widget.fromHome == false) {
                                  setState(() {
                                    if (widget.productDetails.isFavorite ??
                                        false) {
                                      widget.productDetails.isFavorite = false;
                                    } else {
                                      widget.productDetails.isFavorite = true;
                                    }
                                    // widget.productDetails.isFavorite =
                                    //     !widget.productDetails.isFavorite!;
                                  });
                                }

                                context.read<HomeCubit>().toggleFavorite(
                                    context,
                                    widget.productDetails.id.toString(),
                                    fromHome: widget.fromHome,
                                    fromSimilarProduct:
                                        widget.fromSimilarProduct);
                              }
                              // showFlexibleBottomSheet(
                              //   bottomSheetColor: AppColors.whiteColor,
                              //   barrierColor: Color.fromARGB(94, 83, 83, 83),
                              //   bottomSheetBorderRadius: BorderRadius.only(
                              //       topLeft: Radius.circular(40.sp),
                              //       topRight: Radius.circular(40.sp)),
                              //   minHeight: 0,
                              //   initHeight: 0.5,
                              //   maxHeight: 0.5,
                              //   anchors: [0, 0.5],
                              //   isSafeArea: true,
                              //   context: context,
                              //   builder: favoriteBottomSheet,
                              // );
                            },
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
                                child: widget.productDetails.isFavorite ?? false
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 18.sp,
                                      )
                                    : SvgPicture.asset(
                                        "assets/icons/favorite.svg",
                                        width: 24.sp,
                                        height: 24.sp,
                                      )),
                          ))
                    ]),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 1.sw,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              "Sorry, this item is currently sold out"
                                  .tr(context),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: 1.sw,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .zero, // Set borderRadius to zero
                                        ),
                                      ),
                                      onPressed: () async {
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
                                              duration:
                                                  const Duration(seconds: 2),
                                            ),
                                          );
                                        } else {
                                          if (state.notifyProduct) {
                                          } else {
                                            String? userID =
                                                await CacheHelper.getData(
                                              key: "USER_ID",
                                            );

                                            FirebaseMessaging messaging =
                                                FirebaseMessaging.instance;

                                            String? fcmtoken =
                                                await messaging.getToken();
                                            context
                                                .read<HomeCubit>()
                                                .notifyProduct(
                                                    context,
                                                    userID.toString(),
                                                    fcmtoken.toString(),
                                                    widget.productDetails.id
                                                        .toString());
                                          }
                                        }
                                      },
                                      child: state.notifyProduct
                                          ? SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              "Notify me when it is available"
                                                  .tr(context),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : SizedBox(),
    ]);
  }
}
