import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/one_section_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchScreen extends StatefulWidget {
  const HomeSearchScreen({super.key});

  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, "Search Result", true),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sections".tr(context),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.sp),
            ),
            GridView.count(
              padding: EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 15,
              childAspectRatio: (1.0 / 1.0),
              mainAxisSpacing: 30,
              children: List.generate(7, (index) {
                return FadeInUp(
                    child: OneSectionWidget(
                        categoryId: "1", logo: "", title: "Title"));
              }),
            ),
            20.verticalSpace,
            Text(
              "Brands".tr(context),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.sp),
            ),
            GridView.count(
              padding: EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 15,
              childAspectRatio: (1.0 / 1.0),
              mainAxisSpacing: 30,
              children: List.generate(9, (index) {
                return FadeInUp(
                    child: InkWell(
                  onTap: () {},
                  child: Container(
                    // margin: EdgeInsetsDirectional.only(end: 10),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                    width: 60,
                    // height: 110,
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
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                shape: BoxShape.circle,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.3),
                                //     blurRadius: 7.0,
                                //     spreadRadius: 1.0,
                                //   ),
                                // ],
                              ),
                              child: CachedNetworkImage(
                                width: 35,
                                height: 35,
                                fit: BoxFit.fill,
                                imageUrl: "",
                                errorWidget: (context, name, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    // image:
                                  ),
                                  child: Image.asset(
                                    "assets/images/logo.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            2.verticalSpace,
                            Text(
                              "Adidas",
                              // overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 8.sp, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
              }),
            )
          ],
        ),
      )),
    );
  }
}
