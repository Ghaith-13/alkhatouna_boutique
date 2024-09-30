import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class DimensionsFilterWidget extends StatefulWidget {
  const DimensionsFilterWidget({super.key});

  @override
  State<DimensionsFilterWidget> createState() => _WeightsFilterWidgetState();
}

class _WeightsFilterWidgetState extends State<DimensionsFilterWidget> {
  List<String> dimensions = [];
  void checkAndModifySizesList(String dimension) {
    if (dimensions.contains(dimension)) {
      dimensions.remove(dimension);
    } else {
      dimensions.add(dimension);
    }
    context.read<HomeCubit>().changedimensionsList(dimensions);
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
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.subCategoriesData![state.subCategoryId]
                        .uniqueDimensions ==
                    null
                ? SizedBox()
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.subCategoriesData![state.subCategoryId]
                        .uniqueDimensions!.length,
                    itemBuilder: (context, index) {
                      return SizeWidget(
                        size: state.subCategoriesData![state.subCategoryId]
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
  final String size;
  final Function checkAndModifySizesList;
  const SizeWidget(
      {super.key, required this.size, required this.checkAndModifySizesList});

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
        widget.checkAndModifySizesList(widget.size);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 15.w),
        padding: EdgeInsetsDirectional.all(10.sp),
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
            widget.size,
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
