// ignore_for_file: must_be_immutable

import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/all_products/presentation/cubit/all_products.dart';
import 'package:alkhatouna/features/all_products/presentation/cubit/all_products_cubit.dart';
import 'package:alkhatouna/features/all_products/presentation/pages/all_products_skeleton.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AllProductsScreen extends StatefulWidget {
  String? type;
  AllProductsScreen({super.key, this.type});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    checkIfGuest();
    context.read<AllProductsCubit>().getAllProducts(context, widget.type);

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        context.read<AllProductsCubit>().getAllProducts(context, widget.type);
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<AllProductsCubit>().exitAllProductsScreen();
  }

  bool loadingToken = false;
  String? token;
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
    return Scaffold(
      drawer:
          loadingToken ? SizedBox() : AppConstant.CustomDrawer(context, token),
      appBar: AppConstant.customAppBar(
          context,
          widget.type == null
              ? "All Products"
              : widget.type == "discounted"
                  ? "Offers"
                  : widget.type == "with-qouta"
                      ? "With Qouta"
                      : widget.type == "on-tiktok"
                          ? "On Tiktok"
                          : widget.type == "new-arrival"
                              ? "New arrival"
                              : "Most Selling Products",
          widget.type == null ? false : true,
          IconColor: Colors.black),
      body: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: controller,
            child: state.loadingproducts
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
                              state.allProductsData == null
                                  ? 0
                                  : state.allProductsData!.length % 20 != 0
                                      ? state.allProductsData!.length
                                      : state.allProductsData!.length + 2,
                              (index) {
                            if (index >= state.allProductsData!.length) {
                              return index % 20 == 0
                                  ? state.stopLoading
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
                                                .allProductsData![index]
                                                .createdAt,
                                            currentQuantity: state
                                                .allProductsData![index]
                                                .currentQuantity,
                                            discount: state
                                                .allProductsData![index]
                                                .discount,
                                            displayProduct: state
                                                .allProductsData![index]
                                                .displayProduct,
                                            finalPrice: state
                                                .allProductsData![index]
                                                .finalPrice,
                                            id: state
                                                .allProductsData![index].id,
                                            imageUrl: state
                                                .allProductsData![index]
                                                .imageUrl,
                                            isDiscount: state
                                                .allProductsData![index]
                                                .isDiscount,
                                            isFavorite: state
                                                .allProductsData![index]
                                                .is_favorite,
                                            isFeatured: state
                                                .allProductsData![index]
                                                .isFeatured,
                                            minAvailableQuantity: state
                                                .allProductsData![index]
                                                .minAvailableQuantity,
                                            nameAr: state
                                                .allProductsData![index].nameAr,
                                            nameEn: state
                                                .allProductsData![index].nameEn,
                                            nameKu: state
                                                .allProductsData![index].nameKu,
                                            price: state
                                                .allProductsData![index].price,
                                            priceAfterDiscount: state
                                                .allProductsData![index]
                                                .priceAfterDiscount,
                                            reviewAvg: state
                                                .allProductsData![index]
                                                .reviewAvg,
                                            reviewCount: state
                                                .allProductsData![index]
                                                .reviewCount),
                                      ),
                                    )
                                  : FadeInRight(
                                      child: ProductCardWidget(
                                      productDetails: Products(
                                          createdAt: state
                                              .allProductsData![index]
                                              .createdAt,
                                          currentQuantity: state
                                              .allProductsData![index]
                                              .currentQuantity,
                                          discount: state
                                              .allProductsData![index].discount,
                                          displayProduct: state
                                              .allProductsData![index]
                                              .displayProduct,
                                          finalPrice: state
                                              .allProductsData![index]
                                              .finalPrice,
                                          id: state.allProductsData![index].id,
                                          imageUrl: state
                                              .allProductsData![index].imageUrl,
                                          isDiscount: state
                                              .allProductsData![index]
                                              .isDiscount,
                                          isFavorite: state
                                              .allProductsData![index]
                                              .is_favorite,
                                          isFeatured: state
                                              .allProductsData![index]
                                              .isFeatured,
                                          minAvailableQuantity: state
                                              .allProductsData![index]
                                              .minAvailableQuantity,
                                          nameAr: state
                                              .allProductsData![index].nameAr,
                                          nameEn: state
                                              .allProductsData![index].nameEn,
                                          nameKu: state
                                              .allProductsData![index].nameKu,
                                          price: state
                                              .allProductsData![index].price,
                                          priceAfterDiscount: state
                                              .allProductsData![index]
                                              .priceAfterDiscount,
                                          reviewAvg: state
                                              .allProductsData![index]
                                              .reviewAvg,
                                          reviewCount: state
                                              .allProductsData![index]
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
