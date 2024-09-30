import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class WeightsFavWidget extends StatefulWidget {
  const WeightsFavWidget({super.key});

  @override
  State<WeightsFavWidget> createState() => _SizesFavWidgetState();
}

class _SizesFavWidgetState extends State<WeightsFavWidget> {
  List<String> weights = [];
  void checkAndModifySizesList(String weght) {
    if (weights.contains(weght)) {
      weights.remove(weght);
    } else {
      weights.add(weght);
    }
    context.read<FavoriteCubit>().changeweghitsList(weights);
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
            return state.favoriteData![state.subCategoryId].uniqueWeights ==
                    null
                ? SizedBox()
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.favoriteData![state.subCategoryId]
                        .uniqueWeights!.length,
                    itemBuilder: (context, index) {
                      return SizeWidget(
                        weght: state.favoriteData![state.subCategoryId]
                            .uniqueWeights![index],
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
  final String weght;
  final Function checkAndModifySizesList;
  const SizeWidget(
      {super.key, required this.weght, required this.checkAndModifySizesList});

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
        widget.checkAndModifySizesList(widget.weght);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 15.w),
        padding: EdgeInsetsDirectional.all(5.sp),
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
            widget.weght,
            textAlign: TextAlign.center,
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
