// import 'package:alkhatouna/features/profile/data/models/orders_model.dart';
// import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
// import 'package:alkhatouna/features/profile/presentation/widgets/order_details_widgets/feedback_bottom_sheet.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:bottom_sheet/bottom_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/core/extensions/padding_extensions.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';
// import 'package:alkhatouna/core/utils/app_constant.dart';
// import 'package:alkhatouna/features/profile/presentation/widgets/order_details_widgets/item_widget.dart';
// import 'package:alkhatouna/features/profile/presentation/widgets/order_details_widgets/order_info_widget.dart';
// import 'package:intl/intl.dart';

// class OrderDetailsScreen extends StatefulWidget {
//   final Pending orderDetails;
//   final String status;
//   final Color color;

//   const OrderDetailsScreen(
//       {super.key,
//       required this.orderDetails,
//       required this.color,
//       required this.status});

//   @override
//   State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
// }

// class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context
//         .read<ProfileCubit>()
//         .changeorderId(widget.orderDetails.id.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppConstant.customAppBar(
//         context,
//         "Order Details",
//         true,
//         withTranslate: true,
//         IconColor: AppColors.blackColor,
//         backgroundColor: Colors.white,
//         elvation: 0,
//         // actions: [
//         //   Padding(
//         //     padding: EdgeInsetsDirectional.only(end: 15.w),
//         //     child: Icon(
//         //       Icons.search,
//         //       size: 24.sp,
//         //       color: AppColors.blackColor,
//         //     ),
//         //   ),
//         // ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(12.0.sp),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               FadeInLeft(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "${"Order".tr(context)} ${widget.orderDetails.number}",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16.sp,
//                           color: AppColors.blackColor),
//                     ),
//                     Text(
//                       "${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(widget.orderDetails.createdAt!))}",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14.sp,
//                           color: AppColors.greyColor),
//                     )
//                   ],
//                 ),
//               ),
//               20.ph,
//               FadeInRight(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Row(
//                     //   children: [
//                     //     Text(
//                     //       "${"Tracking number".tr(context)} :",
//                     //       style: TextStyle(
//                     //           fontWeight: FontWeight.w400,
//                     //           fontSize: 14.sp,
//                     //           color: AppColors.greyColor),
//                     //     ),
//                     //     5.pw,
//                     //     Text(
//                     //       "IW3475453455",
//                     //       style: TextStyle(
//                     //           fontWeight: FontWeight.w500,
//                     //           fontSize: 14.sp,
//                     //           color: AppColors.blackColor),
//                     //     )
//                     //   ],
//                     // ),
//                     Text(
//                       "${widget.orderDetails.items!.length} ${"items".tr(context)}",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                           color: AppColors.blackColor),
//                     ),
//                     Text(
//                       "${widget.status}",
//                       style: TextStyle(
//                           color: widget.color,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp),
//                     )
//                   ],
//                 ),
//               ),
//               // 20.ph,
//               // FadeInLeft(
//               //   child:
//               // Text(
//               //     "3 ${"items".tr(context)}",
//               //     style: TextStyle(
//               //         fontWeight: FontWeight.w500,
//               //         fontSize: 14.sp,
//               //         color: AppColors.blackColor),
//               //   ),
//               // ),
//               20.ph,
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: widget.orderDetails.items!.length,
//                 itemBuilder: (context, index) {
//                   return index % 2 == 0
//                       ? FadeInLeft(
//                           child: ItemWidget(
//                           oneItem: widget.orderDetails.items![index],
//                         ))
//                       : FadeInRight(
//                           child: ItemWidget(
//                               oneItem: widget.orderDetails.items![index]));
//                 },
//               ),
//               30.ph,
//               FadeInLeft(
//                   child: OrderInfoWidget(
//                 orderDetails: widget.orderDetails,
//               )),
//               30.ph,
//               FadeInRight(
//                   child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Container(
//                   //   height: 36.h,
//                   //   width: 160.w,
//                   //   decoration: BoxDecoration(
//                   //     border: Border.all(
//                   //       color: Colors.black,
//                   //       width: 1,
//                   //     ),
//                   //     color: Colors.transparent,
//                   //     borderRadius: BorderRadius.circular(25.sp),
//                   //     // boxShadow: [
//                   //     //   BoxShadow(
//                   //     //     color: Colors.grey.withOpacity(0.2),
//                   //     //     spreadRadius: 2,
//                   //     //     blurRadius: 5,
//                   //     //     offset: const Offset(0, 3),
//                   //     //   ),
//                   //     // ],
//                   //   ),
//                   //   child: Center(
//                   //     child: Text(
//                   //       "Reorder".tr(context),
//                   //       style: TextStyle(
//                   //           fontSize: 14.sp,
//                   //           fontWeight: FontWeight.w500,
//                   //           color: Colors.black),
//                   //     ),
//                   //   ),
//                   // ),
//                   InkWell(
//                     onTap: () {
//                       showFlexibleBottomSheet(
//                         bottomSheetColor: AppColors.whiteColor,
//                         barrierColor: Color.fromARGB(94, 83, 83, 83),
//                         bottomSheetBorderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(40.sp),
//                             topRight: Radius.circular(40.sp)),
//                         minHeight: 0,
//                         initHeight: 0.7,
//                         maxHeight: 0.7,
//                         anchors: [0, 0.7],
//                         isSafeArea: true,
//                         context: context,
//                         builder: feedBackBottomSheet,
//                       );
//                     },
//                     child: Container(
//                       height: 36.h,
//                       width: 0.9.sw,
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryColor,
//                         borderRadius: BorderRadius.circular(25.sp),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Leave feedback".tr(context),
//                           style: TextStyle(
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:alkhatouna/features/profile/data/models/orders_model.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/features/profile/presentation/widgets/order_details_widgets/feedback_bottom_sheet.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/widgets/order_details_widgets/item_widget.dart';
import 'package:alkhatouna/features/profile/presentation/widgets/order_details_widgets/order_info_widget.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Pending orderDetails;
  final String status;
  final Color color;

  const OrderDetailsScreen(
      {super.key,
      required this.orderDetails,
      required this.color,
      required this.status});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProfileCubit>()
        .changeorderId(widget.orderDetails.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppConstant.customAppBar(
        context,
        "Order Details",
        true,
        withTranslate: true,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
        // actions: [
        //   Padding(
        //     padding: EdgeInsetsDirectional.only(end: 15.w),
        //     child: Icon(
        //       Icons.search,
        //       size: 24.sp,
        //       color: AppColors.blackColor,
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInLeft(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.orderDetails.type == "order" ? "Order".tr(context) : "reservation".tr(context)} ${widget.orderDetails.number}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColors.blackColor),
                    ),
                    Text(
                      "${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(widget.orderDetails.createdAt!))}",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColors.greyColor),
                    )
                  ],
                ),
              ),
              20.ph,
              FadeInRight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Row(
                    //   children: [
                    //     Text(
                    //       "${"Tracking number".tr(context)} :",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: 14.sp,
                    //           color: AppColors.greyColor),
                    //     ),
                    //     5.pw,
                    //     Text(
                    //       "IW3475453455",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 14.sp,
                    //           color: AppColors.blackColor),
                    //     )
                    //   ],
                    // ),
                    Text(
                      "${widget.orderDetails.items!.length} ${"items".tr(context)}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.blackColor),
                    ),
                    Text(
                      "${widget.status.tr(context)}",
                      style: TextStyle(
                          color: widget.color,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    )
                  ],
                ),
              ),
              // 20.ph,
              // FadeInLeft(
              //   child:
              // Text(
              //     "3 ${"items".tr(context)}",
              //     style: TextStyle(
              //         fontWeight: FontWeight.w500,
              //         fontSize: 14.sp,
              //         color: AppColors.blackColor),
              //   ),
              // ),
              20.ph,
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.orderDetails.items!.length,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? FadeInLeft(
                          child: ItemWidget(
                          // currency: widget.orderDetails.currency!,
                          oneItem: widget.orderDetails.items![index],
                        ))
                      : FadeInRight(
                          child: ItemWidget(
                              // currency: widget.orderDetails.currency!,
                              oneItem: widget.orderDetails.items![index]));
                },
              ),
              30.ph,
              FadeInLeft(
                  child: OrderInfoWidget(
                orderDetails: widget.orderDetails,
              )),
              30.ph,
              FadeInRight(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   height: 36.h,
                  //   width: 160.w,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.black,
                  //       width: 1,
                  //     ),
                  //     color: Colors.transparent,
                  //     borderRadius: BorderRadius.circular(25.sp),
                  //     // boxShadow: [
                  //     //   BoxShadow(
                  //     //     color: Colors.grey.withOpacity(0.2),
                  //     //     spreadRadius: 2,
                  //     //     blurRadius: 5,
                  //     //     offset: const Offset(0, 3),
                  //     //   ),
                  //     // ],
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "Reorder".tr(context),
                  //       style: TextStyle(
                  //           fontSize: 14.sp,
                  //           fontWeight: FontWeight.w500,
                  //           color: Colors.black),
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      showFlexibleBottomSheet(
                        bottomSheetColor: AppColors.whiteColor,
                        barrierColor: Color.fromARGB(94, 83, 83, 83),
                        bottomSheetBorderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.sp),
                            topRight: Radius.circular(40.sp)),
                        minHeight: 0,
                        initHeight: 0.7,
                        maxHeight: 0.7,
                        anchors: [0, 0.7],
                        isSafeArea: true,
                        context: context,
                        builder: feedBackBottomSheet,
                      );
                    },
                    child: Container(
                      height: 36.h,
                      width: 0.9.sw,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(25.sp),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Leave feedback".tr(context),
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
