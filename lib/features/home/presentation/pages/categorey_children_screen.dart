import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/categorey_children_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/pages/categories_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoreyChildrenScreen extends StatefulWidget {
  final String title;
  final String categoreyId;
  const CategoreyChildrenScreen(
      {super.key, required this.categoreyId, required this.title});

  @override
  State<CategoreyChildrenScreen> createState() =>
      _CategoreyChildrenScreenState();
}

class _CategoreyChildrenScreenState extends State<CategoreyChildrenScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCategoreyChildren(context, widget.categoreyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, widget.title, true,
          withTranslate: false, IconColor: Colors.black),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.loadingCatChildren
              ? CategoreyChildrenSkeleton()
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(12.0.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          crossAxisSpacing: 15,
                          childAspectRatio: (1.0 / 1.5),
                          mainAxisSpacing: 0,
                          children: List.generate(
                              state.categoreyChildrenData!.categories!.length,
                              (index) {
                            return BlocBuilder<LocaleCubit, LocaleState>(
                              builder: (context, locale) {
                                return FadeInUp(
                                    child: InkWell(
                                  onTap: () {
                                    // print(state.categoreyChildrenData!
                                    // .categories![index].hasChildren!);
                                    if (state.categoreyChildrenData!
                                        .categories![index].hasChildren!) {
                                      AppConstant.customNavigation(
                                          context,
                                          CategoreyChildrenScreen(
                                              categoreyId: state
                                                  .categoreyChildrenData!
                                                  .categories![index]
                                                  .id
                                                  .toString(),
                                              title: locale.locale
                                                          .languageCode ==
                                                      "en"
                                                  ? state
                                                          .categoreyChildrenData!
                                                          .categories![index]
                                                          .nameEn ??
                                                      ""
                                                  : locale.locale
                                                              .languageCode ==
                                                          "ar"
                                                      ? state
                                                              .categoreyChildrenData!
                                                              .categories![
                                                                  index]
                                                              .nameAr ??
                                                          ""
                                                      : state
                                                              .categoreyChildrenData!
                                                              .categories![
                                                                  index]
                                                              .nameKu ??
                                                          ""),
                                          -1,
                                          0);
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              CategoriesScreen(
                                                  title: locale.locale.languageCode ==
                                                          "en"
                                                      ? state
                                                              .categoreyChildrenData!
                                                              .categories![
                                                                  index]
                                                              .nameEn ??
                                                          ""
                                                      : locale.locale.languageCode ==
                                                              "ar"
                                                          ? state
                                                                  .categoreyChildrenData!
                                                                  .categories![
                                                                      index]
                                                                  .nameAr ??
                                                              ""
                                                          : state
                                                                  .categoreyChildrenData!
                                                                  .categories![
                                                                      index]
                                                                  .nameKu ??
                                                              "",
                                                  categoryId: state
                                                      .categoreyChildrenData!
                                                      .categories![index]
                                                      .id
                                                      .toString()),
                                        ),
                                      );
                                    }
                                  },
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                blurRadius: 7.0,
                                                spreadRadius: 1.0,
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: const Color.fromARGB(
                                                            255, 0, 0, 0)
                                                        .withOpacity(0.3),
                                                    blurRadius: 2.0,
                                                    spreadRadius: 1.0,
                                                  ),
                                                ],
                                              ),
                                              child: CachedNetworkImage(
                                                width: 90,
                                                height: 90,
                                                fit: BoxFit.scaleDown,
                                                imageUrl: state
                                                        .categoreyChildrenData!
                                                        .categories![index]
                                                        .imageUrl ??
                                                    "",
                                                errorWidget: (context, name,
                                                        imageProvider) =>
                                                    Container(
                                                  padding: EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.r),
                                                    // image:
                                                  ),
                                                  child: Image.asset(
                                                    "assets/images/logo.jpg",
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  width: 90,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        blurRadius: 7.0,
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
                                          ),
                                        ),
                                        5.verticalSpace,
                                        BlocBuilder<LocaleCubit, LocaleState>(
                                          builder: (context, locale) {
                                            return Text(
                                              "${locale.locale.languageCode == "en" ? state.categoreyChildrenData!.categories![index].nameEn ?? "" : locale.locale.languageCode == "ar" ? state.categoreyChildrenData!.categories![index].nameAr ?? "" : state.categoreyChildrenData!.categories![index].nameKu ?? ""}",
                                              // overflow: TextOverflow.fade,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                              },
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
