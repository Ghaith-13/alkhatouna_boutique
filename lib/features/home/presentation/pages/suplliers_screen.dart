import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/bloc_provider.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/supllier_products_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class SuplliersScreen extends StatefulWidget {
  const SuplliersScreen({super.key});

  @override
  State<SuplliersScreen> createState() => _SuplliersScreenState();
}

class _SuplliersScreenState extends State<SuplliersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getSupllier(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, "Our partner stores", true),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.loadingSuplliers
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.black,
                                  width: 150,
                                  height: 150,
                                ),
                              )),
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.black,
                                  width: 150,
                                  height: 150,
                                ),
                              )),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.black,
                                  width: 150,
                                  height: 150,
                                ),
                              )),
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.black,
                                  width: 150,
                                  height: 150,
                                ),
                              )),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.black,
                                  width: 150,
                                  height: 150,
                                ),
                              )),
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.black,
                                  width: 150,
                                  height: 150,
                                ),
                              )),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.black,
                                  width: 150,
                                  height: 150,
                                ),
                              )),
                          Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.black,
                                  width: 150,
                                  height: 150,
                                ),
                              )),
                        ],
                      ),
                      10.verticalSpace,
                    ],
                  ),
                )
              : state.suplliers!.isEmpty
                  ? Center(
                      child: Column(
                      children: [
                        Lottie.asset('assets/images/empty_data.json'),
                        Text(
                          "Sorry, there are no suppliers.".tr(context),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                      ],
                    ))
                  : SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: 12),
                        width: 1.sw,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: List.generate(
                            state.suplliers!.length,
                            (index) {
                              double childWidth =
                                  (MediaQuery.of(context).size.width) / 2;
                              return Container(
                                padding: EdgeInsets.only(bottom: 25),
                                width: childWidth,
                                child: FadeInUp(
                                  child: InkWell(
                                    onTap: () {
                                      AppConstant.customNavigation(
                                          context,
                                          SupllierProductsScreen(
                                            supllierID: state
                                                .suplliers![index].id
                                                .toString(),
                                            title: state.suplliers![index].name
                                                .toString(),
                                          ),
                                          -1,
                                          0);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                        255, 0, 0, 0)
                                                    .withOpacity(0.3),
                                                blurRadius: 7.0,
                                                spreadRadius: 1.0,
                                              ),
                                            ],
                                          ),
                                          child: CachedNetworkImage(
                                            width: 150,
                                            height: 150,
                                            fit: BoxFit.fill,
                                            imageUrl: state.suplliers![index]
                                                    .imageUrl ??
                                                "",
                                            errorWidget: (context, name,
                                                    imageProvider) =>
                                                Image.asset(
                                              "assets/images/logo-removebg-preview.png",

                                              // fit: BoxFit.fitWidth,
                                            ),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              // padding: EdgeInsets.symmetric(vertical: 5),
                                              // padding: EdgeInsets.all(5),

                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    blurRadius: 2.0,
                                                    spreadRadius: 1.0,
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        10.verticalSpace,
                                        SizedBox(
                                          width: 150,
                                          child: Text(
                                            "${state.suplliers![index].name}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
