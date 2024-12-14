import 'dart:math';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/main.dart';
import 'package:http/http.dart' as http;

import 'package:alkhatouna/features/auth/presentation/pages/reset_password.dart';
import 'package:alkhatouna/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shimmer/shimmer.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String number = "";
  String loginmethod = "number";
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    context.read<AuthCubit>().changeEmailValue("");
    context.read<AuthCubit>().changeOtpCode("");
  }

  int? numberForWhats;
  void generateRandomNumber() async {
    final random = Random();
    setState(() {
      numberForWhats = 1000 + random.nextInt(9000);
    });
  }

  bool sendToWhatsApp = false;
  bool ShowPinCode = false;
  bool showLoader = false;
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getWhatssappSettings();
  }

  bool showNote = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppConstant.customAppBar(context, "", true,
          backgroundColor: Colors.transparent, IconColor: AppColors.blackColor),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Forget Password".tr(context),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34.sp,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  50.verticalSpace,
                  state.loadingWhatsAppSettings
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      color: Colors.black,
                                      width: 0.8.sw,
                                      height: 25,
                                    )),
                                50.ph,
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      color: Colors.black,
                                      width: 0.8.sw,
                                      height: 25,
                                    )),
                                20.ph,
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      color: Colors.black,
                                      width: 0.8.sw,
                                      height: 75,
                                    )),
                                40.ph,
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      color: Colors.black,
                                      width: 0.8.sw,
                                      height: 75,
                                    )),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Text(
                              "Please, enter your email address. You will receive a link to create a new password via email."
                                  .tr(context),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            30.verticalSpace,
                            Row(
                              children: [
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  fillColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                          (Set<WidgetState> states) {
                                    return AppColors.primaryColor;
                                  }),
                                  value: "email",
                                  groupValue: loginmethod,
                                  onChanged: (value) {
                                    setState(() {
                                      loginmethod = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "By Email".tr(context),
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                20.horizontalSpace,
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  fillColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                          (Set<WidgetState> states) {
                                    return AppColors.primaryColor;
                                  }),
                                  value: "number",
                                  groupValue: loginmethod,
                                  onChanged: (value) {
                                    setState(() {
                                      loginmethod = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "phone number".tr(context),
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              ],
                            ),
                            10.verticalSpace,
                            ShowPinCode || state.otpCode != ""
                                ? Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: PinCodeTextField(
                                      keyboardType: TextInputType.number,
                                      appContext: context,
                                      length: 4,
                                      onChanged: (value) {},
                                      onCompleted: (value) {
                                        if (loginmethod == "email") {
                                          if (value == state.otpCode) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        ResetPassword(
                                                            phoeNumber:
                                                                state.email!),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor:
                                                    AppColors.redColor,
                                                padding: EdgeInsets.only(
                                                    bottom: 20.h,
                                                    top: 20.h,
                                                    left: 20.w,
                                                    right: 20.w),
                                                content: Text(
                                                  'The PIN code does not match the code sent.'
                                                      .tr(context),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                duration:
                                                    const Duration(seconds: 2),
                                              ),
                                            );
                                          }
                                        } else {
                                          if (value.toString() ==
                                              numberForWhats.toString()) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        ResetPassword(
                                                            phoeNumber: number),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor:
                                                    AppColors.redColor,
                                                padding: EdgeInsets.only(
                                                    bottom: 20.h,
                                                    top: 20.h,
                                                    left: 20.w,
                                                    right: 20.w),
                                                content: Text(
                                                  'The PIN code does not match the code sent.'
                                                      .tr(context),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                duration:
                                                    const Duration(seconds: 2),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      textStyle: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 75.sp,
                                          fontWeight: FontWeight.bold),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      enableActiveFill: true,
                                      pinTheme: PinTheme(
                                          disabledColor: Colors.white,
                                          selectedFillColor: Colors.white,
                                          activeFillColor: Colors.white,
                                          inactiveFillColor: Colors.white,
                                          fieldHeight: 100.h,
                                          fieldWidth: 75.w,
                                          shape: PinCodeFieldShape.box,
                                          activeColor: AppColors.primaryColor,
                                          inactiveColor: AppColors.primaryColor,
                                          selectedColor: const Color.fromARGB(
                                              153, 0, 0, 0),
                                          borderRadius:
                                              BorderRadius.circular(8.sp)),
                                    ),
                                  )
                                : loginmethod == "email"
                                    ? CustomTextFormFieldWidget(
                                        hint: "Enter Your PhoneNumer Or Email",
                                        onChange: (String value) {
                                          context
                                              .read<AuthCubit>()
                                              .changeEmailValue(value);
                                        },
                                      )
                                    : Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: IntlPhoneField(
                                          pickerDialogStyle: PickerDialogStyle(
                                              backgroundColor: Colors.white),
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            labelText: 'Enter Your PhoneNumer'
                                                .tr(context),
                                            labelStyle: TextStyle(
                                                color: AppColors.greyColor),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                            ),
                                          ),
                                          initialCountryCode: 'IQ',
                                          onChanged: (phone) {
                                            setState(() {
                                              number = "null";
                                            });
                                            try {
                                              if (phone.isValidNumber()) {
                                                setState(() {
                                                  number = phone.completeNumber;
                                                });
                                                // context
                                                //     .read<AuthCubit>()
                                                //     .changePhoneValue(phone.completeNumber);
                                                // print("Yesss");
                                              } else {
                                                return;
                                              }
                                            } catch (e) {
                                              // print(e);
                                            }
                                            // Additional validation for specific use cases (optional)
                                            // For example, advanced server-side validation

                                            // Use the complete phone number for further actions

                                            // context
                                            //     .read<AuthCubit>()
                                            //     .changePhoneValue(phone.completeNumber);
                                          },
                                        ),
                                      ),
                            // CustomTextFormFieldWidget(
                            //   hint: "Enter Your PhoneNumer",
                            //   // textInputType: TextInputType.number,
                            //   onChange: (value) {
                            //     setState(() {
                            //       number = value;
                            //     });
                            //   },
                            // ),
                            5.ph,
                            showNote && loginmethod == "email"
                                ? Text(
                                    "If you do not find the email in your inbox, check your junk mail."
                                        .tr(context),
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                : SizedBox(),
                            50.verticalSpace,
                            state.loadingOtp
                                ? CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  )
                                : BlocBuilder<AuthCubit, AuthState>(
                                    builder: (context, state) {
                                      return state.loadingOtp
                                          ? CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            )
                                          : AppConstant.customElvatedButton(
                                              context, "Send", () async {
                                              if (loginmethod == "email") {
                                                context
                                                    .read<AuthCubit>()
                                                    .sendOtp();
                                                showNote = true;
                                              } else {
                                                if (number == "null") {
                                                  AppConstant.CustomAlert(
                                                      context,
                                                      "Add correct phone number",
                                                      true,
                                                      true);
                                                } else {
                                                  if (await navigatorKey
                                                      .currentContext!
                                                      .read<AuthCubit>()
                                                      .checkNumber(
                                                        number,
                                                      )) {
                                                    if (sendToWhatsApp) {
                                                    } else {
                                                      setState(() {
                                                        sendToWhatsApp = true;
                                                      });
                                                      generateRandomNumber();
                                                      String phoneNumber =
                                                          number;
                                                      // print(phoneNumber);
                                                      if (phoneNumber
                                                          .startsWith("07")) {
                                                        phoneNumber =
                                                            phoneNumber
                                                                .replaceFirst(
                                                                    "0",
                                                                    "+964");
                                                      }
                                                      var headers = {
                                                        'Content-Type':
                                                            'application/x-www-form-urlencoded'
                                                      };
                                                      // print(phoneNumber);
                                                      var request = http.Request(
                                                          'POST',
                                                          Uri.parse(
                                                              'https://api.ultramsg.com/${state.whatsappData?.instanceId}/messages/chat'));
                                                      request.bodyFields = {
                                                        'token':
                                                            '${state.whatsappData?.token}',
                                                        'to': '$phoneNumber',
                                                        'body':
                                                            'Your code to activate account in ALKHATOUNA BOUTIQUE is  $numberForWhats'
                                                      };
                                                      request.headers
                                                          .addAll(headers);

                                                      http.StreamedResponse
                                                          response =
                                                          await request.send();

                                                      if (response.statusCode ==
                                                          200) {
                                                        // print(await response.stream
                                                        //     .bytesToString());
                                                        setState(() {
                                                          ShowPinCode = true;
                                                        });
                                                        // context.read<AuthCubit>().SignUp(context);
                                                      } else {
                                                        if (response
                                                                .reasonPhrase ==
                                                            "Not Found") {
                                                          ScaffoldMessenger.of(
                                                                  navigatorKey
                                                                      .currentContext!)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              backgroundColor:
                                                                  Colors.red,
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          30.h,
                                                                      top: 30.h,
                                                                      left:
                                                                          50.w,
                                                                      right:
                                                                          50.w),
                                                              content: Text(
                                                                response
                                                                    .reasonPhrase!,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                            ),
                                                          );
                                                        }
                                                      }

                                                      setState(() {
                                                        sendToWhatsApp = false;
                                                      });
                                                    }
                                                  } else {}
                                                }
                                              }
                                            },
                                              loading: state.loadingOtp,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold));
                                    },
                                  ),
                          ],
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
