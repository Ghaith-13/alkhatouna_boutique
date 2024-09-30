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
          .authUsingGoogle(context, googleUser!.displayName!, googleUser.email);
      logger.i("Done");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // appBar: AppConstant.customAppBar(context, "", false,
      //     backgroundColor: Colors.transparent, IconColor: AppColors.blackColor),
      body: SingleChildScrollView(
        child: Container(
          height: 1.sh,
          width: 1.sw,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Sign Up".tr(context),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 34.sp,
                                color: AppColors.blackColor),
                          ),
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
                      CustomTextFormFieldWidget(
                        hint: "Enter Your PhoneNumer",
                        textInputType: TextInputType.number,
                        onChange: (String value) {
                          context.read<AuthCubit>().changePhoneValue(value);
                        },
                      ),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                            if (state.loading) {
                            } else {
                              if (state.name!.isEmpty) {
                                AppConstant.CustomAlert(
                                    context, "Enter Your Name", true, true);
                              } else if (state.phone!.isEmpty) {
                                AppConstant.CustomAlert(context,
                                    "Enter Your PhoneNumer", true, true);
                              } else if (state.phone!.length != 11) {
                                AppConstant.CustomAlert(
                                    context,
                                    "The phone number must be between 10 and 12 digits",
                                    true,
                                    true);
                              } else if (state.phone!.startsWith("07") ==
                                  false) {
                                AppConstant.CustomAlert(
                                    context,
                                    "The phone number must start with 07",
                                    true,
                                    true);
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
                                AppConstant.customNavigation(
                                    context, WhatsappConfirmScreen(), -1, 0);
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Or sign up with social account".tr(context),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        10.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset("assets/images/Facebook.png"),
                            InkWell(
                                onTap: () {
                                  signInWithGoogle();
                                },
                                child: Image.asset("assets/images/Google.png")),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
