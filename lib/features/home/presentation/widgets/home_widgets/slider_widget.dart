import 'dart:async';

import 'package:alkhatouna/core/extensions/padding_extensions.dart';
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
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class SliderForAds extends StatefulWidget {
  const SliderForAds({super.key});

  @override
  State<SliderForAds> createState() => _SliderForAdsState();
}

class _SliderForAdsState extends State<SliderForAds> {
  int _currentImageIndex = 0;
  // int currentIndex = 0;
  // final _controller = PageController();
  // Timer? _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   _startAutoScroll();
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel(); // Important: Cancel the timer to prevent memory leaks
  //   _controller.dispose();
  //   super.dispose();
  // }

  // void _startAutoScroll() {
  //   _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
  //     if (_controller.page == bannerLong - 1) {
  //       print("Slider reached the end, going back to the beginning.");
  //       _controller.animateToPage(
  //         0,
  //         duration: const Duration(milliseconds: 200),
  //         curve: Curves.easeIn,
  //       );
  //     } else {
  //       print("Current page: ${_controller.page}");
  //       _controller.nextPage(
  //         duration: const Duration(milliseconds: 200),
  //         curve: Curves.easeIn,
  //       );
  //     }
  //   });
  // }

  int bannerLong = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // if (state.homeInfo!.banners != null) {
        //   bannerLong = state.homeInfo!.banners!.length;
        // }
        return state.homeInfo!.banners == null
            ? SizedBox()
            : state.homeInfo!.banners?.length == 0
                ? SizedBox()
                : SizedBox(
                    // height: 230.h,
                    width: 1.sw,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.sp),
                              child: ExpandableCarousel(
                                options: ExpandableCarouselOptions(
                                  floatingIndicator: true,
                                  initialPage: 0,
                                  viewportFraction: 1,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  showIndicator: false,
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
                                                mode: LaunchMode
                                                    .externalApplication);
                                          } else {
                                            if (state.homeInfo!.banners![i]
                                                    .categoryId !=
                                                null) {
                                              AppConstant.customNavigation(
                                                  context,
                                                  CategoriesScreen(
                                                      categoryId: state
                                                          .homeInfo!
                                                          .banners![i]
                                                          .categoryId,
                                                      title: ""),
                                                  -1,
                                                  0);
                                            } else if (state.homeInfo!
                                                    .banners![i].brandId !=
                                                null) {
                                              AppConstant.customNavigation(
                                                  context,
                                                  BrandDetailsScreen(
                                                    brandId: state.homeInfo!
                                                        .banners![i].brandId,
                                                  ),
                                                  -1,
                                                  0);
                                            } else if (state.homeInfo!
                                                    .banners![i].productId !=
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
                                          imageUrl: state.homeInfo!.banners![i]
                                                  .imageUrl ??
                                              '',
                                          fit: BoxFit.fill,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
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
                            5.ph,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                // width: 1.sw,
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
                          ]),
                    ),
                  );

        // Column(
        //     children: [
        //       SizedBox(
        //         height: 238,
        //         child: PageView.builder(
        //           controller: _controller,
        //           itemCount: state.homeInfo!.banners!.length,
        //           onPageChanged: (value) {
        //             currentIndex = value;
        //             setState(() {});
        //           },
        //           itemBuilder: (context, index) {
        //             return Padding(
        //                 padding:
        //                     const EdgeInsets.symmetric(horizontal: 15),
        //                 child: ClipRRect(
        //                   borderRadius: BorderRadius.circular(25),
        //                   child: InkWell(
        //                     onTap: () => setState(() {
        //                       if (state.homeInfo!.banners![currentIndex]
        //                               .redirection_url !=
        //                           null) {
        //                         launchUrl(
        //                             Uri.parse(
        //                                 "${state.homeInfo!.banners![currentIndex].redirection_url}"),
        //                             mode:
        //                                 LaunchMode.externalApplication);
        //                       } else {
        //                         if (state
        //                                 .homeInfo!
        //                                 .banners![currentIndex]
        //                                 .categoryId !=
        //                             null) {
        //                           AppConstant.customNavigation(
        //                               context,
        //                               CategoriesScreen(
        //                                   categoryId: state
        //                                       .homeInfo!
        //                                       .banners![currentIndex]
        //                                       .categoryId,
        //                                   title: ""),
        //                               -1,
        //                               0);
        //                         } else if (state
        //                                 .homeInfo!
        //                                 .banners![currentIndex]
        //                                 .brandId !=
        //                             null) {
        //                           AppConstant.customNavigation(
        //                               context,
        //                               BrandDetailsScreen(
        //                                 brandId: state
        //                                     .homeInfo!
        //                                     .banners![currentIndex]
        //                                     .brandId,
        //                               ),
        //                               -1,
        //                               0);
        //                         } else if (state
        //                                 .homeInfo!
        //                                 .banners![currentIndex]
        //                                 .productId !=
        //                             null) {
        //                           AppConstant.customNavigation(
        //                               context,
        //                               ProductDetailsScreen(
        //                                 productId: state
        //                                     .homeInfo!
        //                                     .banners![currentIndex]
        //                                     .productId,
        //                               ),
        //                               -1,
        //                               0);
        //                         }
        //                       }
        //                     }),
        //                     child: CachedNetworkImage(
        //                       imageUrl: state
        //                               .homeInfo!
        //                               .banners![currentIndex]
        //                               .imageUrl ??
        //                           '',
        //                       fit: BoxFit.fill,
        //                       imageBuilder: (context, imageProvider) =>
        //                           Container(
        //                         decoration: BoxDecoration(
        //                           borderRadius:
        //                               BorderRadius.circular(15.r),
        //                           image: DecorationImage(
        //                             image: imageProvider,
        //                             fit: BoxFit.fill,
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ));
        //           },
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       SmoothPageIndicator(
        //         controller: _controller, // PageController
        //         count: state.homeInfo!.banners!.length,
        //         effect: WormEffect(
        //           dotWidth: 7,
        //           dotHeight: 7,
        //           spacing: 7,
        //           activeDotColor: AppColors.primaryColor,
        //           dotColor: Colors.grey,
        //         ), // your preferred effect
        //         onDotClicked: (index) {},
        //       ),
        //     ],
        //   );
      },
    );
  }
}
