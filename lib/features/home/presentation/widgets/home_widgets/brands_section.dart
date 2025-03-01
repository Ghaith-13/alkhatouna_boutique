import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/brand_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsSection extends StatefulWidget {
  const BrandsSection({super.key});

  @override
  State<BrandsSection> createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<BrandsSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, locale) {
            return Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                  width: 1.sw,
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.start,
                    children:
                        List.generate(state.homeInfo!.brands!.length, (index) {
                      double childWidth = (MediaQuery.of(context).size.width -
                              (12 * 3) -
                              30.sp) /
                          4;
                      return SizedBox(
                        width: childWidth,
                        child: FadeInUp(
                            child: GestureDetector(
                          onTap: () {
                            AppConstant.customNavigation(
                                context,
                                BrandDetailsScreen(
                                  brandId: state.homeInfo!.brands![index].id
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
                                      color: const Color.fromARGB(255, 0, 0, 0)
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
                                  imageUrl:
                                      state.homeInfo!.brands![index].logoUrl ??
                                          "",
                                  errorWidget: (context, name, imageProvider) =>
                                      Image.asset(
                                    "assets/images/logo-removebg-preview.png",

                                    // fit: BoxFit.fitWidth,
                                  ),
                                  imageBuilder: (context, imageProvider) =>
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
                                          color: Colors.grey.withOpacity(0.3),
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
                                  state.homeInfo!.brands![index].name ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )),
                      );
                    }),
                  )),
            );
            //     }),
            //   ),
            // );
            // GridView.count(
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   crossAxisCount: 4,
            //   crossAxisSpacing: 15,
            //   childAspectRatio: (1.0 / 1.8),
            //   mainAxisSpacing: 30,
            //   children: List.generate(state.homeInfo!.brands!.length, (index) {
            //     return FadeInUp(
            //         child: InkWell(
            //       onTap: () {
            //         AppConstant.customNavigation(
            //             context,
            //             BrandDetailsScreen(
            //               brandId: state.homeInfo!.brands![index].id.toString(),
            //             ),
            //             -1,
            //             0);
            //       },
            //       child: SingleChildScrollView(
            //         child: Column(
            //           children: [
            //             Container(
            //               // margin: EdgeInsetsDirectional.only(end: 10),
            //               // width: 60,
            //               // height: 110,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 shape: BoxShape.circle,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.grey.withOpacity(0.3),
            //                     blurRadius: 7.0,
            //                     spreadRadius: 1.0,
            //                   ),
            //                 ],
            //               ),
            //               child: Center(
            //                 child: SingleChildScrollView(
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Container(
            //                         decoration: BoxDecoration(
            //                           color: Colors.white,
            //                           shape: BoxShape.circle,
            //                           boxShadow: [
            //                             BoxShadow(
            //                               color:
            //                                   const Color.fromARGB(255, 0, 0, 0)
            //                                       .withOpacity(0.3),
            //                               blurRadius: 2.0,
            //                               spreadRadius: 1.0,
            //                             ),
            //                           ],
            //                         ),
            //                         child: CachedNetworkImage(
            //                           width: 90,
            //                           height: 90,
            //                           fit: BoxFit.scaleDown,
            //                           imageUrl: state.homeInfo!.brands![index]
            //                                   .logoUrl ??
            //                               "",
            //                           errorWidget:
            //                               (context, name, imageProvider) =>
            //                                   Container(
            //                             decoration: BoxDecoration(
            //                               borderRadius:
            //                                   BorderRadius.circular(15.r),
            //                               // image:
            //                             ),
            //                             child: Image.asset(
            //                               "assets/images/logo.jpg",
            //                               fit: BoxFit.scaleDown,
            //                             ),
            //                           ),
            //                           imageBuilder: (context, imageProvider) =>
            //                               Container(
            //                             padding:
            //                                 EdgeInsets.symmetric(vertical: 5),
            //                             width: 90,
            //                             height: 90,
            //                             decoration: BoxDecoration(
            //                               color: Colors.white,
            //                               shape: BoxShape.circle,
            //                               boxShadow: [
            //                                 BoxShadow(
            //                                   color:
            //                                       Colors.grey.withOpacity(0.3),
            //                                   blurRadius: 7.0,
            //                                   spreadRadius: 1.0,
            //                                 ),
            //                               ],
            //                               image: DecorationImage(
            //                                 image: imageProvider,
            //                                 fit: BoxFit.scaleDown,
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             5.verticalSpace,
            //             Text(
            //               state.homeInfo!.brands![index].name ?? "",
            //               // overflow: TextOverflow.fade,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                   fontSize: 12.sp, fontWeight: FontWeight.bold),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ));
            //   }),
            // );
          },
        );
      },
    );
  }
}
