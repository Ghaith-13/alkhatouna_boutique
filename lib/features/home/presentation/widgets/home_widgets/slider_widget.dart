import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/brand_details_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/categories_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class SliderForAds extends StatefulWidget {
  const SliderForAds({super.key});

  @override
  State<SliderForAds> createState() => _SliderForAdsState();
}

class _SliderForAdsState extends State<SliderForAds> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.homeInfo!.banners == null
            ? SizedBox()
            : SizedBox(
                height: 230.h,
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.sp),
                      child: ExpandableCarousel(
                        options: ExpandableCarouselOptions(
                          initialPage: 0,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                        ),
                        items: [
                          for (int i = 0;
                              i < state.homeInfo!.banners!.length;
                              i++)
                            SizedBox(
                              width: 1.sw,
                              height: 200.h,
                              child: InkWell(
                                onTap: () => setState(() {
                                  if (state.homeInfo!.banners![i]
                                          .redirection_url !=
                                      null) {
                                    launchUrl(
                                        Uri.parse(
                                            "${state.homeInfo!.banners![i].redirection_url}"),
                                        mode: LaunchMode.externalApplication);
                                  } else {
                                    if (state
                                            .homeInfo!.banners![i].categoryId !=
                                        null) {
                                      AppConstant.customNavigation(
                                          context,
                                          CategoriesScreen(
                                              categoryId: state.homeInfo!
                                                  .banners![i].categoryId,
                                              title: ""),
                                          -1,
                                          0);
                                    } else if (state
                                            .homeInfo!.banners![i].brandId !=
                                        null) {
                                      AppConstant.customNavigation(
                                          context,
                                          BrandDetailsScreen(
                                            brandId: state
                                                .homeInfo!.banners![i].brandId,
                                          ),
                                          -1,
                                          0);
                                    } else if (state
                                            .homeInfo!.banners![i].productId !=
                                        null) {
                                      AppConstant.customNavigation(
                                          context,
                                          ProductDetailsScreen(
                                            productId: state.homeInfo!
                                                .banners![i].productId,
                                          ),
                                          -1,
                                          0);
                                    }
                                  }
                                }),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      state.homeInfo!.banners![i].imageUrl ??
                                          '',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 1.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0;
                                  i < state.homeInfo!.banners!.length;
                                  i++)
                                Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentImageIndex == i
                                        ? AppColors.primaryColor
                                        : Colors.grey,
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              );
      },
    );
  }
}
