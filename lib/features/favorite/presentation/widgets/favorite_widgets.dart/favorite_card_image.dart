// // ignore_for_file: must_be_immutable

// import 'package:alkhatouna/Locale/app_localization.dart';
// import 'package:alkhatouna/features/favorite/data/models/favorite_model.dart';
// import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
// import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:alkhatouna/core/utils/app_colors.dart';

// class FavoriteCardImage extends StatefulWidget {
//   bool haveOffer;
//   bool soldOut;
//   final FavoriteProduct favoriteProduct;

//   FavoriteCardImage(
//       {super.key,
//       this.haveOffer = false,
//       required this.favoriteProduct,
//       required this.soldOut});

//   @override
//   State<FavoriteCardImage> createState() => _FavoriteCardImageState();
// }

// class _FavoriteCardImageState extends State<FavoriteCardImage> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       SizedBox(
//         height: 210.h,
//       ),
//       ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(8.sp)),
//           child: CachedNetworkImage(
//             width: 1.sw,
//             height: 184.h,
//             fit: BoxFit.fill,
//             imageUrl: widget.favoriteProduct.imageUrl ?? '',
//             imageBuilder: (context, imageProvider) => Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.r),
//                 image: DecorationImage(
//                   image: imageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           )),
//       widget.haveOffer
//           ? PositionedDirectional(
//               top: 5.sp,
//               start: 5.sp,
//               child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: AppColors.redColor,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Text(
//                     "- ${widget.favoriteProduct.discount} %",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 11.sp,
//                         color: Colors.white),
//                   )),
//             )
//           : SizedBox(),
//       widget.favoriteProduct.isFeatured == "1"
//           ? PositionedDirectional(
//               bottom: 5.sp,
//               start: 5.sp,
//               child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Text(
//                     "New".tr(context),
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 11.sp,
//                         color: Colors.white),
//                   )),
//             )
//           : SizedBox(),
//       PositionedDirectional(
//           top: 5.sp,
//           end: 5.sp,
//           child: InkWell(
//             onTap: () {
//               context.read<HomeCubit>().toggleFavorite(
//                   context, widget.favoriteProduct.id.toString());
//               context
//                   .read<FavoriteCubit>()
//                   .toggleFavorite(widget.favoriteProduct.id ?? -1);
//             },
//             child: Icon(
//               Icons.close,
//               color: AppColors.greyColor,
//             ),
//           )),
//       PositionedDirectional(
//           bottom: 5,
//           end: 0,
//           child: widget.soldOut
//               ? SizedBox()
//               : Container(
//                   padding: EdgeInsets.all(10),
//                   width: 36.0.sp,
//                   height: 36.0.sp,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: AppColors.primaryColor,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 5.0,
//                         spreadRadius: 1.0,
//                       ),
//                     ],
//                   ),
//                   child: SvgPicture.asset(
//                     "assets/icons/budget.svg",
//                     width: 26.sp,
//                     height: 26.sp,
//                   )))
//     ]);
//   }
// }
// ignore_for_file: must_be_immutable

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/features/favorite/data/models/favorite_model.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class FavoriteCardImage extends StatefulWidget {
  bool haveOffer;
  bool soldOut;
  final FavoriteProduct favoriteProduct;

  FavoriteCardImage(
      {super.key,
      this.haveOffer = false,
      required this.favoriteProduct,
      required this.soldOut});

  @override
  State<FavoriteCardImage> createState() => _FavoriteCardImageState();
}

class _FavoriteCardImageState extends State<FavoriteCardImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 210.h,
      ),
      ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          child: CachedNetworkImage(
            width: 1.sw,
            height: 184.h,
            fit: BoxFit.fill,
            imageUrl: widget.favoriteProduct.imageUrl ?? '',
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
      widget.haveOffer
          ? PositionedDirectional(
              top: 5.sp,
              start: 5.sp,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "- ${widget.favoriteProduct.discount} %",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                        color: Colors.white),
                  )),
            )
          : SizedBox(),
      widget.favoriteProduct.isFeatured == "1"
          ? PositionedDirectional(
              bottom: 5.sp,
              start: 5.sp,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "New".tr(context),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                        color: Colors.white),
                  )),
            )
          : SizedBox(),
      PositionedDirectional(
          top: 5.sp,
          end: 5.sp,
          child: InkWell(
            onTap: () {
              context.read<HomeCubit>().toggleFavorite(
                  context, widget.favoriteProduct.id.toString());
              context
                  .read<FavoriteCubit>()
                  .toggleFavorite(widget.favoriteProduct.id ?? -1);
            },
            child: Icon(
              Icons.close,
              color: AppColors.greyColor,
            ),
          )),
      // PositionedDirectional(
      //     bottom: 5,
      //     end: 0,
      //     child: widget.soldOut
      //         ? SizedBox()
      //         : Container(
      //             padding: EdgeInsets.all(10),
      //             width: 36.0.sp,
      //             height: 36.0.sp,
      //             decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               color: AppColors.primaryColor,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey.withOpacity(0.2),
      //                   blurRadius: 5.0,
      //                   spreadRadius: 1.0,
      //                 ),
      //               ],
      //             ),
      //             child: SvgPicture.asset(
      //               "assets/icons/budget.svg",
      //               width: 26.sp,
      //               height: 26.sp,
      //             )))
    ]);
  }
}
