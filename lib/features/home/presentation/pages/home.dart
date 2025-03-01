// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/all_products/presentation/pages/all_products_screen.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/brands_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/home_search_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/home_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/pages/notifications_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/user_categories_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/zain_cash.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/brands_section.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/most_selling_product.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/new_arrival_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/offers_section.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/on_tiktok_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/small_slider_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/with_qouta_widget.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/sections_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/slider_widget.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  ScrollController scrollController;
  HomeScreen({super.key, required this.scrollController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHomeInfo(context);
    context.read<HomeCubit>().getSideBarSections(context);

    checkIfGuest();
  }

  bool loadingToken = false;
  String? token;
  String? phoneNumber;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });
    token = await CacheHelper.getData(key: "USER_TOKEN");
    phoneNumber = await CacheHelper.getData(key: "Phone_Number");
    // print(token);
    setState(() {
      loadingToken = false;
    });
    if (token != null) {
      // context.read<ProfileCubit>().getuserInfo(context);

      context.read<ProfileCubit>().getuserInfo(context);
    }
  }

  Future<void> dothisfin() async {
    context.read<HomeCubit>().RefreshHomePage();
    context.read<HomeCubit>().getHomeInfo(context);
    context.read<HomeCubit>().getSideBarSections(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        actions: [
          token != null
              ? GestureDetector(
                  onTap: () {
                    AppConstant.customNavigation(
                        context, NotificationsScreen(), -1, 0);
                  },
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                )
              : SizedBox(),
          10.pw,
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20.w),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.homeInfo == null
                    ? SizedBox()
                    : InkWell(
                        onTap: () async {
                          String number = state.homeInfo!.phone_number ?? "";

                          if (number.startsWith("07")) {
                            number.replaceFirst("0", "+964");
                            String newNumber = "+964";

                            for (int i = 1; i < number.length; i++) {
                              newNumber = newNumber + number[i];
                            }
                            number = newNumber;
                          }
                          // print(number);
                          String url =
                              Uri.encodeFull('https://wa.me/${number}');
                          await canLaunch(url)
                              ? launch(url)
                              : print('WhatsApp not installed');
                        },
                        child: Image.asset(
                          "assets/images/WhatsApp_icon.png",
                          width: 40,
                          height: 40,
                        ),
                      );
              },
            ),
          ),
        ],
      ),
      drawer:
          loadingToken ? SizedBox() : AppConstant.CustomDrawer(context, token),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: dothisfin,
        color: AppColors.primaryColor,
        backgroundColor: Colors.white,
        strokeWidth: 3.0,
        displacement: 40.0,
        edgeOffset: 0.0,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: SafeArea(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.loading
                    ? HomeSkeleton()
                    : state.homeInfo == null
                        ? HomeSkeleton()
                        : Column(
                            children: [
                              token == null
                                  ? SizedBox()
                                  : Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.sp),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.greyColor,
                                            width: 0.5),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                  // start: 20.sp,
                                                  end: 5.sp,
                                                ),
                                                child: BlocBuilder<LocaleCubit,
                                                    LocaleState>(
                                                  builder: (context, locale) {
                                                    return InkWell(
                                                      onTap: () {
                                                        AppConstant
                                                            .customNavigation(
                                                                context,
                                                                UserCategoriesScreen(),
                                                                -1,
                                                                0);
                                                      },
                                                      child: Text(
                                                        "${locale.locale.languageCode == "en" ? state.homeInfo?.userCategoryData?.currentCategoryEn : locale.locale.languageCode == "ar" ? state.homeInfo?.userCategoryData?.currentCategoryAr : state.homeInfo?.userCategoryData?.currentCategoryKu}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors
                                                                .primaryColor,
                                                            fontSize: 20.sp),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              // InkWell(
                                              //     onTap: () {

                                              //     },
                                              //     child: Padding(
                                              //       padding: const EdgeInsets
                                              //           .symmetric(
                                              //           horizontal: 0),
                                              //       child: Icon(
                                              //         Icons.info_rounded,
                                              //         color: AppColors
                                              //             .primaryColor,
                                              //         size: 25,
                                              //       ),
                                              //     )),
                                            ],
                                          ),
                                          5.ph,
                                          token == null
                                              ? SizedBox()
                                              : Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 0.sp),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                          width: 0.5.sw,
                                                          child:
                                                              LinearProgressBar(
                                                            maxSteps: state
                                                                    .homeInfo!
                                                                    .userCategoryData!
                                                                    .ordersNeeded! +
                                                                state
                                                                    .homeInfo!
                                                                    .userCategoryData!
                                                                    .completedOrdersCount!,
                                                            progressType:
                                                                LinearProgressBar
                                                                    .progressTypeLinear,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            currentStep: state
                                                                .homeInfo!
                                                                .userCategoryData!
                                                                .completedOrdersCount,
                                                            progressColor:
                                                                AppColors
                                                                    .primaryColor,
                                                            backgroundColor:
                                                                const Color
                                                                    .fromARGB(
                                                                    104,
                                                                    158,
                                                                    158,
                                                                    158),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                          5.ph,
                                          token == null
                                              ? SizedBox()
                                              : Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 0.sp),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: BlocBuilder<
                                                            LocaleCubit,
                                                            LocaleState>(
                                                          builder: (context,
                                                              locale) {
                                                            return Text(
                                                              "${locale.locale.languageCode == "en" ? state.homeInfo?.userCategoryData?.messageEn : locale.locale.languageCode == "ar" ? state.homeInfo?.userCategoryData?.messageAr : state.homeInfo?.userCategoryData?.messageKu}",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      12.sp),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                              token == null ? SizedBox() : 20.ph,
                              SizedBox(
                                  width: 0.9.sw,
                                  child: TextField(
                                    textInputAction: TextInputAction.search,
                                    onSubmitted: (value) {
                                      if (value.isNotEmpty) {
                                        context
                                            .read<HomeCubit>()
                                            .getFullSearch(context, value);
                                        AppConstant.customNavigation(
                                            context, HomeSearchScreen(), 1, 0);
                                      }
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: AppColors.primaryColor,
                                      ),
                                      filled: false,
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width:
                                              2.0, // Adjust the border width as needed
                                        ),
                                      ),
                                      hintStyle: TextStyle(
                                          color: AppColors.primaryColor),
                                      hintText:
                                          "Find what you want".tr(context),
                                    ),
                                  )),
                              state.homeInfo!.topBanners == null
                                  ? SizedBox()
                                  : state.homeInfo!.topBanners!.isEmpty
                                      ? SizedBox()
                                      : SmallSliderWidget(),
                              10.ph,
                              state.homeInfo!.banners == null
                                  ? SizedBox()
                                  : state.homeInfo!.banners!.isEmpty
                                      ? SizedBox()
                                      : SliderForAds(),
                              10.ph,
                              Padding(
                                padding: EdgeInsets.all(15.0.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sections".tr(context),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24.sp),
                                        ),
                                        // Zasin()
                                      ],
                                    ),
                                    SectionsWidget(),
                                    20.verticalSpace,
                                    state.homeInfo!.brands == null
                                        ? SizedBox()
                                        : state.homeInfo!.brands!.isEmpty
                                            ? SizedBox()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                    Text(
                                                      "Brands".tr(context),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 24.sp),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        AppConstant
                                                            .customNavigation(
                                                                context,
                                                                BrandsScreen(),
                                                                -1,
                                                                0);
                                                      },
                                                      child: Text(
                                                        "See more".tr(context),
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .primaryColor),
                                                      ),
                                                    )
                                                  ]),
                                    state.homeInfo!.brands == null
                                        ? SizedBox()
                                        : state.homeInfo!.brands!.isEmpty
                                            ? SizedBox()
                                            : BrandsSection(),
                                    20.verticalSpace,
                                    state.homeInfo!.bestSellingProducts == null
                                        ? SizedBox()
                                        : state.homeInfo!.bestSellingProducts!
                                                .isEmpty
                                            ? SizedBox()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Most Selling Products"
                                                        .tr(context),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24.sp),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      AppConstant
                                                          .customNavigation(
                                                              context,
                                                              AllProductsScreen(
                                                                type:
                                                                    "best-selling",
                                                              ),
                                                              -1,
                                                              0);
                                                    },
                                                    child: Text(
                                                      "See more".tr(context),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  )
                                                ],
                                              ),
                                    state.homeInfo!.bestSellingProducts == null
                                        ? SizedBox()
                                        : state.homeInfo!.bestSellingProducts!
                                                .isEmpty
                                            ? SizedBox()
                                            : MostSellingProduct(),
                                    20.verticalSpace,
                                    state.homeInfo!.discountedProducts == null
                                        ? SizedBox()
                                        : state.homeInfo!.discountedProducts!
                                                .isEmpty
                                            ? SizedBox()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Offers".tr(context),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24.sp),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      AppConstant
                                                          .customNavigation(
                                                              context,
                                                              AllProductsScreen(
                                                                type:
                                                                    "discounted",
                                                              ),
                                                              -1,
                                                              0);
                                                    },
                                                    child: Text(
                                                      "See more".tr(context),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  )
                                                ],
                                              ),
                                    state.homeInfo!.discountedProducts == null
                                        ? SizedBox()
                                        : state.homeInfo!.discountedProducts!
                                                .isEmpty
                                            ? SizedBox()
                                            : OffersSection(),
                                    20.verticalSpace,
                                    state.homeInfo!.new_arrival == null
                                        ? SizedBox()
                                        : state.homeInfo!.new_arrival!.isEmpty
                                            ? SizedBox()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "New arrival".tr(context),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24.sp),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      AppConstant
                                                          .customNavigation(
                                                              context,
                                                              AllProductsScreen(
                                                                type:
                                                                    "new-arrival",
                                                              ),
                                                              -1,
                                                              0);
                                                    },
                                                    child: Text(
                                                      "See more".tr(context),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  )
                                                ],
                                              ),
                                    state.homeInfo!.new_arrival == null
                                        ? SizedBox()
                                        : state.homeInfo!.new_arrival!.isEmpty
                                            ? SizedBox()
                                            : NewArrivalWidget(),
                                    20.verticalSpace,
                                    state.homeInfo!.on_tiktok == null
                                        ? SizedBox()
                                        : state.homeInfo!.on_tiktok!.isEmpty
                                            ? SizedBox()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "On Tiktok".tr(context),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24.sp),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      AppConstant
                                                          .customNavigation(
                                                              context,
                                                              AllProductsScreen(
                                                                type:
                                                                    "on-tiktok",
                                                              ),
                                                              -1,
                                                              0);
                                                    },
                                                    child: Text(
                                                      "See more".tr(context),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  )
                                                ],
                                              ),
                                    state.homeInfo!.on_tiktok == null
                                        ? SizedBox()
                                        : state.homeInfo!.on_tiktok!.isEmpty
                                            ? SizedBox()
                                            : OnTiktokWidget(),
                                    20.verticalSpace,
                                    state.homeInfo!.with_qouta == null
                                        ? SizedBox()
                                        : state.homeInfo!.with_qouta!.isEmpty
                                            ? SizedBox()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "With Qouta".tr(context),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24.sp),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      AppConstant
                                                          .customNavigation(
                                                              context,
                                                              AllProductsScreen(
                                                                type:
                                                                    "with-qouta",
                                                              ),
                                                              -1,
                                                              0);
                                                    },
                                                    child: Text(
                                                      "See more".tr(context),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  )
                                                ],
                                              ),
                                    state.homeInfo!.with_qouta == null
                                        ? SizedBox()
                                        : state.homeInfo!.with_qouta!.isEmpty
                                            ? SizedBox()
                                            : WithQoutaWidget(),
                                  ],
                                ),
                              ),
                            ],
                          );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// class Zasin extends StatefulWidget {
//   const Zasin({super.key});

//   @override
//   State<Zasin> createState() => _ZasinState();
// }

// class _ZasinState extends State<Zasin> {
//   Widget _zaincash = Container();
//   String paymentState = '';

//   final TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     /**
//      * to listen for the state of the transaction, it returns a json objects you can fetch like state['success']
//      */
//     ZaincashService.paymentStateListener.listen((state) {
//       setState(() {
//         paymentState = state.toString();
//       });
//     });
//   }

//   void _triggerPayment() {
//     setState(() {
//       _zaincash = Container(
//           child: new ZainCash(
//               transactionId: _controller.text,
//               production: false,
//               closeOnSuccess: true,
//               closeOnError: true));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Ghaith"),
//       ),
//       body: Center(
//         child: Stack(
//           children: <Widget>[
//             Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: TextFormField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: 'Enter the transaction id'),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text('Payment listener state ' + paymentState),
//               ],
//             ),
//             _zaincash,
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _triggerPayment,
//         tooltip: 'Pay',
//         child: Icon(Icons.payment),
//       ),
//     );
//     // InkWell(
//     //     onTap: () {
//     //       // ZaincashService.paymentStateListener
//     //       //     .listen((state) {
//     //       //   print("Done");
//     //       // });
//     //       ZainCash(
//     //           transactionId: "61b3976de65fb79d1b5ffc3c",
//     //           production: false,
//     //           closeOnSuccess: true,
//     //           closeOnError: true);
//     //       // showFlexibleBottomSheet(
//     //       //   bottomSheetColor:
//     //       //       AppColors.whiteColor,
//     //       //   barrierColor:
//     //       //       Color.fromARGB(94, 83, 83, 83),
//     //       //   bottomSheetBorderRadius:
//     //       //       BorderRadius.only(
//     //       //           topLeft:
//     //       //               Radius.circular(40.sp),
//     //       //           topRight:
//     //       //               Radius.circular(40.sp)),
//     //       //   minHeight: 0,
//     //       //   initHeight: 0.3,
//     //       //   maxHeight: 0.3,
//     //       //   anchors: [0, 0.3],
//     //       //   isSafeArea: true,
//     //       //   context: context,
//     //       //   builder: sortingSectionsBottomSheet,
//     //       // );
//     //     },
//     //     child: Icon(Icons.filter_list_outlined));
//   }
// }
