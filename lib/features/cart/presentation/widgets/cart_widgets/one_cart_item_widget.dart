// ignore_for_file: must_be_immutable

import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/extensions/colors_extensions.dart';
import 'package:alkhatouna/features/cart/data/models/get_cart_model.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OneCartItemWidget extends StatefulWidget {
  Carts cartItem;
  OneCartItemWidget({super.key, required this.cartItem});

  @override
  State<OneCartItemWidget> createState() => _OneCartItemWidgetState();
}

class _OneCartItemWidgetState extends State<OneCartItemWidget> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: "",
  );
  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'.tr(context)),
          content: Text(
              'Are you sure you want to delete this item from your cart ?'
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
                context.read<CartCubit>().removeFromCart(
                    "-${widget.cartItem.quantity}",
                    widget.cartItem.id.toString(),
                    FinalPrice: widget.cartItem.product!.finalPrice!.toString(),
                    deleteAll: true);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 16 / 95,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              spacing: 0,
              padding: EdgeInsets.all(0),
              flex: 2,
              onPressed: (context) {
                _showDeleteConfirmationDialog(context);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'delete'.tr(context),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 10.h),
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.sp),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0.sp),
                      bottomLeft: Radius.circular(8.0.sp)),
                  child: CachedNetworkImage(
                    width: 104.sp,
                    height: 104.sp,
                    fit: BoxFit.fill,
                    imageUrl: widget.cartItem.product!.imageUrl ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<LocaleCubit, LocaleState>(
                            builder: (context, locale) {
                              return Expanded(
                                child: Text(
                                  "${locale.locale.languageCode == "en" ? widget.cartItem.product!.nameEn ?? "" : locale.locale.languageCode == "ar" ? widget.cartItem.product!.nameAr ?? "" : widget.cartItem.product!.nameKu ?? ""}",
                                  style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            },
                          ),
                          widget.cartItem.product!.isFavorite!
                              ? Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8, top: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<HomeCubit>().toggleFavorite(
                                          context,
                                          widget.cartItem.product!.id
                                              .toString());
                                      setState(() {
                                        widget.cartItem.product!.isFavorite =
                                            !widget
                                                .cartItem.product!.isFavorite!;
                                      });
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 24.sp,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8, top: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<HomeCubit>().toggleFavorite(
                                          context,
                                          widget.cartItem.product!.id
                                              .toString());
                                      setState(() {
                                        widget.cartItem.product!.isFavorite =
                                            !widget
                                                .cartItem.product!.isFavorite!;
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/favorite.svg",
                                      width: 24.sp,
                                      height: 24.sp,
                                    ),
                                  ),
                                ),
                          // SizedBox(
                          //   height: 24.h,
                          //   width: 12.w,
                          //   child: PopupMenuButton(
                          //     // offset: Offset.zero,
                          //     padding: EdgeInsets.all(0),
                          //     color: Colors.white,
                          //     icon: SvgPicture.asset("assets/icons/option.svg"),
                          //     itemBuilder: (context) => [
                          //       PopupMenuItem(
                          //         value: 'Add',
                          //         child: Text(widget.cartItem.product!.isFavorite!
                          //             ? 'Remove from favorites'.tr(context)
                          //             : 'Add to favorites'.tr(context)),
                          //       ),
                          //       PopupMenuItem(
                          //         value: 'delete',
                          //         child: Text('Delete from the list'.tr(context)),
                          //       ),
                          //     ],
                          //     onSelected: (value) {
                          //       if (value == 'delete') {
                          //         context.read<CartCubit>().removeFromCart(
                          //             "-${widget.cartItem.quantity}",
                          //             widget.cartItem.id.toString(),
                          //             FinalPrice: widget
                          //                 .cartItem.product!.finalPrice!
                          //                 .toString(),
                          //             deleteAll: true);
                          //       } else {
                          //         context.read<HomeCubit>().toggleFavorite(
                          //             context,
                          //             widget.cartItem.product!.id.toString());
                          //         setState(() {
                          //           widget.cartItem.product!.isFavorite =
                          //               !widget.cartItem.product!.isFavorite!;
                          //         });
                          //       }
                          //     },
                          //   ),
                          // )
                        ],
                      ),
                      10.ph,
                      Row(
                        children: [
                          widget.cartItem.hexColor == "default"
                              ? SizedBox()
                              : Text(
                                  "${"Color".tr(context)} : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: AppColors.greyColor),
                                ),
                          widget.cartItem.hexColor == "default"
                              ? SizedBox()
                              : widget.cartItem.hexColor == "Other"
                                  ? Text(
                                      "Other".tr(context),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                          color: AppColors.blackColor),
                                    )
                                  : widget.cartItem.hexColor == "other"
                                      ? Text(
                                          "Other".tr(context),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                              color: AppColors.blackColor),
                                        )
                                      : Container(
                                          width: 20.sp,
                                          height: 20.sp,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: HexColor.fromHex(
                                                widget.cartItem.hexColor!),
                                            border: Border.all(
                                              color: AppColors.primaryColor,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                          20.pw,
                          widget.cartItem.size == "default"
                              ? SizedBox()
                              : Text(
                                  "${"Size".tr(context)} : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: AppColors.greyColor),
                                ),
                          widget.cartItem.size == "default"
                              ? SizedBox()
                              : widget.cartItem.size == "Other"
                                  ? Text(
                                      "Other".tr(context),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                          color: AppColors.blackColor),
                                    )
                                  : Text(
                                      "${widget.cartItem.size}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                          color: AppColors.blackColor),
                                    ),
                        ],
                      ),
                      10.ph,
                      Row(
                        children: [
                          widget.cartItem.weight == "default"
                              ? SizedBox()
                              : Text(
                                  "${"weight".tr(context)} : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: AppColors.greyColor),
                                ),
                          widget.cartItem.weight == "default"
                              ? SizedBox()
                              : widget.cartItem.weight == "Other"
                                  ? Text(
                                      "Other".tr(context),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                          color: AppColors.blackColor),
                                    )
                                  : Text(
                                      "${widget.cartItem.weight ?? "Other".tr(context)}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                          color: AppColors.blackColor),
                                    ),
                          20.pw,
                          widget.cartItem.dimension == "default"
                              ? SizedBox()
                              : Text(
                                  "${"dimension".tr(context)} : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: AppColors.greyColor),
                                ),
                          widget.cartItem.dimension == "default"
                              ? SizedBox()
                              : widget.cartItem.dimension == "Other"
                                  ? Text(
                                      "Other".tr(context),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                          color: AppColors.blackColor),
                                    )
                                  : Text(
                                      "${widget.cartItem.dimension ?? "Other".tr(context)}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                          color: AppColors.blackColor),
                                    ),
                        ],
                      ),
                      10.ph,
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<CartCubit>()
                                            .cahngeclcikedCartId(
                                                widget.cartItem.id);
                                        if (state.laodingUpdateItem &&
                                            state.clcikedCartId ==
                                                widget.cartItem.id) {
                                        } else {
                                          if (widget.cartItem.quantity == "1") {
                                          } else {
                                            setState(() {
                                              widget.cartItem.quantity =
                                                  (int.parse(widget.cartItem
                                                              .quantity!) -
                                                          1)
                                                      .toString();
                                            });
                                            context
                                                .read<CartCubit>()
                                                .removeFromCart(
                                                    "-1",
                                                    widget.cartItem.id
                                                        .toString());
                                            context
                                                .read<CartCubit>()
                                                .removefromTotalPrice(
                                                    double.parse(widget.cartItem
                                                        .product!.finalPrice!
                                                        .toString()));
                                            // print("Done");
                                          }
                                        }
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: state.laodingUpdateItem &&
                                                state.clcikedCartId ==
                                                    widget.cartItem.id
                                            ? CircularProgressIndicator(
                                                color: Colors.black,
                                              )
                                            : Icon(
                                                Icons.remove,
                                                color: AppColors.greyColor,
                                              ),
                                      ),
                                    ),
                                  ),
                                  10.pw,
                                  Text(
                                    "${widget.cartItem.quantity}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: AppColors.blackColor),
                                  ),
                                  10.pw,
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape
                                          .circle, // Maintain the circular shape
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Shadow color with transparency
                                          blurRadius:
                                              5.0, // Adjust blur radius for softness
                                          spreadRadius:
                                              2.0, // Optional: adjust spread for size
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<CartCubit>()
                                            .cahngeclcikedCartId(
                                                widget.cartItem.id);
                                        if (state.laodingUpdateItem &&
                                            state.clcikedCartId ==
                                                widget.cartItem.id) {
                                        } else {
                                          setState(() {
                                            widget.cartItem.quantity =
                                                (int.parse(widget.cartItem
                                                            .quantity!) +
                                                        1)
                                                    .toString();
                                          });
                                          context
                                              .read<CartCubit>()
                                              .removeFromCart(
                                                  "+1",
                                                  widget.cartItem.id
                                                      .toString());
                                          context
                                              .read<CartCubit>()
                                              .addToTotalPrice(double.parse(
                                                  widget.cartItem.product!
                                                      .finalPrice!
                                                      .toString()));
                                        }
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: state.laodingUpdateItem &&
                                                state.clcikedCartId ==
                                                    widget.cartItem.id
                                            ? CircularProgressIndicator(
                                                color: Colors.black,
                                              )
                                            : Icon(Icons.add,
                                                color: AppColors.greyColor),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                  "${(formatCurrency.format(double.parse(widget.cartItem.product!.finalPrice!.toString()) * double.parse(widget.cartItem.quantity!.toString())))} د.ع",
                                  style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500))
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
