// ignore_for_file: must_be_immutable

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:intl/intl.dart';

class ProductPriceWidget extends StatefulWidget {
  bool haveOffer;
  final Products productDetails;
  ProductPriceWidget(
      {super.key, this.haveOffer = false, required this.productDetails});

  @override
  State<ProductPriceWidget> createState() => _ProductPriceWidgetState();
}

class _ProductPriceWidgetState extends State<ProductPriceWidget> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return widget.haveOffer
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${(formatCurrency.format(double.parse(widget.productDetails.price.toString())))} د.ع',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.redColor,
                      fontSize: 12.sp,
                      color: AppColors.redColor,
                      fontWeight: FontWeight.w500)),
              // 20.pw,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${formatCurrency.format(double.parse(widget.productDetails.finalPrice.toString()))} د.ع",
                    style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  widget.productDetails.points == null
                      ? SizedBox()
                      : widget.productDetails.points == ""
                          ? SizedBox()
                          : widget.productDetails.points == "0"
                              ? SizedBox()
                              : Text(
                                  "+${widget.productDetails.points} ${"points".tr(context)}",
                                  style: TextStyle(
                                      color: AppColors.greenColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                ],
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${formatCurrency.format(double.parse(widget.productDetails.price.toString()))} د.ع",
                style: TextStyle(
                    color: AppColors.greenColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              ),
              widget.productDetails.points == null
                  ? SizedBox()
                  : widget.productDetails.points == ""
                      ? SizedBox()
                      : widget.productDetails.points == "0"
                          ? SizedBox()
                          : Text(
                              "+${widget.productDetails.points} ${"points".tr(context)}",
                              style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
            ],
          );
  }
}
