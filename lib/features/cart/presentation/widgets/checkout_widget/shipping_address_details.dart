import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/cart/data/models/check_out_model.dart';
import 'package:alkhatouna/features/cart/data/models/get_address_model.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ShippingAddressDetails extends StatefulWidget {
  const ShippingAddressDetails({super.key});

  @override
  State<ShippingAddressDetails> createState() => _ResevationButtonState();
}

class _ResevationButtonState extends State<ShippingAddressDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping address details'.tr(context),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
              30.ph,
              FadeInRight(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: IntlPhoneField(
                    initialValue: state.employeerPhoneNumber,
                    pickerDialogStyle: PickerDialogStyle(
                      backgroundColor:
                          Colors.white, // Color of the country code picker
                      countryCodeStyle: const TextStyle(
                        color: Colors.black, // Color of the country code text
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black, // Text color inside the phone field
                    ),
                    decoration: InputDecoration(
                      labelText: "${'Enter Your PhoneNumer'.tr(context)} ",
                      labelStyle: TextStyle(
                          color: AppColors.greyColor, fontSize: 10.sp),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove default border
                        borderRadius:
                            BorderRadius.circular(3.0), // Rounded corners
                      ),
                      filled: true, // Enable filling the background
                      fillColor:
                          Colors.white, // Background color of the phone field
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 12.0), // Adjust padding as needed
                    ),
                    initialCountryCode: 'IQ',
                    onChanged: (phone) {
                      context
                          .read<CartCubit>()
                          .changeemployeerPhoneNumber("null");
                      try {
                        if (phone.isValidNumber()) {
                          context
                              .read<CartCubit>()
                              .changeemployeerPhoneNumber(phone.completeNumber);
                        } else {
                          return;
                        }
                      } catch (e) {
                        // Handle error
                      }
                    },
                  ),
                ),
              ),
              20.ph,
              FadeInRight(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: IntlPhoneField(
                    initialValue: state.employeerPhoneNumber2 == "null"
                        ? ""
                        : state.employeerPhoneNumber2,
                    pickerDialogStyle: PickerDialogStyle(
                      backgroundColor:
                          Colors.white, // Color of the country code picker
                      countryCodeStyle: const TextStyle(
                        color: Colors.black, // Color of the country code text
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black, // Text color inside the phone field
                    ),
                    decoration: InputDecoration(
                      labelText:
                          "${'Enter Another PhoneNumer'.tr(context)} (${"not necessary".tr(context)})",
                      labelStyle: TextStyle(
                          color: AppColors.greyColor, fontSize: 10.sp),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove default border
                        borderRadius:
                            BorderRadius.circular(3.0), // Rounded corners
                      ),
                      filled: true, // Enable filling the background
                      fillColor:
                          Colors.white, // Background color of the phone field
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 12.0), // Adjust padding as needed
                    ),
                    initialCountryCode: 'IQ',
                    onChanged: (phone) {
                      if (phone.number == "") {
                        context
                            .read<CartCubit>()
                            .changeemployeerPhoneNumber2("");
                      } else {
                        context
                            .read<CartCubit>()
                            .changeemployeerPhoneNumber2("null");
                      }

                      try {
                        if (phone.isValidNumber()) {
                          context.read<CartCubit>().changeemployeerPhoneNumber2(
                              phone.completeNumber);
                        } else {
                          return;
                        }
                      } catch (e) {
                        // Handle error
                      }
                    },
                  ),
                ),
              ),
              20.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50.h,
                    child: BlocBuilder<LocaleCubit, LocaleState>(
                      builder: (context, locale) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.employeerAddressText!.isEmpty
                                        ? 'Provinces'.tr(context)
                                        : state.employeerAddressText!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: state.checkData?.provinces
                                ?.map((Provinces item) =>
                                    DropdownMenuItem<String>(
                                      value: item.id.toString(),
                                      child:
                                          BlocBuilder<LocaleCubit, LocaleState>(
                                        builder: (context, locale) {
                                          return Text(
                                            "${locale.locale.languageCode == "en" ? item.nameEn ?? "" : locale.locale.languageCode == "ar" ? item.nameAr ?? "" : item.nameKu ?? ""}",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primaryColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          );
                                        },
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              print(value);
                              context
                                  .read<CartCubit>()
                                  .changeemployeerAddress(value);
                              context.read<CartCubit>().getCheckOut(context,
                                  fromEmployeeAddress: true);
                              context
                                  .read<CartCubit>()
                                  .changeemployeerAddressText(
                                    locale.locale.languageCode == "en"
                                        ? state.checkData?.provinces!
                                                .firstWhere((item) =>
                                                    item.id.toString() == value)
                                                .nameEn ??
                                            ''
                                        : locale.locale.languageCode == "ar"
                                            ? state.checkData?.provinces!
                                                    .firstWhere((item) =>
                                                        item.id.toString() ==
                                                        value)
                                                    .nameAr ??
                                                ''
                                            : state.checkData?.provinces!
                                                    .firstWhere((item) =>
                                                        item.id.toString() ==
                                                        value)
                                                    .nameKu ??
                                                '',
                                  );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.primaryColor,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "Selected Successfully".tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 40.h,
                              width: 0.84.sw,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 16.sp,
                              ),
                              iconSize: 14,
                              iconEnabledColor: AppColors.primaryColor,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 0.85.sw,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.white,
                              ),
                              offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: WidgetStateProperty.all(6),
                                thumbVisibility: WidgetStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              20.ph,
              FadeInLeft(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      // Add border here
                      color: const Color.fromARGB(111, 0, 0, 0), // Border color
                      width: 0.5, // Border width
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    initialValue: state.addressTitle,
                    onChanged: (String value) {
                      context
                          .read<CartCubit>()
                          .changeemployeerEnterTitle(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Address Details".tr(context),
                      hintStyle: TextStyle(color: AppColors.greyColor),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
