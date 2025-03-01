import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/bloc_provider.dart';
import 'package:alkhatouna/config/themes/app_themes.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getNotifications(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, "Notifications", true,
          withTranslate: true),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.loadingNotifications
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
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
                                height: 100.h),
                          )),
                      10.ph,
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                                color: Colors.black,
                                width: 1.sw,
                                height: 100.h),
                          )),
                      10.ph,
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                                color: Colors.black,
                                width: 1.sw,
                                height: 100.h),
                          )),
                      10.ph,
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                                color: Colors.black,
                                width: 1.sw,
                                height: 100.h),
                          )),
                    ],
                  ),
                )
              : state.notifications == null
                  ? Center(
                      child: Column(
                      children: [
                        Lottie.asset('assets/images/empty_data.json'),
                        Text("You have no notifications yet.".tr(context)),
                      ],
                    ))
                  : state.notifications!.isEmpty
                      ? Center(
                          child: Column(
                          children: [
                            Lottie.asset('assets/images/empty_data.json'),
                            Text("You have no notifications yet.".tr(context)),
                          ],
                        ))
                      : ListView.builder(
                          itemCount: state.notifications!.length,
                          itemBuilder: (context, index) {
                            DateTime dateTime = DateTime.parse(
                                state.notifications![index].createdAt ?? "");

                            // Format the date.
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(dateTime);

                            // Format the time.
                            String formattedTime =
                                DateFormat('HH:mm').format(dateTime);
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    state.notifications![index].image == null
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/images/logo-removebg-preview.png",
                                              width: 125,
                                              height: 125,
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.sp)),
                                                child: CachedNetworkImage(
                                                  width: 125,
                                                  height: 125,
                                                  fit: BoxFit.fill,
                                                  imageUrl: state
                                                          .notifications![index]
                                                          .image ??
                                                      '',
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r),
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                    20.pw,
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                state.notifications![index]
                                                        .title ??
                                                    "",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 18.sp),
                                              )),
                                              Text(
                                                "${formattedDate}\n${formattedTime}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.grey),
                                              ),
                                              10.pw
                                            ],
                                          ),
                                          20.ph,
                                          Text(state
                                                  .notifications![index].body ??
                                              "")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  thickness: 0.5,
                                )
                              ],
                            );
                          },
                        );
        },
      ),
    );
  }
}
