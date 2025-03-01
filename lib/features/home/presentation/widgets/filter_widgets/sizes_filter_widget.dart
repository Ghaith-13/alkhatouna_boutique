import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class SizesFilterWidget extends StatefulWidget {
  const SizesFilterWidget({super.key});

  @override
  State<SizesFilterWidget> createState() => _SizesFilterWidgetState();
}

class _SizesFilterWidgetState extends State<SizesFilterWidget> {
  List<String> sizes = [];
  void checkAndModifySizesList(String size) {
    if (sizes.contains(size)) {
      sizes.remove(size);
    } else {
      sizes.add(size);
    }
    context.read<HomeCubit>().changeSizesList(sizes);
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
            return state.subCategoriesData!.uniqueSizes == null
                ? SizedBox()
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.subCategoriesData!.uniqueSizes!.length,
                    itemBuilder: (context, index) {
                      return SizeWidget(
                        size: state.subCategoriesData!.uniqueSizes![index],
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
            widget.size,
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
