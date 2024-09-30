import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/cart/presentation/pages/check_out_screen.dart';
import 'package:intl/intl.dart';

class CartBottomNavigation extends StatefulWidget {
  const CartBottomNavigation({super.key});

  @override
  State<CartBottomNavigation> createState() => _CartBottomNavigationState();
}

class _CartBottomNavigationState extends State<CartBottomNavigation> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(8.sp),
        height: 125.h,
        child: Column(
          children: [
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"Total amount".tr(context)} :",
                  style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      "${formatCurrency.format(state.totalCartPrice)} د.ع",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    );
                  },
                )
              ],
            ),
            10.ph,
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Container(
                    width: 1.sw,
                    height: 48.h,
                    child: ElevatedButton(
                        onPressed: () {
                          if (state.cartData == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.only(
                                    bottom: 30.h,
                                    top: 30.h,
                                    left: 50.w,
                                    right: 50.w),
                                content: Text(
                                  "Cart Is Empty".tr(context),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          } else if (state.cartData!.carts == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.only(
                                    bottom: 30.h,
                                    top: 30.h,
                                    left: 50.w,
                                    right: 50.w),
                                content: Text(
                                  "Cart Is Empty".tr(context),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          } else if (state.cartData!.carts!.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.only(
                                    bottom: 30.h,
                                    top: 30.h,
                                    left: 50.w,
                                    right: 50.w),
                                content: Text(
                                  "Cart Is Empty".tr(context),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          } else {
                            AppConstant.customNavigation(
                                context, CheckOutScreen(), -1, 0);
                          }
                        },
                        child: Text(
                          "CHECK OUT".tr(context),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        )));
              },
            )
          ],
        ),
      ),
    );
  }
}
