import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/rating_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/stars_widget.dart';
import 'package:intl/intl.dart';

class ProductDescriptionWidget extends StatefulWidget {
  const ProductDescriptionWidget({super.key});

  @override
  State<ProductDescriptionWidget> createState() =>
      _ProductDescriptionWidgetState();
}

class _ProductDescriptionWidgetState extends State<ProductDescriptionWidget> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, locale) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          locale.locale.languageCode == "en"
                              ? state.productData!.product!.nameEn ?? ""
                              : locale.locale.languageCode == "ar"
                                  ? state.productData!.product!.nameAr ?? ""
                                  : state.productData!.product!.nameKu ?? "",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor),
                        ),
                      ),
                    ],
                  ),
                  state.productData!.product!.isDiscount!
                      ? Row(
                          children: [
                            Text(
                                '${(formatCurrency.format(double.parse(state.productData!.product!.price!)))} د.ع',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 18.sp,
                                    color: AppColors.greyColor,
                                    fontWeight: FontWeight.w500)),
                            20.pw,
                            Text(
                              "${(formatCurrency.format(double.parse(state.productData!.product!.finalPrice!)))} د.ع",
                              style: TextStyle(
                                  color: AppColors.redColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      : Text(
                          "${(formatCurrency.format(double.parse(state.productData!.product!.finalPrice!)))} د.ع",
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                  Text(
                    locale.locale.languageCode == "en"
                        ? state.productData!.product!.paragraphEn ?? ""
                        : locale.locale.languageCode == "ar"
                            ? state.productData!.product!.paragraphAr ?? ""
                            : state.productData!.product!.paragraphKu ?? "",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor),
                  ),
                  5.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarsWidget(
                        reviewAvg: state.productData!.product!.reviewAvg ?? 0,
                        reviewCount:
                            state.productData!.product!.reviewCount ?? 0,
                      ),
                      InkWell(
                        onTap: () {
                          AppConstant.customNavigation(
                              context,
                              RatingScreen(
                                finalRating:
                                    state.productData!.product!.reviewAvg,
                                reviews: state.productData!.product!.reviews,
                              ),
                              -1,
                              0);
                        },
                        child: Text(
                          "${"Show details".tr(context)} >",
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
