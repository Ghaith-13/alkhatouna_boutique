import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/core/utils/http_helper.dart';
import 'package:alkhatouna/features/all_products/presentation/pages/all_products_screen.dart';
import 'package:alkhatouna/features/auth/presentation/pages/log_in_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/notifications_screen.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/features/profile/presentation/pages/about_us.dart';
import 'package:alkhatouna/features/profile/presentation/pages/articles_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/contact_us.dart';
import 'package:alkhatouna/features/profile/presentation/pages/faq_questions.dart';
import 'package:alkhatouna/features/profile/presentation/pages/my_points_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/profile_skeleton.dart';
import 'package:alkhatouna/features/profile/presentation/pages/terms_and_conditions_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/tutorials_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/wallet_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/cart/presentation/pages/shipping_addresses_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/orders_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/settings_screen.dart';
import 'package:alkhatouna/features/profile/presentation/widgets/profile_widgets/on_option_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../injection_container.dart' as di;
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String email = "";
  @override
  void initState() {
    super.initState();
    checkIfGuest();
  }

  bool loadingToken = false;
  String? token;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });
    token = await CacheHelper.getData(key: "USER_TOKEN");
    // print(token);
    if (token != null) {
      setState(() {
        email = CacheHelper.getData(key: "EMAIL") ?? "";
        name = CacheHelper.getData(key: "NAME") ?? "";
      });
      context
          .read<ProfileCubit>()
          .changebirthdate(CacheHelper.getData(key: "Birthdate") ?? "");

      context.read<ProfileCubit>().getuserInfo(context);
    }
    setState(() {
      loadingToken = false;
    });
  }

  Future<void> refreshProfilepage() async {
    context.read<ProfileCubit>().refreshProfileScreen();
    checkIfGuest();
    // print("Ghaith");
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime tenYearsAgo = DateTime(now.year - 10, now.month, now.day);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: tenYearsAgo
          .subtract(const Duration(days: 1)), // Start just before 10 years ago
      firstDate: DateTime(1900), // Or some other very early date
      lastDate: tenYearsAgo.subtract(const Duration(days: 1)),
    );
    if (pickedDate != null) {
      String dateOnly = DateFormat('yyyy-MM-dd').format(pickedDate);
      bool? confirmed = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Confirm Date'.tr(context)),
            content: Text(
                '${"Are you sure you want to select".tr(context)} $dateOnly '),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), // User cancels
                child: Text(
                  'No'.tr(context),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // User confirms
                child: Text('Yes'.tr(context),
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          );
        },
      );
      if (confirmed == true) {
        context.read<ProfileCubit>().updateBirthday(context, dateOnly);
      }
      // setState(() {
      //   birthdate = dateOnly;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          loadingToken ? SizedBox() : AppConstant.CustomDrawer(context, token),
      appBar: AppConstant.customAppBar(
        context,
        "",
        false,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
      ),
      body: loadingToken
          ? SizedBox()
          : token == null
              ? Padding(
                  padding: EdgeInsets.all(12.0.sp),
                  child: Column(
                    children: [
                      Lottie.asset('assets/images/log_in.json'),
                      Text(
                        "Log in to enjoy these features.".tr(context),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                      ),
                      10.ph,
                      AppConstant.customElvatedButton(context, "Login", () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()),
                          (Route route) => false,
                        );
                      },
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              : BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return state.loaidngProfile
                        ? ProfileSkeleton()
                        : RefreshIndicator(
                            color: AppColors.primaryColor,
                            backgroundColor: Colors.white,
                            strokeWidth: 3.0,
                            displacement: 40.0,
                            edgeOffset: 0.0,
                            triggerMode: RefreshIndicatorTriggerMode.onEdge,
                            onRefresh: refreshProfilepage,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Profile Page".tr(context),
                                      style: TextStyle(
                                          fontSize: 34.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.blackColor),
                                    ),
                                    FadeInDown(
                                      child: Row(
                                        children: [
                                          // ClipOval(
                                          //   child: Image.asset(
                                          //     "assets/images/profile.png",
                                          //     fit: BoxFit.fill,
                                          //     width: 64.sp,
                                          //     height: 64.sp,
                                          //   ),
                                          // ),
                                          // 20.pw,

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Hi".tr(context),
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .primaryColor,
                                                        fontSize: 26.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  15.pw,
                                                  Text(
                                                    "$name",
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors
                                                            .blackColor),
                                                  ),
                                                ],
                                              ),
                                              5.ph,
                                              state.userInfo!.phone == null
                                                  ? SizedBox()
                                                  : state.userInfo!.phone
                                                          .isEmpty
                                                      ? SizedBox()
                                                      : Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.call,
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            15.pw,
                                                            // Text("phone number Profile"
                                                            //     .tr(context)),
                                                            Text(
                                                              state.userInfo!
                                                                  .phone,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColors
                                                                      .greyColor),
                                                            ),
                                                          ],
                                                        ),
                                              // Row(
                                              //   crossAxisAlignment:
                                              //       CrossAxisAlignment.center,
                                              //   children: [
                                              //     Icon(
                                              //       Icons.email,
                                              //       color:
                                              //           AppColors.primaryColor,
                                              //     ),
                                              //     15.pw,
                                              //     Text(
                                              //       "$email",
                                              //       style: TextStyle(
                                              //           fontSize: 14.sp,
                                              //           fontWeight:
                                              //               FontWeight.w500,
                                              //           color: AppColors
                                              //               .greyColor),
                                              //     ),
                                              //   ],
                                              // ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.cake,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                  15.pw,
                                                  state.birthdate!.isEmpty
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            _selectDateTime(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Enter your birthday"
                                                                .tr(context),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      : Text(
                                                          "${state.birthdate!}",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .greyColor),
                                                        ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    10.ph,
                                    Divider(
                                      thickness: 0.5,
                                    ),
                                    10.ph,
                                    InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context, OrdersScreen(), -1, 0);
                                      },
                                      child: FadeInRight(
                                        child: OnOptionWidget(
                                            title: "My Orders",
                                            subTitle:
                                                "${"Already have".tr(context)} 12 ${"orders".tr(context)}"),
                                      ),
                                    ),
                                    40.ph,
                                    InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context, MyPointsScreen(), -1, 0);
                                      },
                                      child: FadeInRight(
                                        child: OnOptionWidget(
                                            title: "Points records",
                                            subTitle:
                                                "${"Already have".tr(context)} 12 ${"orders".tr(context)}"),
                                      ),
                                    ),
                                    40.ph,
                                    FadeInRight(
                                      child: InkWell(
                                        onTap: () {
                                          AppConstant.customNavigation(context,
                                              ShippingAddressesScreen(), -1, 0);
                                        },
                                        child: OnOptionWidget(
                                            title: "Shipping addresses",
                                            subTitle:
                                                "3 ${"address".tr(context)}"),
                                      ),
                                    ),
                                    40.ph,

                                    FadeInRight(
                                        child: InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(context,
                                            NotificationsScreen(), -1, 0);
                                      },
                                      child: OnOptionWidget(
                                          title: "Notifications", subTitle: ""),
                                    )),
                                    state.userInfo?.isBlogger == "0"
                                        ? SizedBox()
                                        : 40.ph,
                                    state.userInfo?.isBlogger == "0"
                                        ? SizedBox()
                                        : InkWell(
                                            onTap: () {
                                              AppConstant.customNavigation(
                                                  context,
                                                  WalletScreen(),
                                                  -1,
                                                  0);
                                            },
                                            child: FadeInRight(
                                              child: OnOptionWidget(
                                                  title: "Wallet",
                                                  subTitle:
                                                      "Profits".tr(context)),
                                            ),
                                          ),
                                    // 40.ph,
                                    // FadeInRight(
                                    //     child: InkWell(
                                    //   onTap: () {
                                    //     AppConstant.customNavigation(
                                    //         context, PaymentMethods(), -1, 0);
                                    //   },
                                    //   child: OnOptionWidget(
                                    //       title: "payment methods",
                                    //       subTitle: "subTitle"),
                                    // )),
                                    // 40.ph,

                                    // FadeInRight(
                                    //     child: InkWell(
                                    //   onTap: () {
                                    //     AppConstant.customNavigation(
                                    //         context, ArticlesScreen(), -1, 0);
                                    //   },
                                    //   child: OnOptionWidget(
                                    //       title: "Articles", subTitle: ""),
                                    // )),
                                    40.ph,

                                    FadeInRight(
                                        child: InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context,
                                            AllProductsScreen(
                                              type: "notified_products",
                                            ),
                                            -1,
                                            0);
                                      },
                                      child: OnOptionWidget(
                                          title: "notified_products",
                                          subTitle: ""),
                                    )),

                                    10.ph,

                                    Divider(
                                      thickness: 0.5,
                                    ),
                                    10.ph,
                                    InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context, SettingsScreen(), -1, 0);
                                      },
                                      child: FadeInRight(
                                        child: OnOptionWidget(
                                            title: "Settings",
                                            subTitle: "Notifications, password"
                                                .tr(context)),
                                      ),
                                    ),
                                    40.ph,
                                    // FadeInRight(
                                    //     child: InkWell(
                                    //   onTap: () {
                                    //     AppConstant.customNavigation(context,
                                    //         FaqQuestionsScreen(), -1, 0);
                                    //   },
                                    //   child: OnOptionWidget(
                                    //       title: "Frequently Asked Questions",
                                    //       subTitle: ""),
                                    // )),

                                    FadeInRight(
                                        child: InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context, TutorialsScreen(), -1, 0);
                                      },
                                      child: OnOptionWidget(
                                          title: "Tutorials videos",
                                          subTitle: ""),
                                    )),
                                    // 40.ph,
                                    // FadeInRight(
                                    //   child: OnOptionWidget(
                                    //       title: "Discount code",
                                    //       subTitle: "You have special promocodes"
                                    //           .tr(context)),
                                    // ),
                                    // 40.ph,
                                    // FadeInRight(
                                    //   child: OnOptionWidget(
                                    //       title: "Ratings",
                                    //       subTitle:
                                    //           "${"Reviews for".tr(context)} 14 ${"items".tr(context)}"),
                                    // ),
                                    40.ph,

                                    InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context, ContactUsScreen(), -1, 0);
                                      },
                                      child: FadeInRight(
                                        child: OnOptionWidget(
                                            title: "Contact Us",
                                            subTitle: "Notifications, password"
                                                .tr(context)),
                                      ),
                                    ),
                                    40.ph,
                                    InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context, AboutUsScreen(), -1, 0);
                                      },
                                      child: FadeInRight(
                                        child: OnOptionWidget(
                                            title: "About us",
                                            subTitle: "Notifications, password"
                                                .tr(context)),
                                      ),
                                    ),
                                    40.ph,
                                    InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(context,
                                            TermsAndConditionsScreen(), -1, 0);
                                      },
                                      child: FadeInRight(
                                        child: OnOptionWidget(
                                            title: "Terms and conditions",
                                            subTitle: "Notifications, password"
                                                .tr(context)),
                                      ),
                                    ),
                                    40.ph,
                                    InkWell(
                                      onTap: () async {
                                        GoogleSignIn googleSignIn =
                                            GoogleSignIn();
                                        googleSignIn.disconnect();
                                        SharedPreferences preferences =
                                            await SharedPreferences
                                                .getInstance();
                                        await preferences.clear();
                                        di.sl<ApiBaseHelper>().updateHeader();

                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LogInScreen()),
                                          (Route route) => false,
                                        );
                                      },
                                      child: FadeInRight(
                                          child: Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Log out".tr(context),
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .blackColor),
                                                    ),
                                                  ]),
                                              Icon(
                                                Icons.logout_outlined,
                                                color: AppColors.greyColor,
                                                size: 24.sp,
                                              )
                                            ]),
                                      )),
                                    ),
                                    40.ph,
                                    BlocBuilder<ProfileCubit, ProfileState>(
                                      builder: (context, state) {
                                        return AppConstant.customElvatedButton(
                                            context, "Delete Account",
                                            () async {
                                          if (state.laodingfeedback) {
                                          } else {
                                            bool confirmed =
                                                await showConfirmationDialog(
                                                    context);
                                            if (confirmed) {
                                              // Proceed with the action
                                              context
                                                  .read<ProfileCubit>()
                                                  .deleteAccount(context);
                                            } else {}
                                          }
                                        },
                                            style:
                                                TextStyle(color: Colors.white),
                                            loading: state.laodingfeedback
                                                ? true
                                                : false);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                  },
                ),
    );
  }
}

Future<bool> showConfirmationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Confirmation'.tr(context)),
      content: Text('Are you sure you want to proceed?'.tr(context)),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'.tr(context), style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'.tr(context), style: TextStyle(color: Colors.black)),
        ),
      ],
    ),
  );
}
