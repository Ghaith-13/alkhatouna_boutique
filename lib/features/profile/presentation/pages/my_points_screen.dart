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

class MyPointsScreen extends StatefulWidget {
  const MyPointsScreen({super.key});

  @override
  State<MyPointsScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<MyPointsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getMyPoints(context);
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
          return state.loadingPoints
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
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(12.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Points records".tr(context),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.sp)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(55, 0, 0, 0),
                                offset: Offset(0, 2),
                                blurRadius: 4.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(40.0.sp),
                            child: Center(
                                child: Text(
                              "${"Total Points".tr(context)} : ${formatCurrency.format(double.parse(state.myPointsData!.totalPoints!.toString()))} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            )),
                          ),
                        ),
                        20.ph,
                        state.myPointsData == null
                            ? Center(
                                child: Column(
                                children: [
                                  Lottie.asset('assets/images/empty_data.json'),
                                  Text(
                                    "Sorry, there are no activities."
                                        .tr(context),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp),
                                  ),
                                ],
                              ))
                            : state.myPointsData!.pointRecords!.length == 0
                                ? Center(
                                    child: Column(
                                    children: [
                                      Lottie.asset(
                                          'assets/images/empty_data.json'),
                                      Text(
                                        "Sorry, there are no activities."
                                            .tr(context),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp),
                                      ),
                                    ],
                                  ))
                                : Container(
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
                                      itemCount: state.myPointsData == null
                                          ? 0
                                          : state.myPointsData!.pointRecords!
                                              .length,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${"Type".tr(context)} : ${state.myPointsData!.pointRecords![index].type == "order" && formatCurrency.format(double.parse(state.myPointsData!.pointRecords![index].points.toString())).startsWith("-") ? "Pay for order".tr(context) : state.myPointsData!.pointRecords![index].type == "order" ? "Profit from purchases".tr(context) : state.myPointsData!.pointRecords![index].type == "refund" ? "refund".tr(context) : state.myPointsData!.pointRecords![index].type} ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.sp),
                                                  ),
                                                  Text(
                                                    "${formatCurrency.format(double.parse(state.myPointsData!.pointRecords![index].points.toString()))}",
                                                    style: TextStyle(
                                                        color: formatCurrency
                                                                .format(double.parse(state
                                                                    .myPointsData!
                                                                    .pointRecords![
                                                                        index]
                                                                    .points
                                                                    .toString()))
                                                                .startsWith("-")
                                                            ? Colors.red
                                                            : Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  // Text(
                                                  //   "${"Promo Code".tr(context)} : ${state.myPointsData!.pointRecords![index].points}",
                                                  //   style: TextStyle(
                                                  //       fontWeight:
                                                  //           FontWeight.bold,
                                                  //       fontSize: 12.sp),
                                                  // ),
                                                  Text(
                                                    "${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(state.myPointsData!.pointRecords![index].createdAt ?? ""))}",
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
