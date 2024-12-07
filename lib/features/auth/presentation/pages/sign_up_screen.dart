// import 'package:alkhatouna/core/utils/app_logger.dart';
// import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:alkhatouna/features/auth/presentation/pages/whatss_up_confirmation.dart';
// import 'package:alkhatouna/main_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/core/extensions/padding_extensions.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';
// import 'package:alkhatouna/core/utils/app_constant.dart';
// import 'package:alkhatouna/features/auth/presentation/pages/log_in_screen.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:alkhatouna/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   void deactivate() {
//     super.deactivate();
//     context.read<AuthCubit>().changeNameValue("");
//     context.read<AuthCubit>().changeEmailValue("");
//     context.read<AuthCubit>().changePasswordValue("");
//     context.read<AuthCubit>().changePhoneValue("");
//   }

//   Future signInWithGoogle() async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     // print(googleUser?.email);
//     // print("//////////////////////");
//     // print(googleUser?.displayName);
//     // print("//////////////////////");
//     // print(googleUser?.serverAuthCode);
//     // print("//////////////////////");
//     // print(googleUser?.id);
//     // print("//////////////////////");

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;

//     if (googleAuth?.accessToken != null) {
//       // Create a new credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       // Once signed in, return the UserCredential
//       FirebaseAuth.instance.signInWithCredential(credential);
//       context
//           .read<AuthCubit>()
//           .authUsingGoogle(context, googleUser!.displayName!, googleUser.email);
//       logger.i("Done");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       // appBar: AppConstant.customAppBar(context, "", false,
//       //     backgroundColor: Colors.transparent, IconColor: AppColors.blackColor),
//       body: SingleChildScrollView(
//         child: Container(
//           height: 1.sh,
//           width: 1.sw,
//           child: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.all(15.sp),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Sign Up".tr(context),
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 34.sp,
//                                 color: AppColors.blackColor),
//                           ),
//                         ],
//                       ),
//                       30.verticalSpace,
//                       CustomTextFormFieldWidget(
//                         hint: "Enter Your Name",
//                         onChange: (String value) {
//                           context.read<AuthCubit>().changeNameValue(value);
//                         },
//                       ),
//                       20.ph,
//                       CustomTextFormFieldWidget(
//                         hint: "Enter Your PhoneNumer",
//                         textInputType: TextInputType.number,
//                         onChange: (String value) {
//                           context.read<AuthCubit>().changePhoneValue(value);
//                         },
//                       ),
//                       20.ph,
//                       CustomTextFormFieldWidget(
//                         hint: "Enter Your Email (not necessary)",
//                         textInputType: TextInputType.emailAddress,
//                         onChange: (String value) {
//                           context.read<AuthCubit>().changeEmailValue(value);
//                         },
//                       ),
//                       20.ph,
//                       CustomTextFormFieldWidget(
//                         hint: "Enter Your Password",
//                         hideText: true,
//                         onChange: (String value) {
//                           context.read<AuthCubit>().changePasswordValue(value);
//                         },
//                       ),
//                       30.ph,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               AppConstant.customNavigation(
//                                   context, LogInScreen(), -1, 0);
//                             },
//                             child: Text(
//                               "Already have an account".tr(context),
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const Icon(
//                             Icons.arrow_forward_outlined,
//                             color: AppColors.primaryColor,
//                           )
//                         ],
//                       ),
//                       30.ph,
//                       BlocBuilder<AuthCubit, AuthState>(
//                         builder: (context, state) {
//                           return AppConstant.customElvatedButton(
//                               context, "Sign Up",
//                               loading: state.loading ? true : false, () {
//                             if (state.loading) {
//                             } else {
//                               if (state.name!.isEmpty) {
//                                 AppConstant.CustomAlert(
//                                     context, "Enter Your Name", true, true);
//                               } else if (state.phone!.isEmpty) {
//                                 AppConstant.CustomAlert(context,
//                                     "Enter Your PhoneNumer", true, true);
//                               } else if (state.phone!.length != 11) {
//                                 AppConstant.CustomAlert(
//                                     context,
//                                     "The phone number must be between 10 and 12 digits",
//                                     true,
//                                     true);
//                               } else if (state.phone!.startsWith("07") ==
//                                   false) {
//                                 AppConstant.CustomAlert(
//                                     context,
//                                     "The phone number must start with 07",
//                                     true,
//                                     true);
//                               } else if (state.email!.isNotEmpty &&
//                                   EmailValidator.validate(state.email!) ==
//                                       false) {
//                                 AppConstant.CustomAlert(context,
//                                     "Please enter a valid email", true, true);
//                               } else if (state.password!.isEmpty) {
//                                 AppConstant.CustomAlert(
//                                     context, "Enter Your Password", true, true);
//                               } else if (state.password!.length < 6) {
//                                 AppConstant.CustomAlert(
//                                     context,
//                                     "Enter more than five characters in the password",
//                                     true,
//                                     true);
//                               } else {
//                                 AppConstant.customNavigation(
//                                     context, WhatsappConfirmScreen(), -1, 0);
//                               }
//                             }
//                           },
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.bold));
//                         },
//                       ),
//                       10.ph,
//                       AppConstant.customElvatedButton(context, "Skip", () {
//                         AppConstant.customNavigation(
//                             context, mainScreen(), 0, -1);
//                       },
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           "Or sign up with social account".tr(context),
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         10.ph,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Image.asset("assets/images/Facebook.png"),
//                             InkWell(
//                                 onTap: () {
//                                   signInWithGoogle();
//                                 },
//                                 child: Image.asset("assets/images/Google.png")),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:alkhatouna/features/auth/presentation/pages/otp_confirmation.dart';
import 'package:alkhatouna/features/auth/presentation/widgets/sign_up_widgets/confirmation_type_bottom_sheet.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:alkhatouna/core/utils/app_logger.dart';
import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alkhatouna/features/auth/presentation/pages/whatss_up_confirmation.dart';
import 'package:alkhatouna/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/auth/presentation/pages/log_in_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:alkhatouna/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void deactivate() {
    super.deactivate();
    context.read<AuthCubit>().changeNameValue("");
    context.read<AuthCubit>().changeEmailValue("");
    context.read<AuthCubit>().changePasswordValue("");
    context.read<AuthCubit>().changePhoneValue("");
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // print(googleUser?.email);
    // print("//////////////////////");
    // print(googleUser?.displayName);
    // print("//////////////////////");
    // print(googleUser?.serverAuthCode);
    // print("//////////////////////");
    // print(googleUser?.id);
    // print("//////////////////////");

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth?.accessToken != null) {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      FirebaseAuth.instance.signInWithCredential(credential);
      context
          .read<AuthCubit>()
          .authUsingGoogle(googleUser!.displayName!, googleUser.email);
      logger.i("Done");
    }
  }

  final List<String> items = [
    'ar',
    'en',
  ];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // appBar: AppConstant.customAppBar(context, "", false,
      //     backgroundColor: Colors.transparent, IconColor: AppColors.blackColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign Up".tr(context),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34.sp,
                              color: AppColors.blackColor),
                        ),
                        // BlocBuilder<LocaleCubit, LocaleState>(
                        //   builder: (context, state) {
                        //     return DropdownButtonHideUnderline(
                        //       child: DropdownButton2<String>(
                        //         isExpanded: true,
                        //         hint: Text(state.locale.languageCode),
                        //         items: items
                        //             .map((String item) =>
                        //                 DropdownMenuItem<String>(
                        //                   value: item,
                        //                   child: Text(
                        //                     item,
                        //                     style: const TextStyle(
                        //                       fontSize: 14,
                        //                       fontWeight: FontWeight.bold,
                        //                       color: AppColors.blackColor,
                        //                     ),
                        //                     overflow: TextOverflow.ellipsis,
                        //                   ),
                        //                 ))
                        //             .toList(),
                        //         value: selectedValue,
                        //         onChanged: (value) {
                        //           setState(() {
                        //             selectedValue = value;
                        //             context
                        //                 .read<LocaleCubit>()
                        //                 .changeLanguage(value!);
                        //           });
                        //         },
                        //         buttonStyleData: ButtonStyleData(
                        //           height: 50.h,
                        //           width: 75.w,
                        //           padding: const EdgeInsets.only(
                        //               left: 14, right: 14),
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(14),
                        //             border: Border.all(
                        //               color: Colors.black26,
                        //             ),
                        //             color: Colors.white,
                        //           ),
                        //           elevation: 2,
                        //         ),
                        //         iconStyleData: const IconStyleData(
                        //           icon: Icon(
                        //             Icons.keyboard_arrow_down_rounded,
                        //             color: AppColors.blackColor,
                        //           ),
                        //           iconSize: 14,
                        //           iconEnabledColor: AppColors.primaryColor,
                        //           iconDisabledColor: Colors.grey,
                        //         ),
                        //         dropdownStyleData: DropdownStyleData(
                        //           maxHeight: 200,
                        //           width: 200,
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(14),
                        //             color: Colors.white,
                        //           ),
                        //           scrollbarTheme: ScrollbarThemeData(
                        //             radius: const Radius.circular(40),
                        //             thickness: WidgetStateProperty.all(6),
                        //             thumbVisibility:
                        //                 WidgetStateProperty.all(true),
                        //           ),
                        //         ),
                        //         menuItemStyleData: const MenuItemStyleData(
                        //           height: 40,
                        //           padding:
                        //               EdgeInsets.only(left: 14, right: 14),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                    30.verticalSpace,
                    CustomTextFormFieldWidget(
                      hint: "Enter Your Name",
                      onChange: (String value) {
                        context.read<AuthCubit>().changeNameValue(value);
                      },
                    ),
                    20.ph,
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: IntlPhoneField(
                        pickerDialogStyle:
                            PickerDialogStyle(backgroundColor: Colors.white),
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Enter Your PhoneNumer'.tr(context),
                          labelStyle: TextStyle(color: AppColors.greyColor),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'IQ',
                        onChanged: (phone) {
                          context.read<AuthCubit>().changePhoneValue("null");
                          try {
                            if (phone.isValidNumber()) {
                              context
                                  .read<AuthCubit>()
                                  .changePhoneValue(phone.completeNumber);
                              print("Yesss");
                            } else {
                              return;
                            }
                          } catch (e) {
                            print(e);
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
                    //   textInputType: TextInputType.number,
                    //   onChange: (String value) {},
                    // ),
                    20.ph,
                    CustomTextFormFieldWidget(
                      hint: "Enter Your Email (not necessary)",
                      textInputType: TextInputType.emailAddress,
                      onChange: (String value) {
                        context.read<AuthCubit>().changeEmailValue(value);
                      },
                    ),
                    20.ph,
                    CustomTextFormFieldWidget(
                      hint: "Enter Your Password",
                      hideText: true,
                      onChange: (String value) {
                        context.read<AuthCubit>().changePasswordValue(value);
                      },
                    ),
                    30.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            AppConstant.customNavigation(
                                context, LogInScreen(), -1, 0);
                          },
                          child: Text(
                            "Already have an account".tr(context),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_outlined,
                          color: AppColors.primaryColor,
                        )
                      ],
                    ),
                    30.ph,
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return AppConstant.customElvatedButton(
                            context, "Sign Up",
                            loading: state.loading ? true : false, () {
                          // print(state.phone);
                          if (state.loading) {
                          } else {
                            if (state.name!.isEmpty) {
                              AppConstant.CustomAlert(
                                  context, "Enter Your Name", true, true);
                            } else if (state.phone!.isEmpty) {
                              AppConstant.CustomAlert(
                                  context, "Enter Your PhoneNumer", true, true);
                            } else if (state.phone == "null") {
                              AppConstant.CustomAlert(
                                  context, "Enter Your PhoneNumer", true, true);
                            }
                            // else if (state.phone!.length != 10) {
                            //   AppConstant.CustomAlert(
                            //       context,
                            //       "The phone number must be between 10 and 12 digits",
                            //       true,
                            //       true);
                            // }
                            //  else if (state.phone!.startsWith("07") ==
                            //     false) {
                            //   AppConstant.CustomAlert(
                            //       context,
                            //       "The phone number must start with 07",
                            //       true,
                            //       true);
                            // }
                            else if (state.email!.isEmpty) {
                              AppConstant.CustomAlert(context,
                                  "Please enter your email", true, true);
                            } else if (state.email!.isNotEmpty &&
                                EmailValidator.validate(state.email!) ==
                                    false) {
                              AppConstant.CustomAlert(context,
                                  "Please enter a valid email", true, true);
                            } else if (state.password!.isEmpty) {
                              AppConstant.CustomAlert(
                                  context, "Enter Your Password", true, true);
                            } else if (state.password!.length < 6) {
                              AppConstant.CustomAlert(
                                  context,
                                  "Enter more than five characters in the password",
                                  true,
                                  true);
                            } else {
                              // AppConstant.customNavigation(
                              //     context, WhatsappConfirmScreen(), -1, 0);
                              // AppConstant.customNavigation(
                              //     context, OtpConfirmationScreen(), -1, 0);
                              showFlexibleBottomSheet(
                                bottomSheetColor: AppColors.whiteColor,
                                barrierColor: Color.fromARGB(94, 83, 83, 83),
                                bottomSheetBorderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40.sp),
                                    topRight: Radius.circular(40.sp)),
                                minHeight: 0,
                                initHeight: 0.5,
                                maxHeight: 0.5,
                                anchors: [0, 0.5],
                                isSafeArea: true,
                                context: context,
                                builder: ConfirmationTypeBottomSheet,
                              );
                            }
                          }
                        },
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold));
                      },
                    ),
                    10.ph,
                    AppConstant.customElvatedButton(context, "Skip", () {
                      AppConstant.customNavigation(
                          context, mainScreen(), 0, -1);
                    },
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                50.ph,
                // Container(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         "Or sign up with social account".tr(context),
                //         style: const TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //       10.ph,
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           // Image.asset("assets/images/Facebook.png"),
                //           InkWell(
                //               onTap: () {
                //                 signInWithGoogle();
                //               },
                //               child: Image.asset("assets/images/Google.png")),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
