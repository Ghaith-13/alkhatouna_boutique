import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

Widget ratingBottomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
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
                "What is you rate?".tr(context),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: AppColors.blackColor),
              ),
            ],
          ),
          10.ph,
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().changerating(1);
                      },
                      child: state.rating > 0 && state.rating < 1
                          ? Icon(Icons.star_half_rounded,
                              size: 30, color: Colors.amber)
                          : Icon(
                              Icons.star_rate_rounded,
                              size: 30,
                              color: state.rating >= 1 && state.rating <= 5
                                  ? Colors.amber
                                  : const Color(0xffC4C4C4),
                            ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().changerating(2);
                      },
                      child: state.rating <= 1 || state.rating >= 2
                          ? Icon(
                              Icons.star_rate_rounded,
                              size: 30,
                              color: (state.rating > 1 || state.rating >= 2) &&
                                      state.rating <= 5
                                  ? Colors.amber
                                  : const Color(0xffC4C4C4),
                            )
                          : state.rating > 1 && state.rating < 2
                              ? Icon(Icons.star_half_rounded,
                                  size: 30, color: Colors.amber)
                              : const SizedBox(
                                  height: 0,
                                ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().changerating(3);
                      },
                      child: state.rating <= 2 || state.rating >= 3
                          ? Icon(
                              Icons.star_rate_rounded,
                              size: 30,
                              color: (state.rating > 2 || state.rating >= 3) &&
                                      state.rating <= 5
                                  ? Colors.amber
                                  : const Color(0xffC4C4C4),
                            )
                          : state.rating > 2 && state.rating < 3
                              ? Icon(Icons.star_half_rounded,
                                  size: 30, color: Colors.amber)
                              : const SizedBox(
                                  height: 0,
                                ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().changerating(4);
                      },
                      child: state.rating <= 3 || state.rating >= 4
                          ? Icon(
                              Icons.star_rate_rounded,
                              size: 30,
                              color: (state.rating > 3 || state.rating >= 4) &&
                                      state.rating <= 5
                                  ? Colors.amber
                                  : const Color(0xffC4C4C4),
                            )
                          : state.rating > 3 && state.rating < 4
                              ? Icon(Icons.star_half_rounded,
                                  size: 30, color: Colors.amber)
                              : const SizedBox(
                                  height: 0,
                                ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().changerating(5);
                      },
                      child: state.rating <= 4 || state.rating >= 5
                          ? Icon(
                              Icons.star_rate_rounded,
                              size: 30,
                              color: state.rating > 4 && state.rating <= 5
                                  ? Colors.amber
                                  : const Color(0xffC4C4C4),
                            )
                          : state.rating > 4 && state.rating < 5
                              ? Icon(Icons.star_half_rounded,
                                  size: 30, color: Colors.amber)
                              : const SizedBox(
                                  height: 0,
                                ),
                    ),
                  ],
                ),
              );
            },
          ),
          20.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please share your opinion about the product".tr(context),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: AppColors.blackColor),
              ),
            ],
          ),
          10.ph,
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
                context.read<HomeCubit>().changereview(value);
              },
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              maxLines: 10,
            ),
          ),
          75.ph,
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: 1.sw,
                  height: 48.h,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            if (state.laodingReview) {
                            } else {
                              if (state.review!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.only(
                                        bottom: 30.h,
                                        top: 30.h,
                                        left: 50.w,
                                        right: 50.w),
                                    content: Text(
                                      "Please write a review".tr(context),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                context.read<HomeCubit>().sendReview(context,
                                    state.productData!.product!.id.toString());
                              }
                            }
                          },
                          child: state.laodingReview
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "SEND REVIEW".tr(context),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ));
                    },
                  ))
            ],
          )
        ],
      ),
    ),
  );
}
