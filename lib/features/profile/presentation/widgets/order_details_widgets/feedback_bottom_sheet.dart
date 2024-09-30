import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

Widget feedBackBottomSheet(BuildContext context,
    ScrollController scrollController, double bottomSheetOffset,
    {int? ordeId}) {
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
          30.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Write your feedback here".tr(context),
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          30.ph,
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.sp),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: TextFormField(
              onChanged: (String value) {
                context.read<ProfileCubit>().changefeedback(value);
              },
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              maxLines: 10,
            ),
          ),
          30.ph,
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return AppConstant.customElvatedButton(context, "Send Feedback",
                  () {
                if (state.laodingfeedback) {
                } else {
                  if (state.feedback!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.only(
                            bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
                        content: Text(
                          "Write your feedback please".tr(context),
                          style: const TextStyle(color: Colors.white),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    context.read<ProfileCubit>().sendFeedback(context);
                  }
                }
              },
                  loading: state.laodingfeedback ? true : false,
                  style: TextStyle(color: Colors.white));
            },
          )
        ],
      ),
    ),
  );
}
