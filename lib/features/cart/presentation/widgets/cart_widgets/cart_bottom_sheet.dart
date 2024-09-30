// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/core/extensions/padding_extensions.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';

// Widget cartBottomSheet(
//   BuildContext context,
//   ScrollController scrollController,
//   double bottomSheetOffset,
// ) {
//   return Container(
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: ListView(
//         controller: scrollController,
//         children: [
//           10.ph,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 50.0,
//                 height: 5.0,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 ),
//               )
//             ],
//           ),
//           20.ph,
//           Stack(
//             children: [
//               Container(
//                 height: 50.h,
//               ),
//               Container(
//                 padding: EdgeInsetsDirectional.only(end: 10.w),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     hintText: 'Enter your promo code'.tr(context),
//                     hintStyle: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               ),
//               PositionedDirectional(
//                 end: 0,
//                 child: CircleAvatar(
//                   radius: 25.sp,
//                   backgroundColor: AppColors.blackColor,
//                   child: Icon(
//                     Icons.arrow_forward_outlined,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           20.ph,
//           Text(
//             "Your Promo Codes".tr(context),
//             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
//           ),
//           20.ph,
//           Container(
//               width: 1.sw,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8.sp),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Stack(
//                     children: [
//                       Image.asset(
//                         "assets/images/promo_code.png",
//                         fit: BoxFit.fill,
//                         height: 80.sp,
//                         width: 80.sp,
//                       ),
//                       Positioned(
//                           top: 20.sp,
//                           left: 20.sp,
//                           child: Text(
//                             "10 %",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 24.sp),
//                           ))
//                     ],
//                   ),
//                   10.pw,
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Personal offer",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500, fontSize: 14.sp),
//                         ),
//                         10.ph,
//                         Text(
//                           "Personal offer",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400, fontSize: 11.sp),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "6 days remaining",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 11.sp,
//                             color: AppColors.greyColor),
//                       ),
//                       10.ph,
//                       ElevatedButton(
//                           onPressed: () {},
//                           child: Text(
//                             "Apply",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 14.sp,
//                                 color: Colors.white),
//                           ))
//                     ],
//                   ),
//                   10.pw,
//                 ],
//               ))
//         ],
//       ),
//     ),
//   );
// }
