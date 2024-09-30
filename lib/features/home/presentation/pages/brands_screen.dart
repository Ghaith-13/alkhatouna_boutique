import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/brands_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/pages/categories_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flex_list/flex_list.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getBrands(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, "Brands", true,
          IconColor: Colors.black),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.loadingBrands
              ? BrandsSkeleton()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    childAspectRatio: (1 / 1.8),
                    children: List.generate(state.brandsData!.brands!.length,
                        (index) {
                      return Container(
                        margin: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.sp),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greyColor,
                              offset: Offset(4, 0),
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.sp)),
                                child: CachedNetworkImage(
                                  width: 1.sw,
                                  height: 184.h,
                                  fit: BoxFit.scaleDown,
                                  imageUrl: state
                                          .brandsData!.brands![index].logoUrl ??
                                      "",
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    "assets/images/logo.jpg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                )),
                            Text(
                              "${state.brandsData!.brands![index].name}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 0.118.sh,
                              width: 1.sw,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: FlexList(
                                      verticalSpacing: 2,
                                      horizontalSpacing: 2,
                                      children: [
                                        for (int i = 0;
                                            i <
                                                state.brandsData!.brands![index]
                                                    .categories!.length;
                                            i++)
                                          BlocBuilder<LocaleCubit, LocaleState>(
                                            builder: (context, locale) {
                                              return InkWell(
                                                onTap: () {
                                                  if (state
                                                          .brandsData!
                                                          .brands![index]
                                                          .categories![i]
                                                          .parentId !=
                                                      null) {
                                                    context
                                                        .read<HomeCubit>()
                                                        .dealWithListIdForBrand(
                                                            state
                                                                .brandsData!
                                                                .brands![index]
                                                                .id
                                                                .toString());
                                                    AppConstant.customNavigation(
                                                        context,
                                                        CategoriesScreen(
                                                            categoryId: state
                                                                .brandsData!
                                                                .brands![index]
                                                                .categories![i]
                                                                .parentId!,
                                                            title: ""),
                                                        -1,
                                                        0);
                                                  }
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.sp)),
                                                  child: Container(
                                                    color:
                                                        AppColors.primaryColor,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Text(
                                                        "${locale.locale.languageCode == "ar" ? state.brandsData!.brands![index].categories![i].nameAr ?? "" : locale.locale.languageCode == "en" ? state.brandsData!.brands![index].categories![i].nameEn ?? "" : state.brandsData!.brands![index].categories![i].nameKu ?? ""}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                );
        },
      ),
    );
  }
}
