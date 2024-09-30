import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getWallet(context);
  }

  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppConstant.customAppBar(
        context,
        "",
        true,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: AppColors.whiteColor,
        elvation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.loadingArticles
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
              : state.walletData == null
                  ? Center(
                      child: Column(
                      children: [
                        Lottie.asset('assets/images/empty_data.json'),
                        Text(
                          "Sorry, there are no activities.".tr(context),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                      ],
                    ))
                  : state.walletData!.records!.length == 0
                      ? Center(
                          child: Column(
                          children: [
                            Lottie.asset('assets/images/empty_data.json'),
                            Text(
                              "Sorry, there are no activities.".tr(context),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                          ],
                        ))
                      : SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(12.0.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Wallet".tr(context),
                                  style: TextStyle(
                                      fontSize: 34.sp,
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                20.ph,
                                Container(
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.sp)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            const Color.fromARGB(55, 0, 0, 0),
                                        offset: Offset(0, 2),
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(40.0.sp),
                                    child: Center(
                                        child: Text(
                                      "${"Total profit".tr(context)} : ${formatCurrency.format(double.parse(state.walletData!.walletBalance ?? ""))} د.ع",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp),
                                    )),
                                  ),
                                ),
                                20.ph,
                                Container(
                                    width: 1.sw,
                                    padding: EdgeInsets.all(25.sp),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.sp)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              const Color.fromARGB(55, 0, 0, 0),
                                          offset: Offset(0, 2),
                                          blurRadius: 4.0,
                                        ),
                                      ],
                                    ),
                                    child: ListView.builder(
                                      itemCount: state.walletData!.records ==
                                              null
                                          ? 0
                                          : state.walletData!.records!.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${"Order".tr(context)} : ${state.walletData!.records![index].id} ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp),
                                                  ),
                                                  Text(
                                                    "${formatCurrency.format(double.parse(state.walletData!.records![index].commissionValue.toString()))} د.ع",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${"Promo Code".tr(context)} : ${state.walletData!.records![index].promoCode}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.sp),
                                                  ),
                                                  Text(
                                                    "${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(state.walletData!.records![index].createdAt ?? ""))}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.sp),
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                thickness: 0.5,
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ))
                              ],
                            ),
                          ),
                        );
        },
      ),
    );
  }
}
