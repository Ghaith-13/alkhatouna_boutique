import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/pages/categorey_children_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneSectionWidget extends StatelessWidget {
  final String logo, title, categoryId;
  const OneSectionWidget(
      {super.key,
      required this.logo,
      required this.title,
      required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppConstant.customNavigation(
            context,
            CategoreyChildrenScreen(title: title, categoreyId: categoryId),
            // CategoriesScreen(
            //   title: title,
            //   categoryId: categoryId,
            // ),
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
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                  blurRadius: 7.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: CachedNetworkImage(
              width: 80,
              height: 80,
              fit: BoxFit.fill,
              imageUrl: logo,
              errorWidget: (context, name, imageProvider) => Image.asset(
                "assets/images/logo-removebg-preview.png",

                // fit: BoxFit.fitWidth,
              ),
              imageBuilder: (context, imageProvider) => Container(
                // padding: EdgeInsets.symmetric(vertical: 5),
                // padding: EdgeInsets.all(5),

                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
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
          5.verticalSpace,
          SizedBox(
            width: 80,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
