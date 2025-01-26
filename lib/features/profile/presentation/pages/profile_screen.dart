import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/core/utils/http_helper.dart';
import 'package:alkhatouna/features/auth/presentation/pages/log_in_screen.dart';
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
        name = CacheHelper.getData(key: "EMAIL") ?? "";
        email = CacheHelper.getData(key: "NAME") ?? "";
      });
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
                                    15.ph,
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
                                              Text(
                                                "$name",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.blackColor),
                                              ),
                                              Text(
                                                "$email",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.greyColor),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    50.ph,
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
                                    40.ph,

                                    FadeInRight(
                                        child: InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context, ArticlesScreen(), -1, 0);
                                      },
                                      child: OnOptionWidget(
                                          title: "Articles", subTitle: ""),
                                    )),
                                    40.ph,
                                    FadeInRight(
                                        child: InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(context,
                                            FaqQuestionsScreen(), -1, 0);
                                      },
                                      child: OnOptionWidget(
                                          title: "Frequently Asked Questions",
                                          subTitle: ""),
                                    )),
                                    40.ph,

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
                                    40.ph,
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
