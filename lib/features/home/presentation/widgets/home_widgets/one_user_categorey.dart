import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/home/data/models/user_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OneUserCategorey extends StatefulWidget {
  final Categories categories;
  const OneUserCategorey({super.key, required this.categories});

  @override
  State<OneUserCategorey> createState() => _OneUserCategoreyState();
}

class _OneUserCategoreyState extends State<OneUserCategorey> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, locale) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.all(12.sp),
            //   child: Text(
            //     "Category Description".tr(context),
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  "${locale.locale.languageCode == "en" ? "${widget.categories.descriptionEn}" : locale.locale.languageCode == "ar" ? "${widget.categories.descriptionAr}" : "${widget.categories.descriptionAr}"}"),
            ),
            // Padding(
            //   padding: EdgeInsets.all(12.sp),
            //   child: Text(
            //     "benefits".tr(context),
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            //   ),
            // ),
            widget.categories.benefits == null
                ? Center(
                    child: Column(
                    children: [
                      Lottie.asset(
                        'assets/images/empty_data.json',
                      ),
                      Text(
                        "Sorry, there are no benefits".tr(context),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                      ),
                    ],
                  ))
                : widget.categories.benefits!.isEmpty
                    ? Center(
                        child: Column(
                        children: [
                          Lottie.asset(
                            'assets/images/empty_data.json',
                          ),
                          Text(
                            "Sorry, there are no benefits".tr(context),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                          ),
                        ],
                      ))
                    : ListView.builder(
                        itemCount: widget.categories.benefits!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(12.sp),
                            width: 1.sw,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //     borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                                //     child: CachedNetworkImage(
                                //       width: 75.sp,
                                //       height: 75.sp,
                                //       fit: BoxFit.fill,
                                //       imageUrl: '',
                                //       errorWidget: (context, url, error) {
                                //         return Image.asset("assets/images/logo.jpg");
                                //       },
                                //       imageBuilder: (context, imageProvider) => Container(
                                //         decoration: BoxDecoration(
                                //           borderRadius: BorderRadius.circular(15.r),
                                //           image: DecorationImage(
                                //             image: imageProvider,
                                //             fit: BoxFit.cover,
                                //           ),
                                //         ),
                                //       ),
                                //     )),
                                CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                10.pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.categories.benefits![index]
                                                  .benefitType ==
                                              "free_delivery"
                                          ? "Free delivery".tr(context)
                                          : widget.categories.benefits![index]
                                                      .benefitType ==
                                                  "discount"
                                              ? "Make discount on your order"
                                                  .tr(context)
                                              : widget
                                                      .categories
                                                      .benefits![index]
                                                      .benefitType ??
                                                  "",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 0.7.sw,
                                      child: Text(
                                        "${"Number of times used".tr(context)} : ${widget.categories.benefits![index].limit}",
                                        softWrap: true,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.7.sw,
                                      child: Text(
                                        "${"Valid for".tr(context)} ${widget.categories.benefits![index].durationDays} ${"days from activation".tr(context)}",
                                        softWrap: true,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
          ],
        );
      },
    );
  }
}
