// import 'package:alkhatouna/features/profile/presentation/widgets/order_details_widgets/feedback_bottom_sheet.dart';
// import 'package:bottom_sheet/bottom_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';

// class OrderDetailsButtons extends StatefulWidget {
//   const OrderDetailsButtons({super.key});

//   @override
//   State<OrderDetailsButtons> createState() => _OrderDetailsButtonsState();
// }

// class _OrderDetailsButtonsState extends State<OrderDetailsButtons> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Container(
//         //   height: 36.h,
//         //   width: 160.w,
//         //   decoration: BoxDecoration(
//         //     border: Border.all(
//         //       color: Colors.black,
//         //       width: 1,
//         //     ),
//         //     color: Colors.transparent,
//         //     borderRadius: BorderRadius.circular(25.sp),
//         //     // boxShadow: [
//         //     //   BoxShadow(
//         //     //     color: Colors.grey.withOpacity(0.2),
//         //     //     spreadRadius: 2,
//         //     //     blurRadius: 5,
//         //     //     offset: const Offset(0, 3),
//         //     //   ),
//         //     // ],
//         //   ),
//         //   child: Center(
//         //     child: Text(
//         //       "Reorder".tr(context),
//         //       style: TextStyle(
//         //           fontSize: 14.sp,
//         //           fontWeight: FontWeight.w500,
//         //           color: Colors.black),
//         //     ),
//         //   ),
//         // ),
//         InkWell(
//           onTap: () {
//             showFlexibleBottomSheet(
//               bottomSheetColor: AppColors.whiteColor,
//               barrierColor: Color.fromARGB(94, 83, 83, 83),
//               bottomSheetBorderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.sp),
//                   topRight: Radius.circular(40.sp)),
//               minHeight: 0,
//               initHeight: 0.7,
//               maxHeight: 0.7,
//               anchors: [0, 0.7],
//               isSafeArea: true,
//               context: context,
//               builder: feedBackBottomSheet,
//             );
//           },
//           child: Container(
//             height: 36.h,
//             width: 0.9.sw,
//             decoration: BoxDecoration(
//               color: AppColors.primaryColor,
//               borderRadius: BorderRadius.circular(25.sp),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Center(
//               child: Text(
//                 "Leave feedback".tr(context),
//                 style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
