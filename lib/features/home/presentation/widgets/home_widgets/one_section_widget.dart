import 'package:alkhatouna/features/home/presentation/pages/categories_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';

class OneSectionWidget extends StatelessWidget {
  final String logo, title, categoryId;
  const OneSectionWidget(
      {super.key,
      required this.logo,
      required this.title,
      required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConstant.customNavigation(
            context,
            CategoriesScreen(
              title: title,
              categoryId: categoryId,
            ),
            -1,
            0);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: 80,
        height: 110,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                  child: CachedNetworkImage(
                width: 50,
                height: 50,
                fit: BoxFit.fill,
                imageUrl: logo,
                errorWidget: (context, name, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    // image:
                  ),
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                child: Text(
                  title, // overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
