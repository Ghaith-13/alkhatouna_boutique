import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class ProductDetailsBottomNavigation extends StatefulWidget {
  final bool deniedAddToCard;
  const ProductDetailsBottomNavigation(
      {super.key, required this.deniedAddToCard});

  @override
  State<ProductDetailsBottomNavigation> createState() =>
      _ProductDetailsBottomNavigationState();
}

class _ProductDetailsBottomNavigationState
    extends State<ProductDetailsBottomNavigation> {
  bool showCount = true;
  int count = 1;
  @override
  void initState() {
    super.initState();
    checkIfGuest();
  }

  String? token;
  bool loadingToken = false;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });
    token = await CacheHelper.getData(key: "USER_TOKEN");
    setState(() {
      loadingToken = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.deniedAddToCard);
    return widget.deniedAddToCard
        ? BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75.r),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // shape: RoundedRectangleBorder(
                          //   borderRadius:
                          //       BorderRadius.zero, // Set borderRadius to zero
                          // ),
                          ),
                      onPressed: () async {
                        if (token == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.only(
                                  bottom: 30.h,
                                  top: 30.h,
                                  left: 50.w,
                                  right: 50.w),
                              content: Text(
                                "Log in to enjoy these features.".tr(context),
                                style: const TextStyle(color: Colors.white),
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        } else {
                          if (state.notifyProduct) {
                          } else {
                            String? userID = await CacheHelper.getData(
                              key: "USER_ID",
                            );

                            FirebaseMessaging messaging =
                                FirebaseMessaging.instance;

                            String? fcmtoken = await messaging.getToken();
                            context.read<HomeCubit>().notifyProduct(
                                context,
                                userID.toString(),
                                fcmtoken.toString(),
                                state.productData?.product?.id.toString());
                          }
                        }
                      },
                      child: state.notifyProduct
                          ? SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "Notify me when it is available".tr(context),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                ),
              );
            },
          )
        : loadingToken
            ? SizedBox()
            : BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                if (showCount == false) {
                                  if (token == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        padding: EdgeInsets.only(
                                            bottom: 30.h,
                                            top: 30.h,
                                            left: 50.w,
                                            right: 50.w),
                                        content: Text(
                                          "Log in to enjoy these features."
                                              .tr(context),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  } else if (widget.deniedAddToCard) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        padding: EdgeInsets.only(
                                            bottom: 30.h,
                                            top: 30.h,
                                            left: 50.w,
                                            right: 50.w),
                                        content: Text(
                                          "Sorry, this item is currently sold out"
                                              .tr(context),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  } else {
                                    if (state.selectedColor.isEmpty) {
                                      context
                                          .read<HomeCubit>()
                                          .changeColorSelected("Other");
                                    }
                                    if (state.selectedSize.isEmpty) {
                                      context
                                          .read<HomeCubit>()
                                          .changeSelectedSize("Other");
                                    }
                                    if (state.selectedWeight.isEmpty) {
                                      context
                                          .read<HomeCubit>()
                                          .changeselectedWeight("Other");
                                    }
                                    if (state.dimensions.isEmpty) {
                                      context
                                          .read<HomeCubit>()
                                          .changedimensions("Other");
                                    }
                                    setState(() {
                                      showCount = true;
                                    });
                                  }
                                } else {
                                  if (state.loadingAddToCart) {
                                  } else {
                                    if (token == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          padding: EdgeInsets.only(
                                              bottom: 30.h,
                                              top: 30.h,
                                              left: 50.w,
                                              right: 50.w),
                                          content: Text(
                                            "Log in to enjoy these features."
                                                .tr(context),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    } else if (widget.deniedAddToCard) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          padding: EdgeInsets.only(
                                              bottom: 30.h,
                                              top: 30.h,
                                              left: 50.w,
                                              right: 50.w),
                                          content: Text(
                                            "Sorry, this item is currently sold out"
                                                .tr(context),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      context.read<HomeCubit>().addToCart(
                                          context,
                                          state.productData!.product!.id!
                                              .toString(),
                                          count.toString());
                                    }

                                    // setState(() {
                                    //   showCount = false;
                                    // });
                                  }

                                  // AppConstant.customNavigation(
                                  //     context, RatingScreen(), -1, 1);
                                }
                              },
                              child: state.loadingAddToCart
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "ADD TO CART".tr(context),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    )),
                        ),
                        showCount
                            ? Row(
                                children: [
                                  5.pw,
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        count = count + 1;
                                      });
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: AppColors.primaryColor,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )),
                                  ),
                                  5.pw,
                                  Text(
                                    "$count",
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  5.pw,
                                  InkWell(
                                    onTap: () {
                                      if (count == 1) {
                                      } else {
                                        setState(() {
                                          count = count - 1;
                                        });
                                      }
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: AppColors.primaryColor,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        )),
                                  ),
                                  5.pw,
                                ],
                              )
                            : SizedBox()
                      ],
                    ),
                  );
                },
              );
  }
}
