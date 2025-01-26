import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/auth/presentation/pages/log_in_screen.dart';
import 'package:alkhatouna/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:alkhatouna/features/cart/presentation/pages/shipping_addresses_screen.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/products_sidebar_sections_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/send_advice_and_consult_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/suplliers_screen.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/features/profile/presentation/pages/about_us.dart';
import 'package:alkhatouna/features/profile/presentation/pages/articles_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/contact_us.dart';
import 'package:alkhatouna/features/profile/presentation/pages/orders_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/settings_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/terms_and_conditions_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/tutorials_screen.dart';
import 'package:alkhatouna/features/profile/presentation/pages/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class AppConstant {
  static CustomAlert(
      BuildContext context, String msg, bool withTranslate, bool error) async {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: error ? Colors.red : Colors.green,
        padding:
            EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
        content: Text(
          withTranslate ? msg.tr(context) : msg,
          style: TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static CustomDrawer(BuildContext context, String? token) {
    String name = CacheHelper.getData(key: "EMAIL") ?? "";
    String email = CacheHelper.getData(key: "NAME") ?? "";
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, homestate) {
            return Drawer(
              backgroundColor: AppColors.whiteColor,
              surfaceTintColor: AppColors.primaryColor,
              child: ListView(
                children: <Widget>[
                  email.isEmpty && name.isEmpty
                      ? SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$email",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "$name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                  email.isEmpty && name.isEmpty ? SizedBox() : Divider(),
                  if (homestate.sideBarSections != null)
                    for (var section in homestate.sideBarSections!)
                      BlocBuilder<LocaleCubit, LocaleState>(
                        builder: (context, loclae) {
                          return ListTile(
                            title: Text(
                              loclae.locale.languageCode == "en"
                                  ? '${section.nameEn}'
                                  : '${section.nameAr}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              if (section.type == "blog") {
                                context.read<HomeCubit>().getblogSection(
                                    context, section.id.toString());
                              } else {
                                Navigator.pop(context);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductsSidebarSectionsScreen(
                                      sectionID: section.id.toString(),
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                  ListTile(
                    title: Text(
                      'Our partner stores'.tr(context),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SuplliersScreen(),
                        ),
                      );
                    },
                  ),
                  token == null
                      ? SizedBox()
                      : ListTile(
                          title: Text(
                            'Your suggestion matters to us'.tr(context),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SendAdviceAndConsultScreen(
                                  title: "Your suggestion matters to us",
                                ),
                              ),
                            );
                          },
                        ),
                  token == null
                      ? SizedBox()
                      : ListTile(
                          title: Text(
                            'Free consultations'.tr(context),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SendAdviceAndConsultScreen(
                                  title: "Free consultations",
                                ),
                              ),
                            );
                          },
                        ),
                  token == null
                      ? SizedBox()
                      : ListTile(
                          title: Text(
                            'My Orders'.tr(context),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const OrdersScreen(),
                              ),
                            );
                          },
                        ),
                  token == null
                      ? SizedBox()
                      : ListTile(
                          title: Text(
                            'Shipping addresses'.tr(context),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ShippingAddressesScreen(),
                              ),
                            );
                          },
                        ),
                  ListTile(
                    title: Text(
                      'Articles'.tr(context),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ArticlesScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Tutorials videos'.tr(context),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TutorialsScreen(),
                        ),
                      );
                    },
                  ),
                  token == null
                      ? SizedBox()
                      : state.userInfo?.isBlogger == "0"
                          ? SizedBox()
                          : ListTile(
                              title: Text(
                                'Wallet'.tr(context),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const WalletScreen(),
                                  ),
                                );
                              },
                            ),
                  token == null
                      ? SizedBox()
                      : ListTile(
                          title: Text(
                            'Settings'.tr(context),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ),
                            );
                          },
                        ),
                  ListTile(
                    title: Text(
                      'Contact Us'.tr(context),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ContactUsScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'About us'.tr(context),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AboutUsScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Terms and conditions'.tr(context),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const TermsAndConditionsScreen(),
                        ),
                      );
                    },
                  ),
                  token == null
                      ? ListTile(
                          title: AppConstant.customElvatedButton(
                              context, "Login", () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LogInScreen()),
                            (Route route) => false,
                          );
                        },
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)))
                      : SizedBox(),
                  token == null ? SizedBox() : SizedBox()
                  // ListTile(
                  //     title: InkWell(
                  //       onTap: () async {
                  //         GoogleSignIn googleSignIn = GoogleSignIn();
                  //         googleSignIn.disconnect();
                  //         SharedPreferences preferences =
                  //             await SharedPreferences.getInstance();
                  //         await preferences.clear();
                  //         di.sl<ApiBaseHelper>().updateHeader();

                  //         Navigator.of(context).pushAndRemoveUntil(
                  //           MaterialPageRoute(
                  //               builder: (context) => const LogInScreen()),
                  //           (Route route) => false,
                  //         );
                  //       },
                  //       child: Container(
                  //         child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   children: [
                  //                     Text(
                  //                       "Log out",
                  //                       style: TextStyle(
                  //                           fontSize: 14.sp,
                  //                           fontWeight: FontWeight.w600,
                  //                           color: AppColors.blackColor),
                  //                     ),
                  //                   ]),
                  //               Icon(
                  //                 Icons.logout_outlined,
                  //                 color: AppColors.greyColor,
                  //                 size: 24.sp,
                  //               )
                  //             ]),
                  //       ),
                  //     ),
                  //   ),
                  // 40.ph,
                  // ,
                  // token == null
                  //     ? SizedBox()
                  //     : ListTile(
                  //         // contentPadding: EdgeInsets.all(0),
                  //         title: BlocBuilder<ProfileCubit, ProfileState>(
                  //           builder: (context, state) {
                  //             return AppConstant.customElvatedButton(
                  //                 context, "Delete Account", () async {
                  //               if (state.laodingfeedback) {
                  //               } else {
                  //                 bool confirmed =
                  //                     await showConfirmationDialog(context);
                  //                 if (confirmed) {
                  //                   // Proceed with the action
                  //                   context
                  //                       .read<ProfileCubit>()
                  //                       .deleteAccount(context);
                  //                 } else {}
                  //               }
                  //             },
                  //                 style: TextStyle(color: Colors.white),
                  //                 loading: state.laodingfeedback ? true : false);
                  //           },
                  //         ),
                  //       )
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Future<bool> showConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Confirmation'.tr(context)),
        content: Text('Are you sure you want to proceed?'.tr(context)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:
                Text('No'.tr(context), style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child:
                Text('Yes'.tr(context), style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  static customNavigation(
      BuildContext context, Widget screen, double x, double y) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(x, y),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        },
      ),
    );
  }

  static customAppBar(BuildContext context, String title, bool canBack,
      {Color? backgroundColor,
      Color? IconColor,
      double? elvation,
      bool withTranslate = true,
      bool fromSignIn = false,
      List<Widget>? actions}) {
    return AppBar(
      actions: actions,
      elevation: elvation,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      leading: canBack
          ? InkWell(
              onTap: () {
                if (fromSignIn) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SignUpScreen(),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: IconColor,
              ))
          : null,
      title: Text(
        withTranslate ? title.tr(context) : title,
        style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  static productDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.favorite_border_outlined,
              color: AppColors.thirdColor,
            ),
            10.pw,
          ],
        ),
      ),
      centerTitle: false,
      title: Icon(Icons.share_outlined, color: AppColors.thirdColor),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: AppColors.thirdColor),
          ),
        ),
      ],
    );
  }

  static customElvatedButton(
      BuildContext context, String title, Function onpress,
      {TextStyle? style, bool loading = false}) {
    return SizedBox(
        height: 48.h,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(75.r),
          child: ElevatedButton(
              onPressed: () {
                onpress();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  AppColors.primaryColor,
                ),
              ),
              child: loading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      title.tr(context),
                      style: style ??
                          TextStyle(
                              color: AppColors.secondryColor, fontSize: 14.sp),
                    )),
        ));
  }
}
