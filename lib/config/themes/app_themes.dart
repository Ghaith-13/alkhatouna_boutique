import 'package:alkhatouna/core/utils/app_constant.dart';
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
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor:
          AppColors.primaryColor, // Example: Light red for header
      backgroundColor: Colors.white,
      // Other customizations for DatePicker
      dayStyle: TextStyle(color: Colors.black),
      weekdayStyle: TextStyle(color: Colors.black),
      yearStyle: TextStyle(color: Colors.black),
      headerForegroundColor: Colors.white,
      rangePickerBackgroundColor: Colors.red[50],
      surfaceTintColor: AppColors.primaryColor,
      todayForegroundColor: WidgetStatePropertyAll(Colors.white),
      dayOverlayColor: WidgetStatePropertyAll(AppColors.primaryColor),
      locale: languageCode == "en" ? Locale("en") : Locale("ar"),

      // todayBorder: Border.all(color: Colors.red),
      todayBackgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
      dayBackgroundColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors
              .primaryColor; // Background color for entire page on selection
        }
        return Colors.transparent; // Default background color
      }),
      dayForegroundColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      cancelButtonStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.primaryColor)),
      confirmButtonStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.primaryColor)),
      rangeSelectionBackgroundColor: AppColors.primaryColor,
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.primaryColor),
          helperStyle: TextStyle(color: AppColors.primaryColor)),

      // rangeSelectionOverlayColor: Colors.red.withOpacity(0.3),
    ),
    timePickerTheme: TimePickerThemeData(
        cancelButtonStyle: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(AppColors.primaryColor)),
        confirmButtonStyle: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(AppColors.primaryColor)),
        dialHandColor: Colors.white,
        backgroundColor: Colors.white,
        hourMinuteTextColor: Colors.white,
        dialTextColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primaryColor;
          }
          return Colors.white;
        }),
        dialBackgroundColor: AppColors.primaryColor,
        entryModeIconColor: AppColors.primaryColor,
        hourMinuteColor: AppColors.primaryColor,
        dayPeriodTextColor: Colors.black,
        dayPeriodColor: Color.fromARGB(255, 97, 176, 180),
        dayPeriodBorderSide: BorderSide(color: AppColors.primaryColor),
        helpTextStyle: TextStyle(color: Colors.black),
        inputDecorationTheme: InputDecorationTheme(
          // floatingLabelStyle: TextStyle(color: Colors.amber),
          // suffixStyle: TextStyle(color: Colors.red),
          hintStyle: TextStyle(color: AppColors.primaryColor),
          labelStyle: TextStyle(color: AppColors.primaryColor),
          helperStyle: TextStyle(color: AppColors.primaryColor),
          fillColor: AppColors.primaryColor,
          filled: true,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          activeIndicatorBorder: BorderSide(color: Colors.white),
        )),
    /////////////////////////////////////////////////////////////////////////////////////////////////////////

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
