import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:intl/intl.dart';

class RangeWidget extends StatefulWidget {
  final SubCategoryData subCategoryData;
  const RangeWidget({super.key, required this.subCategoryData});

  @override
  State<RangeWidget> createState() => _RangeWidgetState();
}

class _RangeWidgetState extends State<RangeWidget> {
  double _currentPriceStart = 0;
  double _currentPriceEnd = 0;
  late RangeValues _currentPriceRange =
      RangeValues(_currentPriceStart, _currentPriceEnd);
  @override
  void initState() {
    super.initState();
    setState(() {
      _currentPriceStart = double.parse(widget.subCategoryData.minPrice ?? "0");
      _currentPriceEnd = double.parse(widget.subCategoryData.maxPrice ?? "0");
      _currentPriceRange = RangeValues(_currentPriceStart, _currentPriceEnd);
    });
  }

  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: "",
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: 1.sw,
      color: Colors.white,
      child: widget.subCategoryData.minPrice == null ||
              widget.subCategoryData.maxPrice == null
          ? SizedBox()
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${formatCurrency.format(double.parse(widget.subCategoryData.minPrice ?? ""))} د.ع",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.blackColor),
                    ),
                    Text(
                      "${formatCurrency.format(double.parse(widget.subCategoryData.maxPrice ?? ""))} د.ع",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.blackColor),
                    )
                  ],
                ),
                RangeSlider(
                  activeColor: AppColors.primaryColor,
                  values: _currentPriceRange,
                  min: double.parse(widget.subCategoryData.minPrice ?? ""),
                  max: double.parse(widget.subCategoryData.maxPrice ?? ""),
                  divisions: int.parse((int.parse(double.parse(
                                  widget.subCategoryData.maxPrice ?? "")
                              .toStringAsFixed(0)
                              .toString()) /
                          5)
                      .toStringAsFixed(0)),
                  labels: RangeLabels(
                    _currentPriceRange.start.toStringAsFixed(2),
                    _currentPriceRange.end.toStringAsFixed(2),
                  ),
                  onChanged: (RangeValues newValues) {
                    setState(() {
                      _currentPriceRange = newValues;
                    });
                    context
                        .read<HomeCubit>()
                        .changeMinPrice(_currentPriceRange.start);
                    context
                        .read<HomeCubit>()
                        .changeMaxPrice(_currentPriceRange.end);
                  },
                ),
              ],
            ),
    );
  }
}
