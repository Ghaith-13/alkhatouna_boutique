// ignore_for_file: must_be_immutable

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_image_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_price_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/stars_widget.dart';

class ProductCardWidget extends StatefulWidget {
  bool fromSimilarProduct;
  Products productDetails;

  ProductCardWidget(
      {super.key,
      required this.productDetails,
      this.fromSimilarProduct = false});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      InkWell(onTap: () {
        AppConstant.customNavigation(
            context,
            ProductDetailsScreen(
              productId: widget.productDetails.id.toString(),
            ),
            -1,
            0);
      }, child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, locale) {
          return SizedBox(
            // height: 260.h,
            width: 150.w,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.0.sp),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.sp),
                        ),
                        child: ProductImageWidget(
                          fromSimilarProduct: widget.fromSimilarProduct,
                          productDetails: widget.productDetails,
                          haveOffer: widget.productDetails.isDiscount!,
                        )),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            10.ph,
                            StarsWidget(
                              reviewAvg: widget.productDetails.reviewAvg,
                              reviewCount: widget.productDetails.reviewCount,
                            ),
                            5.ph,
                            // Text(
                            //   "Mango",
                            //   style: TextStyle(
                            //       fontSize: 11.sp,
                            //       color: AppColors.greyColor,
                            //       fontWeight: FontWeight.w400),
                            // ),
                            // 5.ph,
                            Text(
                              locale.locale.languageCode == "en"
                                  ? widget.productDetails.nameEn ?? ""
                                  : locale.locale.languageCode == "ar"
                                      ? widget.productDetails.nameAr ?? ""
                                      : widget.productDetails.nameKu ?? "",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            5.ph,
                            ProductPriceWidget(
                              productDetails: widget.productDetails,
                              haveOffer: widget.productDetails.isDiscount!,
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        },
      )),
      widget.productDetails.displayProduct == false
          ? ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
              child: Container(
                margin: EdgeInsets.only(bottom: 20.h),
                width: 1.sw,
                color: const Color.fromARGB(185, 255, 255, 255),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.sw,
                      color: Colors.white,
                      child: Text(
                        "Sorry, this item is currently sold out".tr(context),
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            )
          : SizedBox(),
    ]);
  }
}
