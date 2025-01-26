import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/bloc_provider.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductsSidebarSectionsScreen extends StatefulWidget {
  final String sectionID;
  const ProductsSidebarSectionsScreen({super.key, required this.sectionID});

  @override
  State<ProductsSidebarSectionsScreen> createState() =>
      _ProductsSidebarSectionsScreenState();
}

class _ProductsSidebarSectionsScreenState
    extends State<ProductsSidebarSectionsScreen> {
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    context.read<HomeCubit>().existFromSectionProduct();
  }

  int currentIndex = 0;
  final _controller = PageController();
  final controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getproductsSection(context, widget.sectionID);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        context.read<HomeCubit>().getproductsSection(context, widget.sectionID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, locale) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppConstant.customAppBar(
                  context,
                  locale.locale.languageCode == "en"
                      ? state.sectionProductsModel?.data?.sectionInfo?.nameEn ??
                          ""
                      : state.sectionProductsModel?.data?.sectionInfo?.nameAr ??
                          "",
                  true,
                  withTranslate: false),
              body: state.loadingProductSection &&
                      state.pageNumberForProductsSection == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18.sp),
                                  child: Container(
                                    color: Colors.black,
                                    width: 0.8.sw,
                                    height: 238.h,
                                  ),
                                )),
                          ],
                        ),
                        10.verticalSpace,
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: const Color.fromARGB(190, 0, 0, 0),
                                width: 0.8.sw,
                                height: 10.h,
                              ),
                            )),
                        5.verticalSpace,
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: const Color.fromARGB(190, 0, 0, 0),
                                width: 0.8.sw,
                                height: 10.h,
                              ),
                            )),
                        5.verticalSpace,
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: const Color.fromARGB(190, 0, 0, 0),
                                width: 0.8.sw,
                                height: 10.h,
                              ),
                            )),
                        10.verticalSpace,
                        SizedBox(
                          width: 0.8.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18.sp),
                                    child: Container(
                                      color: Colors.black,
                                      width: 0.35.sw,
                                      height: 250.h,
                                    ),
                                  )),
                              Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18.sp),
                                    child: Container(
                                      color: Colors.black,
                                      width: 0.35.sw,
                                      height: 250.h,
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    )
                  : BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return state.sectionProductsModel == null
                            ? SizedBox()
                            : SingleChildScrollView(
                                controller: controller,
                                child: Column(
                                  children: [
                                    state.sectionProductsModel!.data!
                                                .sectionBanners ==
                                            null
                                        ? SizedBox()
                                        : Column(
                                            children: [
                                              state.sectionProductsModel!.data!
                                                          .sectionBanners ==
                                                      null
                                                  ? SizedBox()
                                                  : state
                                                          .sectionProductsModel!
                                                          .data!
                                                          .sectionBanners!
                                                          .isEmpty
                                                      ? SizedBox()
                                                      : SizedBox(
                                                          height: 238,
                                                          child:
                                                              PageView.builder(
                                                            controller:
                                                                _controller,
                                                            itemCount: state
                                                                .sectionProductsModel!
                                                                .data!
                                                                .sectionBanners!
                                                                .length,
                                                            onPageChanged:
                                                                (value) {
                                                              currentIndex =
                                                                  value;
                                                              setState(() {});
                                                            },
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl: state
                                                                              .sectionProductsModel!
                                                                              .data!
                                                                              .sectionBanners![currentIndex]
                                                                              .imageUrl ??
                                                                          '',
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      imageBuilder:
                                                                          (context, imageProvider) =>
                                                                              Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.r),
                                                                          image:
                                                                              DecorationImage(
                                                                            image:
                                                                                imageProvider,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ));
                                                            },
                                                          ),
                                                        ),
                                              state.sectionProductsModel!.data!
                                                          .sectionBanners ==
                                                      null
                                                  ? SizedBox()
                                                  : state
                                                          .sectionProductsModel!
                                                          .data!
                                                          .sectionBanners!
                                                          .isEmpty
                                                      ? SizedBox()
                                                      : const SizedBox(
                                                          height: 10,
                                                        ),
                                              state.sectionProductsModel!.data!
                                                          .sectionBanners ==
                                                      null
                                                  ? SizedBox()
                                                  : state
                                                          .sectionProductsModel!
                                                          .data!
                                                          .sectionBanners!
                                                          .isEmpty
                                                      ? SizedBox()
                                                      : SmoothPageIndicator(
                                                          controller:
                                                              _controller, // PageController
                                                          count: state
                                                              .sectionProductsModel!
                                                              .data!
                                                              .sectionBanners!
                                                              .length,
                                                          effect: WormEffect(
                                                            dotWidth: 7,
                                                            dotHeight: 7,
                                                            spacing: 7,
                                                            activeDotColor:
                                                                AppColors
                                                                    .primaryColor,
                                                            dotColor:
                                                                Colors.grey,
                                                          ), // your preferred effect
                                                          onDotClicked:
                                                              (index) {},
                                                        ),
                                            ],
                                          ),
                                    state.sectionProductsModel?.data
                                                ?.sectionInfo ==
                                            null
                                        ? SizedBox()
                                        : state
                                                        .sectionProductsModel
                                                        ?.data
                                                        ?.sectionInfo!
                                                        .descriptionAr ==
                                                    null ||
                                                state
                                                        .sectionProductsModel
                                                        ?.data
                                                        ?.sectionInfo!
                                                        .descriptionEn ==
                                                    null
                                            ? SizedBox()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.sp),
                                                    "${locale.locale.languageCode == "en" ? state.sectionProductsModel?.data?.sectionInfo?.descriptionEn ?? "" : state.sectionProductsModel?.data?.sectionInfo?.descriptionAr ?? ""}"),
                                              ),
                                    GridView.count(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: (1 / 2),
                                      children: List.generate(
                                          state.stopLoadingProductSection
                                              ? state.productsSection!.length
                                              : state.productsSection!.length +
                                                  2, (index) {
                                        return index <
                                                state.productsSection!.length
                                            ? FadeInUp(
                                                child: ProductCardWidget(
                                                fromSimilarProduct: false,
                                                fromHome: true,
                                                productDetails: Products(
                                                    displayProduct: state
                                                        .productsSection![index]
                                                        .displayProduct,
                                                    finalPrice: state
                                                        .productsSection![index]
                                                        .finalPrice,
                                                    discount: state
                                                        .productsSection![index]
                                                        .discount,
                                                    id: state
                                                        .productsSection![index]
                                                        .id,
                                                    imageUrl: state
                                                        .productsSection![index]
                                                        .imageUrl,
                                                    isDiscount: state
                                                        .productsSection![index]
                                                        .isDiscount,
                                                    isFavorite: state
                                                        .productsSection![index]
                                                        .is_favorite,
                                                    // isFavorite: true,
                                                    nameAr: state
                                                        .productsSection![index]
                                                        .nameAr,
                                                    nameEn: state
                                                        .productsSection![index]
                                                        .nameEn,
                                                    nameKu: state
                                                        .productsSection![index]
                                                        .nameKu,
                                                    isFeatured: state
                                                        .productsSection![index]
                                                        .isFeatured,
                                                    price: state
                                                        .productsSection![index]
                                                        .price,
                                                    reviewAvg: state
                                                        .productsSection![index]
                                                        .reviewAvg,
                                                    reviewCount: state
                                                        .productsSection![index]
                                                        .reviewCount),
                                              ))
                                            : state.stopLoadingProductSection
                                                ? SizedBox()
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Shimmer.fromColors(
                                                        baseColor: Colors
                                                            .grey.shade300,
                                                        highlightColor: Colors
                                                            .grey.shade100,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.sp),
                                                          child: Container(
                                                            color: Colors.black,
                                                            width: 0.2.sw,
                                                            height: 100.h,
                                                          ),
                                                        )),
                                                  );
                                      }),
                                    )
                                  ],
                                ),
                              );
                      },
                    ),
            );
          },
        );
      },
    );
  }
}
