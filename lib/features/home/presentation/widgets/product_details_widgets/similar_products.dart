import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';

class SimilarProducts extends StatefulWidget {
  const SimilarProducts({super.key});

  @override
  State<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.productData!.relatedProducts == null
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "You can also like this".tr(context),
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor),
                        ),
                        Text(
                          "${state.productData!.relatedProducts!.length} ${"items".tr(context)}",
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 350.h,
                      width: 1.sw,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.productData!.relatedProducts!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          String image = "";
                          for (int i = 0;
                              i <
                                  state.productData!.relatedProducts![index]
                                      .attachments!.length;
                              i++) {
                            if (state.productData!.relatedProducts![index]
                                    .attachments![i].type ==
                                "image") {
                              image = state.productData!.relatedProducts![index]
                                      .attachments![i].imageUrl ??
                                  "";
                              break;
                            }
                          }
                          return Container(
                              margin: EdgeInsetsDirectional.only(end: 10.w),
                              child: ProductCardWidget(
                                fromSimilarProduct: true,
                                productDetails: Products(
                                    finalPrice: state.productData!
                                        .relatedProducts![index].finalPrice,
                                    discount: state.productData!
                                        .relatedProducts![index].discount,
                                    id: state.productData!
                                        .relatedProducts![index].id,
                                    imageUrl: image,
                                    isDiscount:
                                        double.parse(state.productData!.relatedProducts![index].discount ?? "0.0") ==
                                                0.0
                                            ? false
                                            : true,
                                    isFavorite: state.productData!
                                        .relatedProducts![index].isFavorite,
                                    nameAr: state.productData!
                                        .relatedProducts![index].nameAr,
                                    nameEn: state.productData!
                                        .relatedProducts![index].nameEn,
                                    nameKu: state.productData!
                                        .relatedProducts![index].nameKu,
                                    isFeatured: state.productData!
                                        .relatedProducts![index].isFeatured,
                                    price: state.productData!
                                        .relatedProducts![index].price,
                                    reviewAvg: state.productData!
                                        .relatedProducts![index].reviewAvg,
                                    reviewCount: state.productData!
                                        .relatedProducts![index].reviewCount),
                              ));
                        },
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
