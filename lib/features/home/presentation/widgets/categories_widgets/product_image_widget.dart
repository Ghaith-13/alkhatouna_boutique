// // ignore_for_file: must_be_immutable

// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/core/utils/cache_helper.dart';
// import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
// import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';

// class ProductImageWidget extends StatefulWidget {
//   Products productDetails;
//   bool fromSimilarProduct;
//   bool haveOffer, fromHome;
//   ProductImageWidget(
//       {super.key,
//       this.haveOffer = false,
//       this.fromHome = false,
//       required this.productDetails,
//       this.fromSimilarProduct = false});

//   @override
//   State<ProductImageWidget> createState() => _ProductImageWidgetState();
// }

// class _ProductImageWidgetState extends State<ProductImageWidget> {
//   @override
//   void initState() {
//     super.initState();
//     checkIfGuest();
//   }

//   String? token;
//   bool loadingToken = false;
//   Future checkIfGuest() async {
//     setState(() {
//       loadingToken = true;
//     });
//     token = await CacheHelper.getData(key: "USER_TOKEN");
//     setState(() {
//       loadingToken = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return loadingToken
//         ? SizedBox()
//         : Stack(children: [
//             SizedBox(
//               height: 210.h,
//             ),
//             ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(8.sp)),
//                 child: CachedNetworkImage(
//                   width: 1.sw,
//                   height: 184.h,
//                   fit: BoxFit.fill,
//                   imageUrl: widget.productDetails.imageUrl ?? '',
//                   errorWidget: (context, url, error) => Image.asset(
//                     "assets/images/logo.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                   imageBuilder: (context, imageProvider) => Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15.r),
//                       image: DecorationImage(
//                         image: imageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 )),
//             widget.haveOffer
//                 ? PositionedDirectional(
//                     top: 5.sp,
//                     start: 5.sp,
//                     child: Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//                         decoration: BoxDecoration(
//                           color: AppColors.redColor,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Text(
//                           // ${(double.parse(widget.productDetails.discount) / double.parse(widget.productDetails.price) * 100).toStringAsFixed(2)}
//                           "- ${widget.productDetails.discount} %",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 11.sp,
//                               color: Colors.white),
//                         )),
//                   )
//                 : SizedBox(),
//             widget.productDetails.isFeatured == "1"
//                 ? PositionedDirectional(
//                     top: 5.sp,
//                     end: 5.sp,
//                     child: Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Text(
//                           // ${(double.parse(widget.productDetails.discount) / double.parse(widget.productDetails.price) * 100).toStringAsFixed(2)}
//                           "New",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 11.sp,
//                               color: Colors.white),
//                         )),
//                   )
//                 : SizedBox(),
//             PositionedDirectional(
//                 bottom: 5,
//                 end: 0,
//                 child: InkWell(
//                   onTap: () {
//                     // showFlexibleBottomSheet(
//                     //   bottomSheetColor: AppColors.whiteColor,
//                     //   barrierColor: Color.fromARGB(94, 83, 83, 83),
//                     //   bottomSheetBorderRadius: BorderRadius.only(
//                     //       topLeft: Radius.circular(40.sp),
//                     //       topRight: Radius.circular(40.sp)),
//                     //   minHeight: 0,
//                     //   initHeight: 0.5,
//                     //   maxHeight: 0.5,
//                     //   anchors: [0, 0.5],
//                     //   isSafeArea: true,
//                     //   context: context,
//                     //   builder: favoriteBottomSheet,
//                     // );
//                   },
//                   child: Container(
//                       padding: EdgeInsets.all(10),
//                       width: 36.0.sp,
//                       height: 36.0.sp,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             blurRadius: 5.0,
//                             spreadRadius: 1.0,
//                           ),
//                         ],
//                       ),
//                       child: InkWell(
//                         onTap: () {
//                           if (token == null) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 backgroundColor: Colors.red,
//                                 padding: EdgeInsets.only(
//                                     bottom: 30.h,
//                                     top: 30.h,
//                                     left: 50.w,
//                                     right: 50.w),
//                                 content: Text(
//                                   "Log in to enjoy these features.".tr(context),
//                                   style: const TextStyle(color: Colors.white),
//                                 ),
//                                 duration: const Duration(seconds: 2),
//                               ),
//                             );
//                           } else {
//                             setState(() {
//                               if (widget.productDetails.isFavorite!) {
//                                 widget.productDetails.isFavorite = false;
//                               } else {
//                                 widget.productDetails.isFavorite = true;
//                               }
//                               // widget.productDetails.isFavorite =
//                               //     !widget.productDetails.isFavorite!;
//                             });
//                             context.read<HomeCubit>().toggleFavorite(
//                                 context, widget.productDetails.id.toString(),
//                                 fromSimilarProduct: widget.fromSimilarProduct,
//                                 fromHome: widget.fromHome);
//                           }
//                         },
//                         child: widget.productDetails.isFavorite!
//                             ? Icon(
//                                 Icons.favorite,
//                                 color: Colors.red,
//                                 size: 18.sp,
//                               )
//                             : SvgPicture.asset(
//                                 "assets/icons/favorite.svg",
//                                 width: 24.sp,
//                                 height: 24.sp,
//                               ),
//                       )),
//                 ))
//           ]);
//   }
// }
// ignore_for_file: must_be_immutable

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class ProductImageWidget extends StatefulWidget {
  Products productDetails;
  bool fromSimilarProduct;
  bool fromHome;
  bool haveOffer;
  ProductImageWidget(
      {super.key,
      this.haveOffer = false,
      this.fromHome = false,
      required this.productDetails,
      this.fromSimilarProduct = false});

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
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
        : Stack(children: [
            SizedBox(
              height: 210.h,
            ),
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                child: CachedNetworkImage(
                  width: 1.sw,
                  height: 184.h,
                  fit: BoxFit.fill,
                  imageUrl: widget.productDetails.imageUrl ?? '',
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/logo.jpg",
                    fit: BoxFit.cover,
                  ),
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
            widget.haveOffer
                ? PositionedDirectional(
                    top: 5.sp,
                    start: 5.sp,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          // ${(double.parse(widget.productDetails.discount) / double.parse(widget.productDetails.price) * 100).toStringAsFixed(2)}
                          "- ${widget.productDetails.discount} %",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                              color: Colors.white),
                        )),
                  )
                : SizedBox(),
            widget.productDetails.isFeatured == "1"
                ? PositionedDirectional(
                    top: 5.sp,
                    end: 5.sp,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          // ${(double.parse(widget.productDetails.discount) / double.parse(widget.productDetails.price) * 100).toStringAsFixed(2)}
                          "New".tr(context),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                              color: Colors.white),
                        )),
                  )
                : SizedBox(),
            PositionedDirectional(
                bottom: 5,
                end: 0,
                child: InkWell(
                  onTap: () {
                    if (token == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.only(
                              bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
                          content: Text(
                            "Log in to enjoy these features.".tr(context),
                            style: const TextStyle(color: Colors.white),
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    } else {
                      if (widget.fromHome == false) {
                        setState(() {
                          if (widget.productDetails.isFavorite ?? false) {
                            widget.productDetails.isFavorite = false;
                          } else {
                            widget.productDetails.isFavorite = true;
                          }
                          // widget.productDetails.isFavorite =
                          //     !widget.productDetails.isFavorite!;
                        });
                      }

                      context.read<HomeCubit>().toggleFavorite(
                          context, widget.productDetails.id.toString(),
                          fromHome: widget.fromHome,
                          fromSimilarProduct: widget.fromSimilarProduct);
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
          ]);
  }
}
