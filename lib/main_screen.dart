// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/all_products/presentation/pages/all_products_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/product_details_screen.dart';
import 'package:alkhatouna/main.dart';
import 'package:alkhatouna/services/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/cart/presentation/pages/cart_screen.dart';
import 'package:alkhatouna/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/home.dart';
import 'package:alkhatouna/features/profile/presentation/pages/profile_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:uni_links/uni_links.dart';

class mainScreen extends StatefulWidget {
  final int? navigateIndex;
  const mainScreen({super.key, this.navigateIndex});

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
    final Uri? uri = await getInitialUri();
    if (uri != null) {
      getproductIdFromUri(uri);
    }
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        getproductIdFromUri(uri);
      }
    });
  }

  String refcode = "";

  getproductIdFromUri(Uri uri) {
    refcode = uri.queryParameters['id'] ?? "";
    if (refcode != "") {
      AppConstant.customNavigation(
          context, ProductDetailsScreen(productId: refcode), -1, 0);
    }
  }

  @override
  void initState() {
    super.initState();
    localNotificationService();
    deeplinkHandling();
    if (widget.navigateIndex != null) {
      setState(() {
        myIndex = widget.navigateIndex!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[myIndex],
        bottomNavigationBar: Container(
            height: 83.h,
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
                unselectedLabelStyle: TextStyle(fontSize: 10.sp),
                selectedItemColor: AppColors.primaryColor,
                selectedIconTheme:
                    IconThemeData(size: 30, color: AppColors.primaryColor),
                selectedLabelStyle: TextStyle(
                  fontSize: 10.sp,
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
                      width: 30.sp,
                      color: myIndex == 0
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                      height: 30.sp,
                    ),
                    label: "Home".tr(context),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/make_up_icon.png',
                      width: 30.sp,
                      color: myIndex == 1
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                      height: 30.sp,
                    ),
                    label: "All Products".tr(context),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/basket.svg",
                      width: 30.sp,
                      height: 30.sp,
                      color: myIndex == 2 ? AppColors.primaryColor : null,
                    ),
                    label: "Cart".tr(context),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/favorite.svg",
                      width: 30.sp,
                      height: 30.sp,
                      color: myIndex == 3 ? AppColors.primaryColor : null,
                    ),
                    label: "Favorite".tr(context),
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/profile.svg",
                        width: 30.sp,
                        height: 30.sp,
                        color: myIndex == 4 ? AppColors.primaryColor : null,
                      ),
                      label: "My Account".tr(context)),
                ],
              ),
            )));
  }
}
