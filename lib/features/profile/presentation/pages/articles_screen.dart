import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getArticles(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppConstant.customAppBar(
            context,
            "Articles",
            true,
            withTranslate: false,
            IconColor: AppColors.blackColor,
            backgroundColor: Colors.white,
            elvation: 0,
          ),
          body: state.loadingArticles
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0.sp),
                    child: Column(
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: Colors.black,
                                width: 1.sw,
                                height: 300.h,
                              ),
                            )),
                        20.ph,
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: Colors.black,
                                width: 1.sw,
                                height: 300.h,
                              ),
                            )),
                        20.ph,
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: Colors.black,
                                width: 1.sw,
                                height: 300.h,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              : state.articles == null
                  ? Center(
                      child: Column(
                      children: [
                        Lottie.asset('assets/images/empty_data.json'),
                        Text(
                          "Sorry, there are no articles.".tr(context),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                      ],
                    ))
                  : state.articles!.length == 0
                      ? Center(
                          child: Column(
                          children: [
                            Lottie.asset('assets/images/empty_data.json'),
                            Text(
                              "Sorry, there are no articles.".tr(context),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                          ],
                        ))
                      : ListView.builder(
                          itemCount: state.articles!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(15.sp),
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state.articles![index].title}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.sp),
                                  ),
                                  Text(
                                    "${state.articles![index].body}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      height: 300.h,
                                      initialPage: 0,
                                      // viewportFraction: 1,
                                      enableInfiniteScroll: false,
                                      reverse: false,
                                      autoPlay: false,
                                      autoPlayInterval:
                                          const Duration(seconds: 5),
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, reason) {},
                                    ),
                                    items: [
                                      for (int i = 0;
                                          i <
                                              state.articles![index].images!
                                                  .length;
                                          i++)
                                        CachedNetworkImage(
                                          imageUrl: state.articles![index]
                                                  .images![i].url ??
                                              '',
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
        );
      },
    );
  }
}
