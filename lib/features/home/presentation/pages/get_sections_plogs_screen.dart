import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/data/models/get_blogs_model.dart';
import 'package:alkhatouna/features/home/presentation/pages/one_blog_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetSectionsPlogsScreen extends StatefulWidget {
  GetPlogsModel getPlogsModel;
  GetSectionsPlogsScreen({super.key, required this.getPlogsModel});

  @override
  State<GetSectionsPlogsScreen> createState() => _GetSectionsPlgsScreenState();
}

class _GetSectionsPlgsScreenState extends State<GetSectionsPlogsScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.getPlogsModel.data!.sectionInfo!.imageUrl);
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, locale) {
        return Scaffold(
          appBar: AppConstant.customAppBar(
              context,
              locale.locale.languageCode == "en"
                  ? widget.getPlogsModel.data!.sectionInfo!.nameEn ?? ""
                  : widget.getPlogsModel.data!.sectionInfo!.nameAr ?? "",
              true,
              withTranslate: false),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 7.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: CachedNetworkImage(
                    width: 1.sw,
                    height: 175.sp,
                    fit: BoxFit.scaleDown,
                    imageUrl:
                        widget.getPlogsModel.data!.sectionInfo!.imageUrl ?? "",
                    imageBuilder: (context, imageProvider) => Container(
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 7.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                // 20.horizontalSpace,
                Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: Text(
                    locale.locale.languageCode == "en"
                        ? widget.getPlogsModel.data!.sectionInfo!
                                .descriptionEn ??
                            ""
                        : widget.getPlogsModel.data!.sectionInfo!
                                .descriptionAr ??
                            "",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.getPlogsModel.data!.blogs!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              AppConstant.customNavigation(
                                  context,
                                  OneBlogScreen(
                                    sectionPlogId: widget
                                            .getPlogsModel.data!.sectionInfo!.id
                                            .toString() ??
                                        "",
                                  ),
                                  -1,
                                  0);
                            },
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  width: 125.sp,
                                  height: 125.sp,
                                  fit: BoxFit.scaleDown,
                                  imageUrl: widget.getPlogsModel.data!
                                          .blogs![index].outsideImageUrl ??
                                      "",
                                  imageBuilder: (context, imageProvider) =>
                                      ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            blurRadius: 7.0,
                                            spreadRadius: 1.0,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " ${locale.locale.languageCode == "en" ? widget.getPlogsModel.data!.blogs![index].titleEn ?? "" : widget.getPlogsModel.data!.blogs![index].titleAr ?? ""}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor),
                                      ),
                                      Text(
                                        " ${locale.locale.languageCode == "en" ? widget.getPlogsModel.data!.blogs![index].bodyEn ?? "" : widget.getPlogsModel.data!.blogs![index].bodyAr ?? ""}",
                                        overflow: TextOverflow
                                            .ellipsis, // This adds the ellipsis
                                        maxLines:
                                            1, // Sets the maximum number of lines (adjust as needed)
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            // fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          10.verticalSpace,
                          Divider(
                            thickness: 0.5,
                            color: AppColors.primaryColor,
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
