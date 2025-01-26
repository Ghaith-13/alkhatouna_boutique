import 'dart:io';

import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/data/models/get_blogs_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OneBlogScreen extends StatefulWidget {
  final String sectionPlogId;
  const OneBlogScreen({super.key, required this.sectionPlogId});

  @override
  State<OneBlogScreen> createState() => _OneBlogScreenState();
}

class _OneBlogScreenState extends State<OneBlogScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getonePlog(context, widget.sectionPlogId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, locale) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            print(state.onePlogModel);
            return state.loadingoneBlog
                ? SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: Stack(children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.sp),
                            child: Container(
                              color: Colors.black,
                              width: 1.sw,
                              height: 1.sh,
                            ),
                          )),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Lottie.asset('assets/images/loading.json'),
                      )
                    ]),
                  )
                : Scaffold(
                    body: SizedBox(
                      width: 1.sw,
                      height: 1.sh,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            width: 1.sw,
                            height: 0.4.sh,
                            fit: BoxFit.scaleDown,
                            imageUrl: state
                                    .onePlogModel!.data!.blog!.insideImageUrl ??
                                "",
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
                          Positioned(
                              top: 0.3.sh,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40)),
                                child: SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 40, left: 20, right: 20),
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          locale.locale.languageCode == "en"
                                              ? state.onePlogModel!.data!.blog!
                                                      .titleEn ??
                                                  ""
                                              : state.onePlogModel!.data!.blog!
                                                      .titleAr ??
                                                  "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryColor,
                                              fontSize: 20.sp),
                                        ),
                                        Divider(),
                                        Text(
                                          locale.locale.languageCode == "en"
                                              ? state.onePlogModel!.data!.blog!
                                                      .bodyEn ??
                                                  ""
                                              : state.onePlogModel!.data!.blog!
                                                      .bodyAr ??
                                                  "",
                                          style: TextStyle(fontSize: 12.sp),
                                        ),
                                        state.onePlogModel!.data!.paragraphs ==
                                                null
                                            ? SizedBox()
                                            : ListView.builder(
                                                itemCount: state.onePlogModel!
                                                    .data!.paragraphs!.length,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16.sp),
                                                          "${locale.locale.languageCode == "en" ? state.onePlogModel!.data!.paragraphs![index].titleEn ?? "" : state.onePlogModel!.data!.paragraphs![index].titleAr ?? ""}"),
                                                      Html(
                                                        data:
                                                            "${locale.locale.languageCode == "en" ? state.onePlogModel!.data!.paragraphs![index].paragraphEn ?? "" : state.onePlogModel!.data!.paragraphs![index].paragraphAr ?? ""}",
                                                        onLinkTap: (url,
                                                            attributes,
                                                            element) async {
                                                          if (url != null) {
                                                            final Uri uri =
                                                                Uri.parse(url);
                                                            if (await canLaunchUrlString(
                                                                uri.toString())) {
                                                              await launchUrlString(
                                                                  uri.toString());
                                                            } else {
                                                              // Handle error, e.g., show a snackbar
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                    content: Text(
                                                                        'Could not launch $url')),
                                                              );
                                                            }
                                                          }
                                                        },
                                                      ),
                                                      Divider()
                                                    ],
                                                  );
                                                },
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          Positioned(
                              top: 0.28.sh,
                              left: 0.15.sw,
                              child: ClipOval(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  color: AppColors.primaryColor,
                                  child: GestureDetector(
                                      onTap: () async {
                                        final url = Uri.parse(state
                                                .onePlogModel!
                                                .data!
                                                .blog!
                                                .insideImageUrl ??
                                            "");
                                        final response = await http.get(url);
                                        final bytes = response.bodyBytes;
                                        final temp =
                                            await getTemporaryDirectory();
                                        final path = '${temp.path}/image.jpg';
                                        File(path).writeAsBytesSync(bytes);
                                        XFile file = XFile(path);
                                        final box = context.findRenderObject()
                                            as RenderBox?;
                                        // "${"https://alkhatouna-boutique-8d85a.firebaseapp.com/productDetails/?plogid=${widget.sectionPlogId}"}" \n
                                        await Share.shareXFiles(
                                          [file],
                                          text:
                                              '"${"Plog Description"}" \n ${locale.locale.languageCode == "en" ? state.onePlogModel!.data!.blog!.titleEn ?? "" : locale.locale.languageCode == "ar" ? state.onePlogModel!.data!.blog!.titleAr ?? "" : ""} \n ${locale.locale.languageCode == "en" ? state.onePlogModel!.data!.blog!.bodyEn ?? "" : locale.locale.languageCode == "ar" ? state.onePlogModel!.data!.blog!.bodyAr ?? "" : ""} ',
                                          sharePositionOrigin:
                                              box!.localToGlobal(Offset.zero) &
                                                  box.size,
                                        );
                                      },
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      )),
                                ),
                              )),
                          Positioned.directional(
                              top: 0.05.sh,
                              start: 0.05.sw,
                              textDirection: locale.locale.languageCode == "en"
                                  ? TextDirection.ltr
                                  : TextDirection.rtl,
                              child: ClipOval(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.white,
                                  child: GestureDetector(
                                      onTap: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: AppColors.primaryColor,
                                      )),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
