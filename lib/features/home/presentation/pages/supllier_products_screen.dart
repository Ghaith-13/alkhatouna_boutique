import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/all_products/presentation/cubit/all_products.dart';
import 'package:alkhatouna/features/all_products/presentation/cubit/all_products_cubit.dart';
import 'package:alkhatouna/features/all_products/presentation/pages/all_products_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/models/sub_categories_model.dart';

class SupllierProductsScreen extends StatefulWidget {
  final String supllierID;
  final String title;
  const SupllierProductsScreen(
      {super.key, required this.supllierID, required this.title});

  @override
  State<SupllierProductsScreen> createState() => _SupllierProductsScreenState();
}

class _SupllierProductsScreenState extends State<SupllierProductsScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllProducts(context, widget.supllierID);

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        context.read<HomeCubit>().getAllProducts(context, widget.supllierID);
      }
    });
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    context.read<HomeCubit>().exitAllProductsScreenSupllier();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, "${widget.title}", true,
          withTranslate: false),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: controller,
            child: state.loadingSupllierProducts
                ? AllProductsSkeleton()
                : Padding(
                    padding: EdgeInsets.all(12.0.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GridView.count(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          childAspectRatio: (1 / 2),
                          children: List.generate(
                              state.productsForSuplliers == null
                                  ? 0
                                  : state.productsForSuplliers!.length % 20 != 0
                                      ? state.productsForSuplliers!.length
                                      : state.productsForSuplliers!.length + 2,
                              (index) {
                            if (index >= state.productsForSuplliers!.length) {
                              return index % 20 == 0
                                  ? state.stopLoadingSupllier
                                      ? SizedBox()
                                      : Shimmer.fromColors(
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.grey.shade100,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(18.sp),
                                            child: Container(
                                              color: Colors.black,
                                              width: 0.4.sw,
                                              height: 100.h,
                                            ),
                                          ))
                                  : SizedBox();
                            } else
                              return index % 2 == 0
                                  ? FadeInLeft(
                                      child: ProductCardWidget(
                                        productDetails: Products(
                                            createdAt: state
                                                .productsForSuplliers![index]
                                                .createdAt,
                                            currentQuantity: state
                                                .productsForSuplliers![index]
                                                .currentQuantity,
                                            discount: state
                                                .productsForSuplliers![index]
                                                .discount,
                                            displayProduct: state
                                                .productsForSuplliers![index]
                                                .displayProduct,
                                            finalPrice: state
                                                .productsForSuplliers![index]
                                                .finalPrice,
                                            id: state
                                                .productsForSuplliers![index]
                                                .id,
                                            imageUrl: state
                                                .productsForSuplliers![index]
                                                .imageUrl,
                                            isDiscount: state
                                                .productsForSuplliers![index]
                                                .isDiscount,
                                            isFavorite: state
                                                .productsForSuplliers![index]
                                                .is_favorite,
                                            isFeatured: state
                                                .productsForSuplliers![index]
                                                .isFeatured,
                                            minAvailableQuantity: state
                                                .productsForSuplliers![index]
                                                .minAvailableQuantity,
                                            nameAr: state
                                                .productsForSuplliers![index]
                                                .nameAr,
                                            nameEn: state
                                                .productsForSuplliers![index]
                                                .nameEn,
                                            nameKu: state
                                                .productsForSuplliers![index]
                                                .nameKu,
                                            price: state
                                                .productsForSuplliers![index]
                                                .price,
                                            priceAfterDiscount: state
                                                .productsForSuplliers![index]
                                                .priceAfterDiscount,
                                            reviewAvg: state
                                                .productsForSuplliers![index]
                                                .reviewAvg,
                                            reviewCount: state
                                                .productsForSuplliers![index]
                                                .reviewCount),
                                      ),
                                    )
                                  : FadeInRight(
                                      child: ProductCardWidget(
                                      productDetails: Products(
                                          createdAt: state
                                              .productsForSuplliers![index]
                                              .createdAt,
                                          currentQuantity: state
                                              .productsForSuplliers![index]
                                              .currentQuantity,
                                          discount: state
                                              .productsForSuplliers![index]
                                              .discount,
                                          displayProduct: state
                                              .productsForSuplliers![index]
                                              .displayProduct,
                                          finalPrice: state
                                              .productsForSuplliers![index]
                                              .finalPrice,
                                          id: state
                                              .productsForSuplliers![index].id,
                                          imageUrl: state
                                              .productsForSuplliers![index]
                                              .imageUrl,
                                          isDiscount: state
                                              .productsForSuplliers![index]
                                              .isDiscount,
                                          isFavorite: state
                                              .productsForSuplliers![index]
                                              .is_favorite,
                                          isFeatured: state
                                              .productsForSuplliers![index]
                                              .isFeatured,
                                          minAvailableQuantity: state
                                              .productsForSuplliers![index]
                                              .minAvailableQuantity,
                                          nameAr: state
                                              .productsForSuplliers![index]
                                              .nameAr,
                                          nameEn: state
                                              .productsForSuplliers![index]
                                              .nameEn,
                                          nameKu: state
                                              .productsForSuplliers![index]
                                              .nameKu,
                                          price: state
                                              .productsForSuplliers![index]
                                              .price,
                                          priceAfterDiscount: state
                                              .productsForSuplliers![index]
                                              .priceAfterDiscount,
                                          reviewAvg: state
                                              .productsForSuplliers![index]
                                              .reviewAvg,
                                          reviewCount: state
                                              .productsForSuplliers![index]
                                              .reviewCount),
                                    ));
                          }),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
