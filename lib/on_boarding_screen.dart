// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:alkhatouna/core/utils/app_constant.dart';
// import 'package:alkhatouna/features/auth/presentation/pages/sign_up_screen.dart';

// class OnBoarding extends StatefulWidget {
//   const OnBoarding({super.key});

//   @override
//   State<OnBoarding> createState() => _OnBoardingState();
// }

// class _OnBoardingState extends State<OnBoarding> {
  // final List<String> items = [
  //   'ar',
  //   'en',
  // ];
  // String? selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: OnBoardingSlider(
//         headerBackgroundColor: AppColors.primaryColor,
//         pageBackgroundColor: AppColors.primaryColor,
//         trailing: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 color: AppColors.primaryColor,
//                 child: const Text(""),
//               ),
//             ),
//           ],
//         ),
//         onFinish: () {
//           AppConstant.customNavigation(context, const SignUpScreen(), -1, 0);
//         },
//         finishButtonText: 'Sign Up'.tr(context),
//         finishButtonStyle: const FinishButtonStyle(
//           backgroundColor: AppColors.primaryColor,
//         ),

//         skipTextButton: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
            // DropdownButtonHideUnderline(
            //   child: DropdownButton2<String>(
            //     isExpanded: true,
            //     hint: Row(
            //       children: [
            //         const Icon(
            //           Icons.list,
            //           size: 16,
            //           color: AppColors.primaryColor,
            //         ),
            //         const SizedBox(
            //           width: 4,
            //         ),
            //         Expanded(
            //           child: Text(
            //             'Langauges'.tr(context),
            //             style: const TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.bold,
            //               color: AppColors.primaryColor,
            //             ),
            //             overflow: TextOverflow.ellipsis,
            //           ),
            //         ),
            //       ],
            //     ),
            //     items: items
            //         .map((String item) => DropdownMenuItem<String>(
            //               value: item,
            //               child: Text(
            //                 item,
            //                 style: const TextStyle(
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold,
            //                   color: AppColors.primaryColor,
            //                 ),
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ))
            //         .toList(),
            //     value: selectedValue,
            //     onChanged: (value) {
            //       setState(() {
            //         selectedValue = value;
            //         context.read<LocaleCubit>().changeLanguage(value!);
            //       });
            //     },
            //     buttonStyleData: ButtonStyleData(
            //       height: 50,
            //       width: 160,
            //       padding: const EdgeInsets.only(left: 14, right: 14),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(14),
            //         border: Border.all(
            //           color: Colors.black26,
            //         ),
            //         color: Colors.white,
            //       ),
            //       elevation: 2,
            //     ),
            //     iconStyleData: const IconStyleData(
            //       icon: Icon(
            //         Icons.arrow_forward_ios_outlined,
            //       ),
            //       iconSize: 14,
            //       iconEnabledColor: AppColors.primaryColor,
            //       iconDisabledColor: Colors.grey,
            //     ),
            //     dropdownStyleData: DropdownStyleData(
            //       maxHeight: 200,
            //       width: 200,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(14),
            //         color: Colors.white,
            //       ),
            //       offset: const Offset(-20, 0),
            //       scrollbarTheme: ScrollbarThemeData(
            //         radius: const Radius.circular(40),
            //         thickness: WidgetStateProperty.all(6),
            //         thumbVisibility: WidgetStateProperty.all(true),
            //       ),
            //     ),
            //     menuItemStyleData: const MenuItemStyleData(
            //       height: 40,
            //       padding: EdgeInsets.only(left: 14, right: 14),
            //     ),
            //   ),
            // ),
//             InkWell(
//               onTap: () {
//                 AppConstant.customNavigation(
//                     context, const SignUpScreen(), -1, 0);
//               },
//               child: Text(
//                 "Skip".tr(context),
//                 style: TextStyle(
//                     color: AppColors.whiteColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 50.sp),
//               ),
//             ),
//           ],
//         ),
//         centerBackground: false,
//         controllerColor: AppColors.primaryColor,
//         // hasFloatingButton: true,
//         indicatorAbove: true,
//         addController: true,
//         skipFunctionOverride: () {},
//         background: [
//           Image.asset(
//             'assets/images/on_boarding2.jpg',
//             fit: BoxFit.cover,
//             height: 1.sh,
//             width: 1.8.sw,
//           ),
//           Image.asset(
//             'assets/images/on_boarding1.jpg',
//             fit: BoxFit.cover,
//             height: 1.sh,
//             width: 2.sw,
//           ),
//         ],
//         totalPage: 2,
//         speed: 1.8,
//         hasSkip: true,
//         pageBodies: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 "Best Products Ever".tr(context),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: AppColors.secondryColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 75.sp),
//               ),
//               Text(
//                 "Here you can Buy best thing you want".tr(context),
//                 textAlign: TextAlign.center,
//                 style:
//                     TextStyle(color: AppColors.secondryColor, fontSize: 50.sp),
//               ),
//               SizedBox(
//                 height: 0.05.sh,
//               )
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 "Get Ready".tr(context),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: AppColors.secondryColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 75.sp),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 50.w),
//                 child: Text(
//                   "Get ready for a journey in our world called beauty"
//                       .tr(context),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: AppColors.secondryColor, fontSize: 50.sp),
//                 ),
//               ),
//               SizedBox(
//                 height: 0.05.sh,
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
