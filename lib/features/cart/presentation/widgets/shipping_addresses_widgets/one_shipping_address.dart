import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/cart/data/models/get_address_model.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alkhatouna/features/cart/presentation/pages/add_new_address.dart';
import 'package:alkhatouna/features/cart/presentation/pages/verfication_phone_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';

class OneShippingAddress extends StatefulWidget {
  final Addresses adress;
  const OneShippingAddress({super.key, required this.adress});

  @override
  State<OneShippingAddress> createState() => _OneShippingAddressState();
}

class _OneShippingAddressState extends State<OneShippingAddress> {
  @override
  Widget build(BuildContext context) {
    // print(widget.adress.isDefault);
    return Container(
        margin: EdgeInsets.all(12.sp),
        width: 1.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.adress.title}",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  PopupMenuButton(
                    color: Colors.white,
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("Edite".tr(context)),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('Delete'.tr(context)),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 1) {
                        // Handle edit action
                        AppConstant.customNavigation(
                            context,
                            AddNewAddress(
                              update: true,
                              lat: widget.adress.latitude,
                              log: widget.adress.longitude,
                              address: widget.adress,
                            ),
                            -1,
                            0);
                      } else if (value == 2) {
                        // Handle delete action
                        context
                            .read<CartCubit>()
                            .deleteAddress(widget.adress.id.toString());
                        print('Delete pressed');
                      }
                    },
                  ),
                  // InkWell(
                  //   onTap: () {

                  //   },
                  //   child: Text(
                  //     "Edite".tr(context),
                  //     style: TextStyle(
                  //         color: AppColors.primaryColor,
                  //         fontSize: 14.sp,
                  //         fontWeight: FontWeight.w500),
                  //   ),
                  // ),
                ],
              ),
              10.ph,
              Row(
                children: [
                  5.pw,
                  Icon(
                    Icons.phone,
                    color: AppColors.primaryColor,
                  ),
                  20.pw,
                  SizedBox(
                    width: 0.5.sw,
                    child: Text(
                      "${widget.adress.phone}",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              widget.adress.phone2 == null
                  ? SizedBox()
                  : widget.adress.phone2 == ""
                      ? SizedBox()
                      : 10.ph,
              widget.adress.phone2 == null
                  ? SizedBox()
                  : widget.adress.phone2 == ""
                      ? SizedBox()
                      : Row(
                          children: [
                            5.pw,
                            Icon(
                              Icons.phone,
                              color: AppColors.primaryColor,
                            ),
                            20.pw,
                            SizedBox(
                              width: 0.5.sw,
                              child: Text(
                                "${widget.adress.phone2 ?? ""}",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
              10.ph,
              BlocBuilder<LocaleCubit, LocaleState>(
                builder: (context, locale) {
                  return Row(
                    children: [
                      5.pw,
                      Icon(
                        Icons.map_outlined,
                        color: AppColors.primaryColor,
                      ),
                      20.pw,
                      SizedBox(
                        width: 0.7.sw,
                        child: Text(
                          "${locale.locale.languageCode == "en" ? widget.adress.country?.nameEn ?? "" : locale.locale.languageCode == "ar" ? widget.adress.country?.nameAr ?? "" : widget.adress.country?.nameKu ?? ""} - ${locale.locale.languageCode == "en" ? widget.adress.province?.nameEn ?? "" : locale.locale.languageCode == "ar" ? widget.adress.province?.nameAr ?? "" : widget.adress.province?.nameKu ?? ""} ${locale.locale.languageCode == "en" ? widget.adress.area?.nameEn == null ? "" : widget.adress.area?.nameEn == "" ? "" : "-" : locale.locale.languageCode == "ar" ? widget.adress.area?.nameAr == null ? "" : widget.adress.area?.nameAr == "" ? "" : "-" : widget.adress.area?.nameKu == null ? "" : widget.adress.area?.nameKu == "" ? "" : "-"} ${locale.locale.languageCode == "en" ? widget.adress.area?.nameEn ?? "" : locale.locale.languageCode == "ar" ? widget.adress.area?.nameAr ?? "" : widget.adress.area?.nameKu ?? ""} ${locale.locale.languageCode == "en" ? widget.adress.subArea?.nameEn == null ? "" : widget.adress.subArea?.nameEn == "" ? "" : "-" : locale.locale.languageCode == "ar" ? widget.adress.subArea?.nameAr == null ? "" : widget.adress.subArea?.nameAr == "" ? "" : "-" : widget.adress.subArea?.nameKu == null ? "" : widget.adress.subArea?.nameKu == "" ? "" : "-"} ${locale.locale.languageCode == "en" ? widget.adress.subArea?.nameEn ?? "" : locale.locale.languageCode == "ar" ? widget.adress.subArea?.nameAr ?? "" : widget.adress.subArea?.nameKu ?? ""}",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  );
                },
              ),
              widget.adress.notes == null ? SizedBox() : 10.ph,
              widget.adress.notes == null
                  ? SizedBox()
                  : Row(
                      children: [
                        5.pw,
                        Icon(
                          Icons.note,
                          color: AppColors.primaryColor,
                        ),
                        20.pw,
                        SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            "${widget.adress.notes}",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
              widget.adress.instagram == null ? SizedBox() : 10.ph,
              widget.adress.instagram == null
                  ? SizedBox()
                  : Row(
                      children: [
                        Image.asset(
                          "assets/images/insta_icon.png",
                          height: 30.h,
                        ),
                        Text(
                          "${widget.adress.instagram}",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
              10.ph,
              Row(
                children: [
                  SizedBox(
                    width: 20.sp,
                    height: 20.sp,
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.black,
                      value: widget.adress.isDefault.toString() == "0"
                          ? false
                          : true,
                      onChanged: (value) {
                        if (widget.adress.is_phone_verified.toString() == "0") {
                          AppConstant.customNavigation(
                              context,
                              VerficationPhoneAddress(
                                fromMakeAddressDefault: true,
                                phoneNumber: widget.adress.phone.toString(),
                                lat: widget.adress.latitude.toString(),
                                log: widget.adress.longitude.toString(),
                                addressId: widget.adress.id.toString(),
                              ),
                              -1,
                              0);
                        } else {
                          context
                              .read<CartCubit>()
                              .makeAdressDefault(widget.adress.id.toString());
                        }
                        // context.read<CartCubit>().checkphoneVerfied(
                        //     context,
                        //     widget.adress.id.toString(),
                        //     widget.adress.phone,
                        //     widget.adress.latitude,
                        //     widget.adress.longitude);
                      },
                    ),
                  ),
                  5.pw,
                  Text(
                    "Use as the shipping address".tr(context),
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
