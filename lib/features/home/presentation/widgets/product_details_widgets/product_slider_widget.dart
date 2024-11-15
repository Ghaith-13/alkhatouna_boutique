import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/product_details_widgets/video_player_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ProductSliderWidget extends StatefulWidget {
  const ProductSliderWidget({super.key});

  @override
  State<ProductSliderWidget> createState() => _ProductSliderWidgetState();
}

class _ProductSliderWidgetState extends State<ProductSliderWidget> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.productData!.product!.attachments == null
            ? SizedBox()
            : Column(
                children: [
                  Stack(children: [
                    FlutterCarousel(
                      options: FlutterCarouselOptions(
                        height: 413.h,
                        initialPage: 0,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        reverse: false,
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
                            i < state.productData!.product!.attachments!.length;
                            i++)
                          state.productData!.product!.attachments![i].type ==
                                  "image"
                              ? WidgetZoom(
                                  heroAnimationTag: 'tag$i',
                                  zoomWidget: CachedNetworkImage(
                                    width: 1.sw,
                                    fit: BoxFit.scaleDown,
                                    imageUrl: state.productData!.product!
                                            .attachments![i].imageUrl ??
                                        '',
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      "assets/images/logo.jpg",
                                      fit: BoxFit.scaleDown,
                                    ),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : VideoPlayerWidget(
                                  path: state.productData!.product!
                                          .attachments![i].imageUrl ??
                                      '',
                                )
                      ],
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
                                  i <
                                      state.productData!.product!.attachments!
                                          .length;
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
                ],
              );
      },
    );
  }
}
