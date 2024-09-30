import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/features/all_products/presentation/pages/all_products_screen.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/brands_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/home_search_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/home_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/pages/zain_cash.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/brands_section.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/most_selling_product.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/offers_section.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/sections_widget.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/slider_widget.dart';
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

    checkIfGuest();
  }

  bool loadingToken = false;
  String? token;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });
    token = await CacheHelper.getData(key: "USER_TOKEN");
    print(token);
    setState(() {
      loadingToken = false;
    });
    if (token != null) {
      context.read<ProfileCubit>().getuserInfo(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        actions: [
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
                            print("Yesy");
                            number.replaceFirst("0", "+964");
                            print(number);
                            String newNumber = "+964";

                            for (int i = 1; i < number.length; i++) {
                              newNumber = newNumber + number[i];
                            }
                            number = newNumber;
                          }
                          print(number);
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
      body: SingleChildScrollView(
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
                            SizedBox(
                                width: 0.9.sw,
                                child: TextField(
                                  textInputAction: TextInputAction.search,
                                  onSubmitted: (value) {
                                    AppConstant.customNavigation(
                                        context, HomeSearchScreen(), 1, 0);
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
                                    hintText: "Find what you want".tr(context),
                                  ),
                                )),
                            SliderForAds(),
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
                                            fontSize: 34.sp),
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
                                                        fontSize: 34.sp),
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
                                                              .greyColor),
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
                                                            .greyColor),
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
                                                      fontSize: 34.sp),
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
                                                            .greyColor),
                                                  ),
                                                )
                                              ],
                                            ),
                                  state.homeInfo!.discountedProducts == null
                                      ? SizedBox()
                                      : state.homeInfo!.discountedProducts!
                                              .isEmpty
                                          ? SizedBox()
                                          : OffersSection()
                                ],
                              ),
                            ),
                          ],
                        );
            },
          ),
        ),
      ),
    );
  }
}

class Zasin extends StatefulWidget {
  const Zasin({super.key});

  @override
  State<Zasin> createState() => _ZasinState();
}

class _ZasinState extends State<Zasin> {
  Widget _zaincash = Container();
  String paymentState = '';

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    /**
     * to listen for the state of the transaction, it returns a json objects you can fetch like state['success']
     */
    ZaincashService.paymentStateListener.listen((state) {
      setState(() {
        paymentState = state.toString();
      });
    });
  }

  void _triggerPayment() {
    setState(() {
      _zaincash = Container(
          child: new ZainCash(
              transactionId: _controller.text,
              production: false,
              closeOnSuccess: true,
              closeOnError: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ghaith"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter the transaction id'),
                  ),
                ),
                SizedBox(height: 20),
                Text('Payment listener state ' + paymentState),
              ],
            ),
            _zaincash,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _triggerPayment,
        tooltip: 'Pay',
        child: Icon(Icons.payment),
      ),
    );
    // InkWell(
    //     onTap: () {
    //       // ZaincashService.paymentStateListener
    //       //     .listen((state) {
    //       //   print("Done");
    //       // });
    //       ZainCash(
    //           transactionId: "61b3976de65fb79d1b5ffc3c",
    //           production: false,
    //           closeOnSuccess: true,
    //           closeOnError: true);
    //       // showFlexibleBottomSheet(
    //       //   bottomSheetColor:
    //       //       AppColors.whiteColor,
    //       //   barrierColor:
    //       //       Color.fromARGB(94, 83, 83, 83),
    //       //   bottomSheetBorderRadius:
    //       //       BorderRadius.only(
    //       //           topLeft:
    //       //               Radius.circular(40.sp),
    //       //           topRight:
    //       //               Radius.circular(40.sp)),
    //       //   minHeight: 0,
    //       //   initHeight: 0.3,
    //       //   maxHeight: 0.3,
    //       //   anchors: [0, 0.3],
    //       //   isSafeArea: true,
    //       //   context: context,
    //       //   builder: sortingSectionsBottomSheet,
    //       // );
    //     },
    //     child: Icon(Icons.filter_list_outlined));
  }
}
