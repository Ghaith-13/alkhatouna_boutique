import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class dimensionsFavWidget extends StatefulWidget {
  const dimensionsFavWidget({super.key});

  @override
  State<dimensionsFavWidget> createState() => _SizesFavWidgetState();
}

class _SizesFavWidgetState extends State<dimensionsFavWidget> {
  List<String> dimensions = [];
  void checkAndModifySizesList(String dimension) {
    if (dimensions.contains(dimension)) {
      dimensions.remove(dimension);
    } else {
      dimensions.add(dimension);
    }
    context.read<FavoriteCubit>().changedimensionsList(dimensions);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      color: Colors.white,
      child: Container(
        height: 40.h,
        width: 1.sw,
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return state.favoriteData![state.subCategoryId].uniqueDimensions ==
                    null
                ? SizedBox()
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.favoriteData![state.subCategoryId]
                        .uniqueDimensions!.length,
                    itemBuilder: (context, index) {
                      return SizeWidget(
                        dimension: state.favoriteData![state.subCategoryId]
                            .uniqueDimensions![index],
                        checkAndModifySizesList: checkAndModifySizesList,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

class SizeWidget extends StatefulWidget {
  final String dimension;
  final Function checkAndModifySizesList;
  const SizeWidget(
      {super.key,
      required this.dimension,
      required this.checkAndModifySizesList});

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          checked = !checked;
        });
        widget.checkAndModifySizesList(widget.dimension);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 15.w),
        height: 40.sp,
        width: 40.sp,
        decoration: BoxDecoration(
          color: checked ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(
            color: AppColors.blackColor,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            widget.dimension,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: checked ? Colors.white : AppColors.blackColor),
          ),
        ),
      ),
    );
  }
}
