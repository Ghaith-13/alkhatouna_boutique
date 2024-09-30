import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

Widget passwordDropDown(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  return BlocBuilder<ProfileCubit, ProfileState>(
    builder: (context, state) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            controller: scrollController,
            children: [
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  )
                ],
              ),
              15.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Password Change".tr(context),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColors.blackColor),
                  )
                ],
              ),
              40.ph,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    context.read<ProfileCubit>().changeNewPassword(value);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "New Password".tr(context),
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

              40.ph,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    context
                        .read<ProfileCubit>()
                        .changerepeateNewPassword(value);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Rewrite new password".tr(context),
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
              // 10.ph,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     InkWell(
              //       onTap: (){
              //         AppConstant.customNavigation(context, ForgetPasswordScreen(), x, y)
              //       },
              //       child: Text(
              //         "${"Forget Password".tr(context)} ?",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 14.sp,
              //             color: AppColors.greyColor),
              //       ),
              //     )
              //   ],
              // ),

              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white, // Background color of the container
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.2),
              //         spreadRadius: 2,
              //         blurRadius: 5,
              //         offset: Offset(0, 3),
              //       ),
              //     ],
              //   ),
              //   child: TextField(
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       hintText: "Repeat New Password".tr(context),
              //       hintStyle: TextStyle(color: AppColors.greyColor),
              //       contentPadding:
              //           EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.transparent),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.transparent),
              //       ),
              //     ),
              //   ),
              // ),
              40.ph,
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, value) {
                  return value.loading
                      ? SizedBox()
                      : ElevatedButton(
                          onPressed: () {
                            if (state.repeateNewPassword!.length == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.redColor,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "Please fill fields".tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else if (state.repeateNewPassword!.length < 8) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "The password field must be at least 8 characters."
                                        .tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else if (state.repeateNewPassword !=
                                state.newPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.redColor,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "The inputs does not match".tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else {
                              context.read<AuthCubit>().resetPassword(
                                  state.userInfo!.phone,
                                  state.newPassword!,
                                  context,
                                  fromProfile: true);
                            }
                          },
                          child: Text(
                            "SAVE PASSWORD".tr(context),
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ));
                },
              )
            ],
          ),
        ),
      );
    },
  );
}
