// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:alkhatouna/bloc_provider.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/all_products/presentation/pages/all_products_screen.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/main.dart';
import 'package:alkhatouna/services/local_notification_service.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/cart/presentation/pages/cart_screen.dart';
import 'package:alkhatouna/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/home.dart';
import 'package:alkhatouna/features/profile/presentation/pages/profile_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:upgrader/upgrader.dart';

class mainScreen extends StatefulWidget {
  final int? navigateIndex;
  final bool refresheveyThing;
  const mainScreen(
      {super.key, this.navigateIndex, required this.refresheveyThing});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

ScrollController scrollController = new ScrollController();

class _mainScreenState extends State<mainScreen> {
  final notificationService = LocalNotificationService();

  Future localNotificationService() async {
    await LocalNotificationService().initialize();

    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
  }

  int myIndex = 0;

  List<Widget> screens = [
    HomeScreen(scrollController: scrollController),
    AllProductsScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  Future deeplinkHandling() async {
    final AppLinks? appLinks = await AppLinks();
    // print(appLinks);
    // print("-1");

    // print(appLinks!.getInitialLink());
    // print("0");
    // print(appLinks.getInitialLinkString().asStream());
    // print("1");

    // print(appLinks.getLatestLink().asStream());
    // print("2");

    // print(appLinks.getLatestLinkString());
    // if (appLinks != null) {
    //   getproductIdFromUri(appLinks);
    // }
    appLinks?.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        getproductIdFromUri(uri);
      }
    });
  }

  String refcode = "";
  String plogcode = "";

  /// ✅ Function to subscribe to "all_users" topic
  Future<void> subscribeToTopic() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    try {
      await messaging.subscribeToTopic("all-users");
      // print("✅ Successfully subscribed to 'all-users' topic");
    } catch (e) {
      // print("❌ Error subscribing to topic: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.refresheveyThing) {
      context.read<HomeCubit>().RefreshHomePage();
      context.read<ProfileCubit>().refreshProfileScreen();
    }
    subscribeToTopic();

    localNotificationService();
    deeplinkHandling();
    if (widget.navigateIndex != null) {
      setState(() {
        myIndex = widget.navigateIndex!;
      });
    }
  }

  getproductIdFromUri(Uri uri) {
    refcode = uri.queryParameters['id'] ?? "";
    // plogcode = uri.queryParameters['plogid'] ?? "";
    // refcode = uri.getInitialLink().queryParameters['id'] ?? "";
    // refcode = uri.getInitialLink() as String;
    // print(refcode);
    if (refcode != "") {
      AppConstant.customNavigation(
          context, ProductDetailsScreen(productId: refcode), -1, 0);
    }
    // if (plogcode != "") {
    //   context
    //       .read<HomeCubit>()
    //       .getblogSection(context, plogcode, fromDeepLink: true);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: Scaffold(
          body: screens[myIndex],
          bottomNavigationBar: Container(
              // height: 70.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.sp),
                    topLeft: Radius.circular(12.sp)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  unselectedLabelStyle: TextStyle(fontSize: 8.sp),
                  selectedItemColor: AppColors.primaryColor,
                  selectedIconTheme:
                      IconThemeData(size: 27.sp, color: AppColors.primaryColor),
                  selectedLabelStyle: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedItemColor: Colors.black54,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    if (index == 0 && myIndex == 0) {
                      scrollController.animateTo(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn);
                    }
                    setState(() {
                      myIndex = index;
                    });
                  },
                  currentIndex: myIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/home.svg',
                        width: 27.sp,
                        color: myIndex == 0
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                        height: 27.sp,
                      ),
                      label: "Home".tr(context),
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/make_up_icon.png',
                        width: 27.sp,
                        color: myIndex == 1
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                        height: 27.sp,
                      ),
                      label: "All Products".tr(context),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/basket.svg",
                        width: 27.sp,
                        height: 27.sp,
                        color: myIndex == 2 ? AppColors.primaryColor : null,
                      ),
                      label: "Cart".tr(context),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/favorite.svg",
                        width: 27.sp,
                        height: 27.sp,
                        color: myIndex == 3 ? AppColors.primaryColor : null,
                      ),
                      label: "Favorite".tr(context),
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/icons/profile.svg",
                          width: 27.sp,
                          height: 27.sp,
                          color: myIndex == 4 ? AppColors.primaryColor : null,
                        ),
                        label: "My Account".tr(context)),
                  ],
                ),
              ))),
    );
  }
}
