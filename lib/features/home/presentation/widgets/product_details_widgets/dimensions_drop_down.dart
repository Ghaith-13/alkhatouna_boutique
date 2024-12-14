import 'package:alkhatouna/features/home/data/models/product_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class DimensionsDropDown extends StatefulWidget {
  final ProductData productdata;
  const DimensionsDropDown({super.key, required this.productdata});

  @override
  State<DimensionsDropDown> createState() => _DimensionsDropDownState();
}

class _DimensionsDropDownState extends State<DimensionsDropDown> {
  final List<String> items = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      items.add("Other");
    });
    if (widget.productdata.product!.dimensions != null) {
      for (int i = 0; i < widget.productdata.product!.dimensions!.length; i++) {
        setState(() {
          items.add(widget.productdata.product!.dimensions![i].name ?? "");
        });
      }
      // setState(() {
      //   items.add("Other".tr(context));
      // });
    }
    if (items.length == 1) {
      context.read<HomeCubit>().changedimensions("default");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return items.length == 1
            ? SizedBox()
            : DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Expanded(
                        child: Text(
                          state.dimensions.isEmpty
                              ? 'dimensions'.tr(context)
                              : state.dimensions == "Other"
                                  ? "Other".tr(context)
                                  : state.dimensions,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item == "Other" ? "Other".tr(context) : item,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  // value: selectedValue,
                  onChanged: (value) {
                    context.read<HomeCubit>().changedimensions(value!);
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 40.h,
                    width: 137.w,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 16.sp,
                    ),
                    iconSize: 14,
                    iconEnabledColor: AppColors.blackColor,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    offset: const Offset(-20, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: WidgetStateProperty.all(6),
                      thumbVisibility: WidgetStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    // height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              );
      },
    );
  }
}
