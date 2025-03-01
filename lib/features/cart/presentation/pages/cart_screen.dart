import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/auth/presentation/pages/log_in_screen.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alkhatouna/features/cart/presentation/pages/cart_skeleton.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/cart/presentation/widgets/cart_widgets/cart_bottom_navigation.dart';
import 'package:alkhatouna/features/cart/presentation/widgets/cart_widgets/one_cart_item_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    checkIfGuest();
  }

  bool loadingToken = false;
  String? token;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });

    token = await CacheHelper.getData(key: "USER_TOKEN");
    if (token != null) {
      context.read<CartCubit>().getCarts();
    }
    setState(() {
      loadingToken = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          drawer: loadingToken
              ? SizedBox()
              : AppConstant.CustomDrawer(context, token),
          backgroundColor: AppColors.whiteColor,
          bottomNavigationBar: loadingToken
              ? SizedBox()
              : token == null
                  ? SizedBox()
                  : state.loadingGetCart
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                              color: Colors.black,
                              width: 1.sw,
                              height: 175.h,
                            ),
                          ))
                      : state.cartData!.carts!.isEmpty
                          ? SizedBox()
                          : CartBottomNavigation(),
          appBar: AppConstant.customAppBar(
            context,
            "",
            false,
            withTranslate: false,
            IconColor: AppColors.blackColor,
            backgroundColor: AppColors.whiteColor,
            elvation: 0,
          ),
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: loadingToken
                      ? SizedBox()
                      : token == null
                          ? Column(
                              children: [
                                Lottie.asset('assets/images/log_in.json'),
                                Text(
                                  "Log in to enjoy these features.".tr(context),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                                10.ph,
                                AppConstant.customElvatedButton(
                                    context, "Login", () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LogInScreen()),
                                    (Route route) => false,
                                  );
                                },
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          : state.loadingGetCart
                              ? CartSkeleton()
                              : state.cartData == null
                                  ? CartSkeleton()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "My Bag".tr(context),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 34.sp,
                                                  color: AppColors.blackColor),
                                            ),
                                            state.cartData!.carts!.isEmpty
                                                ? SizedBox()
                                                : state.loadingdeleteCart
                                                    ? SizedBox()
                                                    : GestureDetector(
                                                        onTap: () {
                                                          _showDeleteConfirmationDialog(
                                                              context);
                                                        },
                                                        child: Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12.0),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                10.pw,
                                                                Text(
                                                                  "Delete All".tr(
                                                                      context),
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                        ),
                                                      )

                                            // ElevatedButton.icon(
                                            //     style: ElevatedButton
                                            //         .styleFrom(
                                            //       backgroundColor:
                                            //           Colors.red,
                                            //       foregroundColor:
                                            //           Colors.white,
                                            //     ),
                                            //     label: Text("Delete All"
                                            //         .tr(context)),
                                            //     icon:
                                            //         Icon(Icons.delete),
                                            //     onPressed: () {
                                            //       _showDeleteConfirmationDialog(
                                            //           context);
                                            //     },
                                            //   )
                                          ],
                                        ),
                                        30.ph,
                                        state.cartData!.carts!.isEmpty
                                            ? Center(
                                                child: Column(
                                                  children: [
                                                    Lottie.asset(
                                                        'assets/images/empty_data.json'),
                                                    Text(
                                                      "Cart Is Empty !"
                                                          .tr(context),
                                                      style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    state.cartData!.carts ==
                                                            null
                                                        ? 0
                                                        : state.cartData!.carts!
                                                            .length,
                                                itemBuilder: (context, index) {
                                                  return FadeInDown(
                                                      child: OneCartItemWidget(
                                                    cartItem: state.cartData!
                                                        .carts![index],
                                                  ));
                                                },
                                              )
                                      ],
                                    ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'.tr(context)),
          content: Text(
              'Are you sure you want to delete all items from your cart ?'
                  .tr(context)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No'.tr(
                  context,
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<CartCubit>().deleteCart();
                Navigator.of(context).pop();
              },
              child: Text(
                'Yes'.tr(context),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
