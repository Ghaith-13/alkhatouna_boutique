import 'package:alkhatouna/core/extensions/colors_extensions.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class ColorsFilterFavoriteWidget extends StatefulWidget {
  const ColorsFilterFavoriteWidget({super.key});

  @override
  State<ColorsFilterFavoriteWidget> createState() =>
      _ColorsFilterFavoriteWidgetState();
}

class _ColorsFilterFavoriteWidgetState
    extends State<ColorsFilterFavoriteWidget> {
  List<String> color = [];
  void checkAndModifyColorList(String hex) {
    if (color.contains(hex)) {
      color.remove(hex);
    } else {
      color.add(hex);
    }
    context.read<FavoriteCubit>().changeColorList(color);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return state.favoriteData![state.subCategoryId].uniqueColors == null
            ? SizedBox()
            : Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state
                      .favoriteData![state.subCategoryId].uniqueColors?.length,
                  itemBuilder: (context, index) {
                    return ColorWidget(
                      color: state.favoriteData![state.subCategoryId]
                          .uniqueColors![index],
                      checkAndModifyColorList: checkAndModifyColorList,
                    );
                  },
                ),
              );
      },
    );
  }
}

class ColorWidget extends StatefulWidget {
  final String color;
  final Function checkAndModifyColorList;
  const ColorWidget(
      {super.key, required this.color, required this.checkAndModifyColorList});

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      InkWell(
        onTap: () {
          setState(() {
            checked = !checked;
          });
          widget.checkAndModifyColorList(widget.color);
        },
        child: Container(
          margin: EdgeInsetsDirectional.only(end: 15.w),
          padding: EdgeInsets.all(1),
          width: 44.0.sp,
          height: 44.0.sp,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 2.0,
            ),
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Container(
            width: 40.0.sp,
            height: 40.0.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: HexColor.fromHex(widget.color),
            ),
          ),
        ),
      ),
      Visibility(
        visible: checked,
        child: PositionedDirectional(
          start: 12.sp,
          child: InkWell(
            onTap: () {
              setState(() {
                checked = !checked;
              });
              widget.checkAndModifyColorList(widget.color);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    width: 20.sp,
                    height: 20.sp,
                    child: Center(
                        child: Icon(
                      Icons.check,
                      color: AppColors.primaryColor,
                      size: 10.sp,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
