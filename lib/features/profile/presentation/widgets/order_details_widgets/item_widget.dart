// import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
// import 'package:alkhatouna/core/extensions/colors_extensions.dart';
// import 'package:alkhatouna/features/profile/data/models/orders_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/core/extensions/padding_extensions.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';
// import 'package:intl/intl.dart';

// class ItemWidget extends StatefulWidget {
//   final Items oneItem;
//   const ItemWidget({super.key, required this.oneItem});

//   @override
//   State<ItemWidget> createState() => _ItemWidgetState();
// }

// class _ItemWidgetState extends State<ItemWidget> {
//   final formatCurrency = new NumberFormat.simpleCurrency(
//     decimalDigits: 0,
//     name: "",
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.sp),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey
//                 .withOpacity(0.2), // Adjust opacity for shadow intensity
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3), // Adjust offset for shadow position
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(8.sp),
//                   bottomLeft: Radius.circular(8.sp)),
//               child: CachedNetworkImage(
//                 width: 104.sp,
//                 height: 104.sp,
//                 fit: BoxFit.fill,
//                 imageUrl: widget.oneItem.imageUrl ?? '',
//                 imageBuilder: (context, imageProvider) => Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.r),
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               )),
//           Expanded(
//             child: Padding(
//               padding:
//                   EdgeInsets.symmetric(vertical: 8.0.sp, horizontal: 15.sp),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   BlocBuilder<LocaleCubit, LocaleState>(
//                     builder: (context, locale) {
//                       return Text(
//                         locale.locale.languageCode == "en"
//                             ? widget.oneItem.product!.nameEn ?? ""
//                             : locale.locale.languageCode == "ar"
//                                 ? widget.oneItem.product!.nameAr ?? ""
//                                 : widget.oneItem.product!.nameKu ?? "",
//                         style: TextStyle(
//                             color: AppColors.blackColor,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600),
//                       );
//                     },
//                   ),
//                   // 5.ph,
//                   // Text(
//                   //   "Mango",
//                   //   style: TextStyle(
//                   //       color: AppColors.greyColor,
//                   //       fontSize: 11.sp,
//                   //       fontWeight: FontWeight.w400),
//                   // ),
//                   5.ph,
//                   Row(
//                     children: [
//                       Text(
//                         "${"Color".tr(context)} :",
//                         style: TextStyle(
//                             fontSize: 11.sp,
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.greyColor),
//                       ),
//                       5.pw,
//                       widget.oneItem.productColor == "Other"
//                           ? Text(
//                               "Other".tr(context),
//                               style: TextStyle(
//                                   fontSize: 11.sp,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.blackColor),
//                             )
//                           : Container(
//                               width: 20.sp,
//                               height: 20.sp,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: HexColor.fromHex(
//                                     widget.oneItem.productColor ?? ""),
//                                 border: Border.all(
//                                   color: AppColors.primaryColor,
//                                   width: 1,
//                                 ),
//                               ),
//                             ),
//                       30.pw,
//                       Text(
//                         "${"Size".tr(context)} :",
//                         style: TextStyle(
//                             fontSize: 11.sp,
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.greyColor),
//                       ),
//                       5.pw,
//                       widget.oneItem.productSize == "Other"
//                           ? Text(
//                               "Other".tr(context),
//                               style: TextStyle(
//                                   fontSize: 11.sp,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.blackColor),
//                             )
//                           : Text(
//                               "${widget.oneItem.productSize}",
//                               style: TextStyle(
//                                   fontSize: 11.sp,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.blackColor),
//                             ),
//                     ],
//                   ),
//                   5.ph,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "${"Units".tr(context)} :",
//                             style: TextStyle(
//                                 fontSize: 11.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.greyColor),
//                           ),
//                           5.pw,
//                           Text(
//                             "${widget.oneItem.productQuantity}",
//                             style: TextStyle(
//                                 fontSize: 11.sp,
//                                 color: AppColors.blackColor,
//                                 fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                       Text(
//                         "${formatCurrency.format(double.parse(widget.oneItem.productTotalAmountAfterDiscount ?? ""))} د.ع",
//                         style: TextStyle(
//                             fontSize: 14.sp,
//                             color: AppColors.blackColor,
//                             fontWeight: FontWeight.w500),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/extensions/colors_extensions.dart';
import 'package:alkhatouna/features/profile/data/models/orders_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:intl/intl.dart';

class ItemWidget extends StatefulWidget {
  final Items oneItem;

  const ItemWidget({super.key, required this.oneItem});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 2,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(0.2), // Adjust opacity for shadow intensity
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Adjust offset for shadow position
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
                imageUrl: widget.oneItem.imageUrl ?? '',
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
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 8.0.sp, horizontal: 15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<LocaleCubit, LocaleState>(
                    builder: (context, locale) {
                      return Text(
                        locale.locale.languageCode == "en"
                            ? widget.oneItem.product!.nameEn ?? ""
                            : locale.locale.languageCode == "ar"
                                ? widget.oneItem.product!.nameAr ?? ""
                                : widget.oneItem.product!.nameKu ?? "",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      );
                    },
                  ),
                  // 5.ph,
                  // Text(
                  //   "Mango",
                  //   style: TextStyle(
                  //       color: AppColors.greyColor,
                  //       fontSize: 11.sp,
                  //       fontWeight: FontWeight.w400),
                  // ),
                  5.ph,
                  Row(
                    children: [
                      Text(
                        "${"Color".tr(context)} :",
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor),
                      ),
                      5.pw,
                      widget.oneItem.productColor == "Other"
                          ? Text(
                              "Other".tr(context),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackColor),
                            )
                          : Container(
                              width: 20.sp,
                              height: 20.sp,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: HexColor.fromHex(
                                    widget.oneItem.productColor ?? ""),
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1,
                                ),
                              ),
                            ),
                      30.pw,
                      Text(
                        "${"Size".tr(context)} :",
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor),
                      ),
                      5.pw,
                      widget.oneItem.productSize == "Other"
                          ? Text(
                              "Other".tr(context),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackColor),
                            )
                          : Text(
                              "${widget.oneItem.productSize}",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackColor),
                            ),
                    ],
                  ),
                  5.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${"Units".tr(context)} :",
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyColor),
                          ),
                          5.pw,
                          Text(
                            "${widget.oneItem.productQuantity}",
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      BlocBuilder<LocaleCubit, LocaleState>(
                        builder: (context, state) {
                          return Text(
                            "${formatCurrency.format(double.parse(widget.oneItem.productTotalAmountAfterDiscount.toString()))} د.ع",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
