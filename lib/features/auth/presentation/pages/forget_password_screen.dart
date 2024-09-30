import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String number = "";
  bool sendRequest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppConstant.customAppBar(context, "", true,
          backgroundColor: Colors.transparent, IconColor: AppColors.blackColor),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
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
            Text(
              "Please, enter your email address. You will receive a link to create a new password via email."
                  .tr(context),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            30.verticalSpace,
            CustomTextFormFieldWidget(
              hint: "Enter Your PhoneNumer",
              textInputType: TextInputType.number,
              onChange: (value) {
                setState(() {
                  number = value;
                });
              },
            ),
            50.verticalSpace,
            sendRequest
                ? CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                : BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return state.loading
                          ? CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )
                          : AppConstant.customElvatedButton(context, "Send",
                              () {
                              if (sendRequest) {
                              } else {
                                setState(() {
                                  sendRequest = true;
                                });
                                context
                                    .read<AuthCubit>()
                                    .checkNumber(number, context);
                                setState(() {
                                  sendRequest = false;
                                });
                              }
                            },
                              loading: sendRequest,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold));
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
