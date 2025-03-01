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

class SmallSliderWidget extends StatefulWidget {
  const SmallSliderWidget({super.key});

  @override
  State<SmallSliderWidget> createState() => _SmallSliderWidgetState();
}

class _SmallSliderWidgetState extends State<SmallSliderWidget> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.homeInfo!.topBanners == null
            ? SizedBox()
            : SizedBox(
                height: 150.h,
                child: Container(
                  margin: EdgeInsets.only(top: 15.sp),
                  child: ExpandableCarousel(
                    options: ExpandableCarouselOptions(
                      floatingIndicator: true,
                      initialPage: 0,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      showIndicator: false,
                      // clipBehavior: Clip,

                      // aspectRatio: 1,
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
                          i < state.homeInfo!.topBanners!.length;
                          i++)
                        SizedBox(
                          width: 1.sw,
                          height: 200.h,
                          child: InkWell(
                            onTap: () => setState(() {
                              if (state.homeInfo!.topBanners![i]
                                      .redirection_url !=
                                  null) {
                                launchUrl(
                                    Uri.parse(
                                        "${state.homeInfo!.topBanners![i].redirection_url}"),
                                    mode: LaunchMode.externalApplication);
                              } else {
                                if (state.homeInfo!.topBanners![i].categoryId !=
                                    null) {
                                  AppConstant.customNavigation(
                                      context,
                                      CategoriesScreen(
                                          categoryId: state.homeInfo!
                                              .topBanners![i].categoryId,
                                          title: ""),
                                      -1,
                                      0);
                                } else if (state
                                        .homeInfo!.topBanners![i].brandId !=
                                    null) {
                                  AppConstant.customNavigation(
                                      context,
                                      BrandDetailsScreen(
                                        brandId: state
                                            .homeInfo!.topBanners![i].brandId,
                                      ),
                                      -1,
                                      0);
                                } else if (state
                                        .homeInfo!.topBanners![i].productId !=
                                    null) {
                                  AppConstant.customNavigation(
                                      context,
                                      ProductDetailsScreen(
                                        productId: state
                                            .homeInfo!.topBanners![i].productId,
                                      ),
                                      -1,
                                      0);
                                }
                              }
                            }),
                            child: CachedNetworkImage(
                              imageUrl:
                                  state.homeInfo!.topBanners![i].imageUrl ?? '',
                              fit: BoxFit.fill,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(15.r),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
