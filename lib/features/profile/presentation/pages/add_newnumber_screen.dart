import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/cart/presentation/pages/verfication_phone_address.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AddNewnumberScreen extends StatefulWidget {
  final bool fromHomePage;
  const AddNewnumberScreen({super.key, this.fromHomePage = false});

  @override
  State<AddNewnumberScreen> createState() => _AddNewnumberScreenState();
}

class _AddNewnumberScreenState extends State<AddNewnumberScreen> {
  String phoneNumber = "";
  bool startWith07 = false;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(
          context, "", widget.fromHomePage ? false : true),
      body: Container(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.fromHomePage
                  ? FadeInRight(
                      child: Text(
                        "Your account does not have a mobile number. You must enter a number now."
                            .tr(context),
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                    )
                  : SizedBox(),
              widget.fromHomePage ? 20.ph : SizedBox(),
              FadeInRight(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: IntlPhoneField(
                    controller: _controller,
                    // initialValue: state.base_phone2 ?? "",
                    pickerDialogStyle:
                        PickerDialogStyle(backgroundColor: Colors.white),
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText:
                          "${'Enter the new mobile number here'.tr(context)}",
                      labelStyle: TextStyle(
                          color: AppColors.greyColor, fontSize: 10.sp),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IQ',
                    onCountryChanged: (value) {
                      _controller.clear();
                      setState(() {
                        phoneNumber = "";
                        startWith07 = false;
                      });
                    },
                    onChanged: (phone) {
                      // print(phone.countryCode);
                      if (phone.number.startsWith("0") &&
                          phone.countryCode == "+964") {
                        startWith07 = true;
                      } else {
                        startWith07 = false;
                      }
                      // print(_controller.text);
                      setState(() {
                        phoneNumber = "null";
                      });
                      try {
                        if (phone.isValidNumber()) {
                          setState(() {
                            phoneNumber = phone.completeNumber;
                          });
                        } else {
                          return;
                        }
                      } catch (e) {
                        // print(e);
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: AppConstant.customElvatedButton(context, "Update", () {
                  if (startWith07) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.only(
                            bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
                        content: Text(
                          "The number must not start with 0.".tr(context),
                          style: const TextStyle(color: Colors.white),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else if (phoneNumber.isEmpty || phoneNumber == "null") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.only(
                            bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
                        content: Text(
                          "The number must be entered correctly to complete the process."
                              .tr(context),
                          style: const TextStyle(color: Colors.white),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    AppConstant.customNavigation(
                        context,
                        VerficationPhoneAddress(
                            phoneNumber: phoneNumber,
                            lat: "lat",
                            log: "log",
                            fromUpdate: true,
                            fromHomePage: widget.fromHomePage),
                        -1,
                        0);
                  }
                }, style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
