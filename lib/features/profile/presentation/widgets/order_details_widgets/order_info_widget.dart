import 'package:alkhatouna/features/profile/data/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:intl/intl.dart';

class OrderInfoWidget extends StatefulWidget {
  final Pending orderDetails;

  const OrderInfoWidget({super.key, required this.orderDetails});

  @override
  State<OrderInfoWidget> createState() => _OrderInfoWidgetState();
}

class _OrderInfoWidgetState extends State<OrderInfoWidget> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order information".tr(context),
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor),
        ),
        20.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 115.w,
              child: Text(
                "Shipping Address".tr(context),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.greyColor),
              ),
            ),
            20.pw,
            Expanded(
              child: Text(
                "${"Title".tr(context)} : ${widget.orderDetails.addressTitle} \n ${"Shipping Address".tr(context)} : ${widget.orderDetails.countryName} ${widget.orderDetails.provinceName} ${widget.orderDetails.areaName} ${widget.orderDetails.subAreaName}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.blackColor),
              ),
            ),
          ],
        ),
        10.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 115.w,
              child: Text(
                "Payment method".tr(context),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.greyColor),
              ),
            ),
            20.pw,
            Expanded(
              child: Text(
                "${widget.orderDetails.paymentMethod}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.blackColor),
              ),
            ),
          ],
        ),
        10.ph,
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     SizedBox(
        //       width: 115.w,
        //       child: Text(
        //         "Delivery method".tr(context),
        //         style: TextStyle(
        //             fontWeight: FontWeight.w400,
        //             fontSize: 14.sp,
        //             color: AppColors.greyColor),
        //       ),
        //     ),
        //     20.pw,
        //     Expanded(
        //       child: Text(
        //         "FedEx, 3 days, 15 \$",
        //         style: TextStyle(
        //             fontWeight: FontWeight.w500,
        //             fontSize: 14.sp,
        //             color: AppColors.blackColor),
        //       ),
        //     ),
        //   ],
        // ),
        // 10.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 115.w,
              child: Text(
                "Discount".tr(context),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.greyColor),
              ),
            ),
            20.pw,
            Expanded(
              child: Text(
                "${double.parse(widget.orderDetails.discountPercentage ?? "").toStringAsFixed(2)} %",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.blackColor),
              ),
            ),
          ],
        ),
        10.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 115.w,
              child: Text(
                "Total amount".tr(context),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.greyColor),
              ),
            ),
            20.pw,
            Expanded(
              child: Text(
                "${formatCurrency.format(double.parse(widget.orderDetails.totalAmountAfterDiscount ?? ""))} د.ع",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.blackColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
