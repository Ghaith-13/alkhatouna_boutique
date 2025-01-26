// import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:email_validator/email_validator.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/core/extensions/padding_extensions.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';
// import 'package:alkhatouna/core/utils/app_constant.dart';
// import 'package:alkhatouna/core/utils/app_logger.dart';
// import 'package:alkhatouna/features/auth/presentation/pages/forget_password_screen.dart';
// import 'package:alkhatouna/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';
// import 'package:alkhatouna/main_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LogInScreen extends StatefulWidget {
//   const LogInScreen({super.key});

//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends State<LogInScreen> {
//   @override
//   void deactivate() {
//     super.deactivate();
//     context.read<AuthCubit>().changeNameValue("");
//     context.read<AuthCubit>().changeEmailValue("");
//     context.read<AuthCubit>().changePasswordValue("");
//     context.read<AuthCubit>().changePhoneValue("");
//     context.read<AuthCubit>().changeLogInMethodValue("");
//   }

//   // @override
//   // void initState() {
//   //   super.initState();

//   //   // getFcmToken();
//   // }

//   // Future getFcmToken() async {
//   //   String? token = await FirebaseMessaging.instance.getToken();
//   //   // logger.i(token);
//   // }

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
//       appBar: AppConstant.customAppBar(context, "", true,
//           backgroundColor: Colors.white,
//           IconColor: AppColors.blackColor,
//           fromSignIn: true),
//       body: SingleChildScrollView(
//         child: Container(
//           height: 0.85.sh,
//           width: 1.sw,
//           child: Padding(
//             padding: EdgeInsets.all(15.sp),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "Login".tr(context),
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 34.sp,
//                           color: AppColors.blackColor),
//                     ),
//                   ],
//                 ),
//                 30.verticalSpace,
//                 CustomTextFormFieldWidget(
//                   hint: "Enter Your PhoneNumer Or Email",
//                   onChange: (String value) {
//                     context.read<AuthCubit>().changeLogInMethodValue(value);
//                   },
//                 ),
//                 20.ph,
//                 CustomTextFormFieldWidget(
//                   hideText: true,
//                   hint: "Enter Your Password",
//                   onChange: (String value) {
//                     context.read<AuthCubit>().changePasswordValue(value);
//                   },
//                 ),
//                 20.ph,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         AppConstant.customNavigation(
//                             context, ForgetPasswordScreen(), -1, 0);
//                       },
//                       child: Text(
//                         "Forgot your password".tr(context),
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     const Icon(
//                       Icons.arrow_forward_outlined,
//                       color: AppColors.primaryColor,
//                     )
//                   ],
//                 ),
//                 30.ph,
//                 BlocBuilder<AuthCubit, AuthState>(
//                   builder: (context, state) {
//                     return AppConstant.customElvatedButton(context, "Login",
//                         loading: state.loading ? true : false, () {
//                       if (state.loading) {
//                       } else {
//                         if (state.logInmethod!.isNotEmpty &&
//                                 EmailValidator.validate(state.logInmethod!) ==
//                                     true ||
//                             EmailValidator.validate(state.logInmethod!) ==
//                                     false &&
//                                 state.logInmethod!.isNotEmpty &&
//                                 state.logInmethod!.length >= 10 &&
//                                 state.logInmethod!.length <= 12) {
//                           if (state.password!.isEmpty) {
//                             AppConstant.CustomAlert(
//                                 context, "Enter Your Password", true, true);
//                           } else if (state.password!.length < 6) {
//                             AppConstant.CustomAlert(
//                                 context,
//                                 "Enter more than five characters in the password",
//                                 true,
//                                 true);
//                           } else {
//                             context.read<AuthCubit>().logIn(context);
//                           }
//                         } else {
//                           AppConstant.CustomAlert(
//                               context,
//                               "You must enter a phone number between 10 and 20 digits or a valid email address",
//                               true,
//                               true);
//                         }
//                       }
//                     },
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.bold));
//                   },
//                 ),
//                 10.ph,
//                 AppConstant.customElvatedButton(context, "Skip", () {
//                   AppConstant.customNavigation(context, mainScreen(), 0, -1);
//                 },
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.bold)),
//                 // const Expanded(child: SizedBox()),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Or log in with social account".tr(context),
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       10.ph,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // InkWell(
//                           //     onTap: () async {

//                           //       signInWithFaceBook();
//                           //       // await FirebaseAuth.instance.signOut();
//                           //     },
//                           //     child: Image.asset("assets/images/Facebook.png")),
//                           InkWell(
//                               onTap: () {
//                                 signInWithGoogle();
//                               },
//                               child: Image.asset("assets/images/Google.png")),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:email_validator/email_validator.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/core/utils/app_logger.dart';
import 'package:alkhatouna/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:alkhatouna/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';
import 'package:alkhatouna/main_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void deactivate() {
    super.deactivate();
    context.read<AuthCubit>().changeNameValue("");
    context.read<AuthCubit>().changeEmailValue("");
    context.read<AuthCubit>().changePasswordValue("");
    context.read<AuthCubit>().changePhoneValue("");
    context.read<AuthCubit>().changeLogInMethodValue("");
  }

  // @override
  // void initState() {
  //   super.initState();

  //   // getFcmToken();
  // }

  // Future getFcmToken() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   // logger.i(token);
  // }

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

  String loginmethod = "number";

  Future<void> openWhatsApp(String whatsappNumber) async {
    String url = Uri.encodeFull('https://wa.me/$whatsappNumber');
    // Check if WhatsApp is installed
    await canLaunch(url) ? launch(url) : print('WhatsApp not installed');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileCubit>().getSettings(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppConstant.customAppBar(context, "", true,
          backgroundColor: Colors.white,
          IconColor: AppColors.blackColor,
          fromSignIn: true),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Login".tr(context),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34.sp,
                          color: AppColors.blackColor),
                    ),
                  ],
                ),
                30.verticalSpace,
                Row(
                  children: [
                    Radio(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fillColor: WidgetStateProperty.resolveWith<Color>(
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
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fillColor: WidgetStateProperty.resolveWith<Color>(
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
                loginmethod == "email"
                    ? CustomTextFormFieldWidget(
                        hint: "Enter Your PhoneNumer Or Email",
                        onChange: (String value) {
                          context
                              .read<AuthCubit>()
                              .changeLogInMethodValue(value);
                        },
                      )
                    : Directionality(
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
                            context
                                .read<AuthCubit>()
                                .changeLogInMethodValue("null");
                            try {
                              if (phone.isValidNumber()) {
                                context
                                    .read<AuthCubit>()
                                    .changeLogInMethodValue(
                                        phone.completeNumber);

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
                20.ph,
                CustomTextFormFieldWidget(
                  hideText: true,
                  hint: "Enter Your Password",
                  onChange: (String value) {
                    context.read<AuthCubit>().changePasswordValue(value);
                  },
                ),
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        AppConstant.customNavigation(
                            context, ForgetPasswordScreen(), -1, 0);
                      },
                      child: Text(
                        "Forgot your password".tr(context),
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
                    return AppConstant.customElvatedButton(context, "Login",
                        loading: state.loading ? true : false, () {
                      if (state.loading) {
                        AppConstant.CustomAlert(
                            context,
                            "Enter more than five characters in the password",
                            true,
                            true);
                      } else {
                        if (state.logInmethod == "null") {
                          AppConstant.CustomAlert(
                              context, "Add correct phone number", true, true);
                        } else {
                          if (state.logInmethod!.isNotEmpty &&
                                  EmailValidator.validate(state.logInmethod!) ==
                                      true ||
                              EmailValidator.validate(state.logInmethod!) ==
                                      false &&
                                  state.logInmethod!.isNotEmpty) {
                            if (state.password!.isEmpty) {
                              AppConstant.CustomAlert(
                                  context, "Enter Your Password", true, true);
                            } else if (state.password!.length < 6) {
                              AppConstant.CustomAlert(
                                  context,
                                  "Enter more than five characters in the password",
                                  true,
                                  true);
                            } else {
                              context.read<AuthCubit>().logIn();
                            }
                          } else {
                            AppConstant.CustomAlert(
                                context,
                                "You must enter a phone number between 10 and 20 digits or a valid email address",
                                true,
                                true);
                          }
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
                      context,
                      mainScreen(
                        refresheveyThing: true,
                      ),
                      0,
                      -1);
                },
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold)),
                // const Expanded(child: SizedBox()),
                20.ph,
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return state.settings == null
                        ? SizedBox()
                        : state.settings!.settings == null
                            ? SizedBox()
                            : state.settings!.settings!.whatsappLink == null
                                ? SizedBox()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("If you want help".tr(context)),
                                      5.pw,
                                      InkWell(
                                        onTap: () async {
                                          await openWhatsApp(
                                              "${state.settings!.settings!.whatsappLink}");
                                        },
                                        child: Text(
                                          "Contact Us".tr(context),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  );
                  },
                ),
                50.ph,
                // Container(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         "Or log in with social account".tr(context),
                //         style: const TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //       10.ph,
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           // InkWell(
                //           //     onTap: () async {

                //           //       signInWithFaceBook();
                //           //       // await FirebaseAuth.instance.signOut();
                //           //     },
                //           //     child: Image.asset("assets/images/Facebook.png")),
                //           // InkWell(
                //           //     onTap: () {
                //           //       signInWithGoogle();
                //           //     },
                //           //     child: Image.asset("assets/images/Google.png")),
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
