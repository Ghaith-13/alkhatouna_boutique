import 'package:alkhatouna/core/extensions/colors_extensions.dart';
import 'package:alkhatouna/features/home/data/models/product_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class ColorDropDown extends StatefulWidget {
  final ProductData productData;
  const ColorDropDown({super.key, required this.productData});

  @override
  State<ColorDropDown> createState() => _ColorDropDownState();
}

class _ColorDropDownState extends State<ColorDropDown> {
  final List<String> colors = [];

  @override
  void initState() {
    super.initState();
    if (widget.productData.product!.colors != null) {
      for (int i = 0; i < widget.productData.product!.colors!.length; i++) {
        setState(() {
          colors.add(widget.productData.product!.colors![i].colorHex ?? "");
        });
      }
      colors.add("Other");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: state.selectedColor.isEmpty
                      ? Text(
                          'Colors'.tr(context),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      : state.selectedColor == "Other"
                          ? Text(
                              "Other".tr(context),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          : CircleAvatar(
                              backgroundColor:
                                  HexColor.fromHex(state.selectedColor),
                            ),
                ),
              ],
            ),
            items: colors
                .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: item == "Other"
                        ? Text(
                            "Other".tr(context),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: HexColor.fromHex(item),
                              ),
                            ),
                          )

                    // Text(
                    //   item,
                    //   style: TextStyle(
                    //     fontSize: 14.sp,
                    //     fontWeight: FontWeight.w500,
                    //     color: AppColors.primaryColor,
                    //   ),
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    ))
                .toList(),
            // value: selectedValue,
            onChanged: (value) {
              context.read<HomeCubit>().changeColorSelected(value!);
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     backgroundColor: AppColors.primaryColor,
              //     padding: EdgeInsets.only(
              //         bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
              //     content: Text(
              //       "Selected Successfully".tr(context),
              //       style: const TextStyle(color: Colors.white),
              //     ),
              //     duration: const Duration(seconds: 2),
              //   ),
              // );
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
              iconEnabledColor: Colors.black,
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
