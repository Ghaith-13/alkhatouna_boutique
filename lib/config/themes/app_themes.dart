import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme(String languageCode) {
  return ThemeData(
    splashColor: Colors.transparent,

    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'El Messiri',
    //  languageCode == "en" ? 'Source Sans 3' : 'Cairo',
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryColor,
        selectionHandleColor: AppColors.primaryColor,
        selectionColor: AppColors.primaryColor),
    appBarTheme: AppBarTheme(
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.secondryColor),
      titleTextStyle: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp),
      color: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor))),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      hintStyle: const TextStyle(color: AppColors.strokColor),
      fillColor: AppColors.whiteColor,
      filled: true,
      isDense: true,
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(4)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(4)),
    ),
  );
}
