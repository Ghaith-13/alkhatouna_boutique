import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/brand_details_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BrandDetailsScreen extends StatefulWidget {
  final String brandId;
  const BrandDetailsScreen({super.key, required this.brandId});

  @override
  State<BrandDetailsScreen> createState() => _BrandDetailsScreenState();
}

class _BrandDetailsScreenState extends State<BrandDetailsScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getbrandsInfo(context, widget.brandId);

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        context.read<HomeCubit>().getbrandsInfo(context, widget.brandId);
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<HomeCubit>().exitBrandScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppConstant.customAppBar(context, "", true, IconColor: Colors.black),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: controller,
            child: state.loadingBrands
                ? BrandDetailsSkeleton()
                : Padding(
                    padding: EdgeInsets.all(12.0.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: CachedNetworkImage(
                                  width: 90.sp,
                                  height: 90.sp,
                                  fit: BoxFit.scaleDown,
                                  imageUrl:
                                      state.oneBrandDetails!.brand?.logo ?? "",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    // padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: 7.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              20.horizontalSpace,
                              Expanded(
                                child: Text(
                                  state.oneBrandDetails!.brand?.name ?? "",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.sp),
                                ),
                              )
                            ]),
                        state.oneBrandDetails?.products == null
                            ? Center(
                                child: Column(
                                children: [
                                  Lottie.asset('assets/images/empty_data.json'),
                                  Text(
                                    "Sorry, there are no products.".tr(context),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp),
                                  ),
                                ],
                              ))
                            : state.oneBrandDetails!.products!.isEmpty
                                ? Center(
                                    child: Column(
                                    children: [
                                      Lottie.asset(
                                          'assets/images/empty_data.json'),
                                      Text(
                                        "Sorry, there are no products."
                                            .tr(context),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp),
                                      ),
                                    ],
                                  ))
                                : GridView.count(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: (1 / 2),
                                    children: List.generate(
                                        state.oneBrandDetails?.products == null
                                            ? 0
                                            : state.oneBrandDetails!.products!
                                                    .length +
                                                2, (index) {
                                      if (index >=
                                          state.oneBrandDetails!.products!
                                              .length) {
                                        return index % 20 == 0
                                            ? state.stopLoadingBrand
                                                ? SizedBox()
                                                : Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey.shade300,
                                                    highlightColor:
                                                        Colors.grey.shade100,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.sp),
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
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .createdAt,
                                                      currentQuantity: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .currentQuantity,
                                                      discount: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .discount,
                                                      displayProduct: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .displayProduct,
                                                      finalPrice: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .finalPrice,
                                                      id: state.oneBrandDetails!
                                                          .products![index].id,
                                                      imageUrl: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .imageUrl,
                                                      isDiscount: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .isDiscount,
                                                      isFavorite: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .is_favorite,
                                                      isFeatured: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .isFeatured,
                                                      minAvailableQuantity: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .minAvailableQuantity,
                                                      nameAr: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .nameAr,
                                                      nameEn: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .nameEn,
                                                      nameKu: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .nameKu,
                                                      price: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .price,
                                                      priceAfterDiscount: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .priceAfterDiscount,
                                                      reviewAvg: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .reviewAvg,
                                                      reviewCount: state
                                                          .oneBrandDetails!
                                                          .products![index]
                                                          .reviewCount),
                                                ),
                                              )
                                            : FadeInRight(
                                                child: ProductCardWidget(
                                                productDetails: Products(
                                                    createdAt: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .createdAt,
                                                    currentQuantity: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .currentQuantity,
                                                    discount: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .discount,
                                                    displayProduct: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .displayProduct,
                                                    finalPrice: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .finalPrice,
                                                    id: state.oneBrandDetails!
                                                        .products![index].id,
                                                    imageUrl: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .imageUrl,
                                                    isDiscount: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .isDiscount,
                                                    isFavorite: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .is_favorite,
                                                    isFeatured: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .isFeatured,
                                                    minAvailableQuantity: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .minAvailableQuantity,
                                                    nameAr: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .nameAr,
                                                    nameEn: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .nameEn,
                                                    nameKu: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .nameKu,
                                                    price: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .price,
                                                    priceAfterDiscount: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .priceAfterDiscount,
                                                    reviewAvg: state
                                                        .oneBrandDetails!
                                                        .products![index]
                                                        .reviewAvg,
                                                    reviewCount: state
                                                        .oneBrandDetails!
                                                        .products![index]
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
