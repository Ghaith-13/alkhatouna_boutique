import 'dart:math';

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shimmer/shimmer.dart';

class OtpConfirmationScreen extends StatefulWidget {
  const OtpConfirmationScreen({super.key});

  @override
  State<OtpConfirmationScreen> createState() => _OtpConfirmationScreenState();
}

class _OtpConfirmationScreenState extends State<OtpConfirmationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().sendOtp();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    context.read<AuthCubit>().changeOtpCode("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(
        context,
        "",
        true,
        backgroundColor: Colors.white,
        IconColor: AppColors.blackColor,
      ),
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return state.loadingOtp
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
                          20.ph,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Send confirmation code via Email".tr(context),
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            10.verticalSpace,
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: PinCodeTextField(
                                keyboardType: TextInputType.number,
                                appContext: context,
                                length: 4,
                                onChanged: (value) {},
                                onCompleted: (value) {
                                  if (value == state.otpCode) {
                                    Navigator.pop(context);
                                    context.read<AuthCubit>().SignUp();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.redColor,
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
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
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
                                    selectedColor:
                                        const Color.fromARGB(153, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(8.sp)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
