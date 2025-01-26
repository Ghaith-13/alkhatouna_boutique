import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/brand_details_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/brands_skeleton.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getBrands(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, "Brands", true,
          IconColor: Colors.black),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.loadingBrands
              ? BrandsSkeleton()
              : BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(top: 12),
                          width: 1.sw,
                          child: Wrap(
                            spacing: 12.0,
                            runSpacing: 8.0,
                            alignment: WrapAlignment.start,
                            children: List.generate(
                              state.brandsData!.brands!.length,
                              (index) {
                                double childWidth =
                                    (MediaQuery.of(context).size.width -
                                            (12 * 3) -
                                            20) /
                                        4;

                                return SizedBox(
                                  width: childWidth,
                                  child: FadeInUp(
                                    child: InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context,
                                            BrandDetailsScreen(
                                              brandId: state
                                                  .brandsData!.brands![index].id
                                                  .toString(),
                                            ),
                                            -1,
                                            0);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(
                                                          255, 0, 0, 0)
                                                      .withOpacity(0.3),
                                                  blurRadius: 7.0,
                                                  spreadRadius: 1.0,
                                                ),
                                              ],
                                            ),
                                            child: CachedNetworkImage(
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.fill,
                                              imageUrl: state.brandsData!
                                                      .brands![index].logoUrl ??
                                                  "",
                                              errorWidget: (context, name,
                                                      imageProvider) =>
                                                  Image.asset(
                                                "assets/images/logo-removebg-preview.png",

                                                // fit: BoxFit.fitWidth,
                                              ),
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                // padding: EdgeInsets.symmetric(vertical: 5),
                                                // padding: EdgeInsets.all(5),

                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      blurRadius: 2.0,
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
                                          5.verticalSpace,
                                          SizedBox(
                                            width: 80,
                                            child: Text(
                                              state.brandsData!.brands![index]
                                                      .name ??
                                                  "",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
          // : Padding(
          //     padding: EdgeInsets.all(12.0.sp),
          //     child: GridView.count(
          //       padding: EdgeInsets.symmetric(vertical: 10),
          //       shrinkWrap: true,
          //       // physics: NeverScrollableScrollPhysics(),
          //       crossAxisCount: 4,
          //       crossAxisSpacing: 15,
          //       childAspectRatio: (1.0 / 1.8),
          //       mainAxisSpacing: 30,
          //       children: List.generate(state.brandsData!.brands!.length,
          //           (index) {
          //         return FadeInUp(
          //             child: InkWell(
          //           onTap: () {
          //             AppConstant.customNavigation(
          //                 context,
          //                 BrandDetailsScreen(
          //                   brandId: state.brandsData!.brands![index].id
          //                       .toString(),
          //                 ),
          //                 -1,
          //                 0);
          //           },
          //           child: SingleChildScrollView(
          //             child: Column(
          //               children: [
          //                 Container(
          //                   // margin: EdgeInsetsDirectional.only(end: 10),
          //                   // width: 60,
          //                   // height: 110,
          //                   decoration: BoxDecoration(
          //                     color: Colors.white,
          //                     shape: BoxShape.circle,
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.grey.withOpacity(0.3),
          //                         blurRadius: 7.0,
          //                         spreadRadius: 1.0,
          //                       ),
          //                     ],
          //                   ),
          //                   child: Center(
          //                     child: SingleChildScrollView(
          //                       child: Column(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.center,
          //                         children: [
          //                           Container(
          //                             decoration: BoxDecoration(
          //                               color: Colors.white,
          //                               shape: BoxShape.circle,
          //                               boxShadow: [
          //                                 BoxShadow(
          //                                   color: const Color.fromARGB(
          //                                           255, 0, 0, 0)
          //                                       .withOpacity(0.3),
          //                                   blurRadius: 2.0,
          //                                   spreadRadius: 1.0,
          //                                 ),
          //                               ],
          //                             ),
          //                             child: CachedNetworkImage(
          //                               width: 90,
          //                               height: 90,
          //                               fit: BoxFit.scaleDown,
          //                               imageUrl: state.brandsData!
          //                                       .brands![index].logoUrl ??
          //                                   "",
          //                               errorWidget: (context, name,
          //                                       imageProvider) =>
          //                                   Container(
          //                                 decoration: BoxDecoration(
          //                                   borderRadius:
          //                                       BorderRadius.circular(15.r),
          //                                   // image:
          //                                 ),
          //                                 child: Image.asset(
          //                                   "assets/images/logo.jpg",
          //                                   fit: BoxFit.scaleDown,
          //                                 ),
          //                               ),
          //                               imageBuilder:
          //                                   (context, imageProvider) =>
          //                                       Container(
          //                                 padding: EdgeInsets.symmetric(
          //                                     vertical: 5),
          //                                 width: 90,
          //                                 height: 90,
          //                                 decoration: BoxDecoration(
          //                                   color: Colors.white,
          //                                   shape: BoxShape.circle,
          //                                   boxShadow: [
          //                                     BoxShadow(
          //                                       color: Colors.grey
          //                                           .withOpacity(0.3),
          //                                       blurRadius: 7.0,
          //                                       spreadRadius: 1.0,
          //                                     ),
          //                                   ],
          //                                   image: DecorationImage(
          //                                     image: imageProvider,
          //                                     fit: BoxFit.scaleDown,
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 5.verticalSpace,
          //                 Text(
          //                   state.brandsData!.brands![index].name ?? "",
          //                   // overflow: TextOverflow.fade,
          //                   textAlign: TextAlign.center,
          //                   style: TextStyle(
          //                       fontSize: 12.sp,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ));
          //       }),
          //     ),
          //   );
        },
      ),
    );
  }
}
