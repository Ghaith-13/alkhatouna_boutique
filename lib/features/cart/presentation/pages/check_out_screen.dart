import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/features/cart/data/models/check_out_model.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alkhatouna/features/cart/presentation/pages/check_out_skeleton.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/cart/presentation/pages/shipping_addresses_screen.dart';
import 'package:intl/intl.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<String> images = [
    "assets/images/fedex.png",
    "assets/images/usps.png",
    "assets/images/dhl.png"
  ];

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCheckOut(context);
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<CartCubit>().changepromoCode("");
    context.read<CartCubit>().changepaymentMethod("");
    context.read<CartCubit>().selectedBenefitId("");
  }

  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: "",
  );
  final formatCurrencyForPercentge = new NumberFormat.simpleCurrency(
    decimalDigits: 2,
    name: "",
  );

  DateTime? _selectedDateTime;

  Future<void> _selectDateTime(BuildContext context, var checkData) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
        context.read<CartCubit>().sendOrder(
            checkData.promoCode == null ? "" : checkData.promoCode!.code!,
            "pre_order",
            DateFormat('yyyy-MM-dd HH:mm').format(_selectedDateTime!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppConstant.customAppBar(
        context,
        "Checkout",
        true,
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return state.laodingCheckOut
                  ? SizedBox()
                  : state.checkData == null
                      ? SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   "${"My Points".tr(context)} : ",
                              //   style: TextStyle(
                              //       color: AppColors.primaryColor,
                              //       fontSize: 12.sp),
                              // ),

                              Icon(
                                Icons.point_of_sale_outlined,
                                color: AppColors.primaryColor,
                                size: 16.sp,
                              ),
                              5.horizontalSpace,

                              Text(
                                "${formatCurrency.format(double.parse(state.checkData!.total_points.toString()))}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
            },
          )
        ],
        withTranslate: true,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.laodingCheckOut
              ? CheckOutSkeleton()
              : state.checkData == null
                  ? CheckOutSkeleton()
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(12.0.sp),
                        child: BlocBuilder<LocaleCubit, LocaleState>(
                          builder: (context, locale) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Shipping address".tr(context),
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    state.checkData!.defaultAddress == null
                                        ? InkWell(
                                            onTap: () {
                                              AppConstant.customNavigation(
                                                  context,
                                                  ShippingAddressesScreen(),
                                                  -1,
                                                  0);
                                            },
                                            child: Text(
                                              "Change".tr(context),
                                              style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        : SizedBox()
                                  ],
                                ),
                                20.ph,
                                state.checkData!.defaultAddress == null
                                    ? SizedBox()
                                    : FadeInLeft(
                                        child: Container(
                                            width: 1.sw,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0.sp),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${state.checkData!.defaultAddress!.title}",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          AppConstant
                                                              .customNavigation(
                                                                  context,
                                                                  ShippingAddressesScreen(),
                                                                  -1,
                                                                  0);
                                                        },
                                                        child: Text(
                                                          "Change".tr(context),
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .primaryColor,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  10.ph,
                                                  SizedBox(
                                                    width: 0.7.sw,
                                                    child: BlocBuilder<
                                                        LocaleCubit,
                                                        LocaleState>(
                                                      builder:
                                                          (context, locale) {
                                                        return Text(
                                                          "${locale.locale.languageCode == "en" ? state.checkData!.defaultAddress!.country?.nameEn ?? "" : locale.locale.languageCode == "ar" ? state.checkData!.defaultAddress!.country?.nameAr ?? "" : state.checkData!.defaultAddress!.country?.nameKu ?? ""}  ${locale.locale.languageCode == "en" ? state.checkData!.defaultAddress!.province?.nameEn ?? "" : locale.locale.languageCode == "ar" ? state.checkData!.defaultAddress!.province?.nameAr ?? "" : state.checkData!.defaultAddress!.province?.nameKu ?? ""}  ${locale.locale.languageCode == "en" ? state.checkData!.defaultAddress!.area?.nameEn ?? "" : locale.locale.languageCode == "ar" ? state.checkData!.defaultAddress!.area?.nameAr ?? "" : state.checkData!.defaultAddress!.area?.nameKu ?? ""}  ${locale.locale.languageCode == "en" ? state.checkData!.defaultAddress!.subArea?.nameEn ?? "" : locale.locale.languageCode == "ar" ? state.checkData!.defaultAddress!.subArea?.nameAr ?? "" : state.checkData!.defaultAddress!.subArea?.nameKu ?? ""} ",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                20.ph,
                                // Opacity(
                                //   opacity: 0.5,
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         "Payment".tr(context),
                                //         style: TextStyle(
                                //             fontSize: 16.sp,
                                //             fontWeight: FontWeight.w600),
                                //       ),
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.only(
                                //             end: 12.w),
                                //         child: InkWell(
                                //           onTap: () {
                                //             // AppConstant.customNavigation(
                                //             //     context, PaymentMethods(), -1, 0);
                                //           },
                                //           child: Text(
                                //             "Change".tr(context),
                                //             style: TextStyle(
                                //                 color: AppColors.primaryColor,
                                //                 fontSize: 14.sp,
                                //                 fontWeight: FontWeight.w500),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // 10.ph,
                                // Opacity(
                                //   opacity: 0.5,
                                //   child: FadeInRight(
                                //     child: Row(
                                //       children: [
                                //         Container(
                                //           width: 64.w,
                                //           height: 38.h,
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //             borderRadius:
                                //                 BorderRadius.circular(8.sp),
                                //           ),
                                //           child: Center(
                                //             child: Image.asset(
                                //                 "assets/images/mastercard.png"),
                                //           ),
                                //         ),
                                //         40.pw,
                                //         Text(
                                //           "**** **** **** 3947",
                                //           style: TextStyle(
                                //               fontSize: 14.sp,
                                //               fontWeight: FontWeight.w400),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // 10.ph,
                                Text(
                                  "${"Cash method".tr(context)} : ${state.paymentMethod!.tr(context)}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),

                                state.checkData!.can_pay_with_points == false
                                    ? SizedBox()
                                    : Row(
                                        children: [
                                          Radio(
                                            fillColor:
                                                WidgetStateProperty.all<Color>(
                                                    AppColors.primaryColor),
                                            value: "Cash",
                                            groupValue: state.paymentMethod,
                                            onChanged: (value) {
                                              context
                                                  .read<CartCubit>()
                                                  .changepaymentMethod("Cash");
                                              setState(() {
                                                state.paymentMethod = "Cash";
                                              });
                                            },
                                          ),
                                          10.horizontalSpace,
                                          Text("Cash".tr(context))
                                        ],
                                      ),
                                state.checkData!.can_pay_with_points == false
                                    ? SizedBox()
                                    : Row(
                                        children: [
                                          Radio(
                                            fillColor:
                                                WidgetStateProperty.all<Color>(
                                                    AppColors.primaryColor),
                                            value: "Points",
                                            groupValue: state.paymentMethod,
                                            onChanged: (value) {
                                              context
                                                  .read<CartCubit>()
                                                  .changepaymentMethod(
                                                      "Points");
                                              setState(() {
                                                state.paymentMethod = "Points";
                                              });
                                            },
                                          ),
                                          10.horizontalSpace,
                                          Text("Points".tr(context)),
                                          20.horizontalSpace,
                                          Text(
                                            "- ${formatCurrency.format(double.parse(state.checkData!.paid_points.toString()))}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                20.ph,

                                Stack(
                                  children: [
                                    Container(
                                      height: 50.h,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsetsDirectional.only(end: 10.w),
                                      child: TextFormField(
                                        readOnly:
                                            state.checkData!.promoCode == null
                                                ? false
                                                : true,
                                        initialValue:
                                            state.checkData!.promoCode == null
                                                ? ""
                                                : state
                                                    .checkData!.promoCode!.code,
                                        onChanged: (String value) {
                                          context
                                              .read<CartCubit>()
                                              .changepromoCode(value);
                                        },
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          hintText: 'Enter your promo code'
                                              .tr(context),
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    PositionedDirectional(
                                      end: 0,
                                      child: InkWell(
                                        onTap: () {
                                          print(state.checkData!.promoCode);
                                          if (state.promoCode != null) {
                                            if (state.promoCode != "") {
                                              context
                                                  .read<CartCubit>()
                                                  .getCheckOut(context,
                                                      fromPromoCode: true);
                                            }
                                          }
                                        },
                                        child: CircleAvatar(
                                          radius: 25.sp,
                                          backgroundColor: AppColors.blackColor,
                                          child: Icon(
                                            Icons.arrow_forward_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                state.checkData?.promoCode == null
                                    ? SizedBox()
                                    : InkWell(
                                        onTap: () {
                                          context
                                              .read<CartCubit>()
                                              .changepromoCode("");
                                          context.read<CartCubit>().getCheckOut(
                                                context,
                                              );
                                        },
                                        child: Text(
                                          "Remove promo code".tr(context),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Colors.red),
                                        ),
                                      ),
                                20.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BlocBuilder<LocaleCubit, LocaleState>(
                                      builder: (context, locale) {
                                        return Text(
                                          "${"Your special benefits".tr(context)} : ${state.checkData?.appliedBenefit != null ? locale.locale.languageCode == "en" ? state.checkData?.appliedBenefit?.description_en : locale.locale.languageCode == "ar" ? state.checkData?.appliedBenefit?.description_ar : state.checkData?.appliedBenefit?.description_ku ?? "" : ""}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        );
                                      },
                                    ),
                                    if (state.checkData?.appliedBenefit != null)
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<CartCubit>()
                                              .selectedBenefitId("");
                                          context.read<CartCubit>().getCheckOut(
                                                context,
                                              );
                                        },
                                        child: Text(
                                          "Cancel".tr(context),
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                  ],
                                ),

                                for (AvailableBenefits item
                                    in state.checkData!.availableBenefits!)
                                  Row(
                                    children: [
                                      Radio(
                                        fillColor:
                                            WidgetStateProperty.all<Color>(
                                                AppColors.primaryColor),
                                        value: item.benefitId,
                                        groupValue: state.selectedBenefitId,
                                        onChanged: (value) {
                                          context
                                              .read<CartCubit>()
                                              .selectedBenefitId(value);
                                          context.read<CartCubit>().getCheckOut(
                                                context,
                                              );
                                        },
                                      ),
                                      10.horizontalSpace,
                                      Text(item.benefit!.benefitType ==
                                              "free_delivery"
                                          ? "Free delivery".tr(context)
                                          : item.benefit!.benefitType ==
                                                  "discount"
                                              ? "${"Make discount on your order".tr(context)} ( ${item.benefit!.value} % )"
                                              : item.benefit!.benefitType ??
                                                  ""),
                                    ],
                                  ),

                                20.ph,

                                // Text(
                                //   "Delivery method".tr(context),
                                //   style: TextStyle(
                                //       fontSize: 16.sp, fontWeight: FontWeight.w600),
                                // ),
                                // 10.ph,
                                // SizedBox(
                                //   height: 92.h,
                                //   child: ListView.builder(
                                //     scrollDirection: Axis.horizontal,
                                //     shrinkWrap: true,
                                //     itemCount: 3,
                                //     itemBuilder: (context, index) {
                                //       return FadeInDown(
                                //         child: Container(
                                //           margin: EdgeInsetsDirectional.only(
                                //               start: 2.w,
                                //               end: 20.w,
                                //               top: 10.h,
                                //               bottom: 10.h),
                                //           width: 100.w,
                                //           height: 72.h,
                                //           decoration: BoxDecoration(
                                //             boxShadow: [
                                //               BoxShadow(
                                //                 color: Colors.grey.withOpacity(0.5),
                                //                 spreadRadius: 0.5,
                                //                 blurRadius: 5,
                                //                 // offset: Offset(0, 3),
                                //               ),
                                //             ],
                                //             color: Colors.white,
                                //             borderRadius:
                                //                 BorderRadius.circular(8.sp),
                                //           ),
                                //           child: Center(
                                //             child: Column(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.center,
                                //               children: [
                                //                 Image.asset(images[index]),
                                //                 5.ph,
                                //                 Text(
                                //                   " 2-3 days",
                                //                   style: TextStyle(
                                //                       color: AppColors.greyColor,
                                //                       fontSize: 11.sp,
                                //                       fontWeight: FontWeight.w400),
                                //                 )
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       );
                                //     },
                                //   ),
                                // ),
                                // 20.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${"Total Amount before discount".tr(context)} :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: AppColors.greyColor),
                                    ),
                                    Text(
                                      "${formatCurrency.format(double.parse(state.checkData!.totalAmount.toString()))} ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                                10.ph,

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${"Product Discount value".tr(context)} :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: AppColors.greyColor),
                                    ),
                                    Text(
                                      "${formatCurrency.format(double.parse(state.checkData!.productsDiscountValue.toString()))}  (${formatCurrencyForPercentge.format(double.parse(state.checkData!.discountPercentage.toString()))} %)",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                                10.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${"Total Amount After Discount".tr(context)} :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: AppColors.greyColor),
                                    ),
                                    Text(
                                      "${formatCurrency.format(double.parse(state.checkData!.totalAmountAfterDiscount.toString()))} ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                                10.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${"Delivery".tr(context)} :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: AppColors.greyColor),
                                    ),
                                    Text(
                                      "${formatCurrency.format(double.parse(state.checkData!.delivryFees.toString()))} ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                                10.ph,
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       "${"Tax".tr(context)} :",
                                //       style: TextStyle(
                                //           fontWeight: FontWeight.w500,
                                //           fontSize: 14.sp,
                                //           color: AppColors.greyColor),
                                //     ),
                                //     Text(
                                //       "${formatCurrency.format(double.parse(state.checkData!.total_tax.toString() ?? ""))} ",
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.w600,
                                //         fontSize: 14.sp,
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // 10.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${"Summary".tr(context)} :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: AppColors.greyColor),
                                    ),
                                    Text(
                                      "${formatCurrency.format(double.parse(state.checkData!.grandTotal.toString()))} ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                                10.ph,

                                20.ph,
                                SizedBox(
                                  width: 1.sw,
                                  height: 48.h,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (state.loadingSendOrder) {
                                        } else {
                                          bool confirmed =
                                              await showConfirmationDialogForCheckOut(
                                                  context,
                                                  state.checkData!
                                                      .orderConfirmationMessage);
                                          if (confirmed) {
                                            // Proceed with the action
                                            if (state.checkData!
                                                    .defaultAddress ==
                                                null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  backgroundColor: Colors.red,
                                                  padding: EdgeInsets.only(
                                                      bottom: 30.h,
                                                      top: 30.h,
                                                      left: 50.w,
                                                      right: 50.w),
                                                  content: Text(
                                                    "Please add address"
                                                        .tr(context),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  duration: const Duration(
                                                      seconds: 2),
                                                ),
                                              );
                                            } else if (state
                                                .paymentMethod!.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  backgroundColor: Colors.red,
                                                  padding: EdgeInsets.only(
                                                      bottom: 30.h,
                                                      top: 30.h,
                                                      left: 50.w,
                                                      right: 50.w),
                                                  content: Text(
                                                    "Please select payment method"
                                                        .tr(context),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  duration: const Duration(
                                                      seconds: 2),
                                                ),
                                              );
                                            } else {
                                              context
                                                  .read<CartCubit>()
                                                  .sendOrder(
                                                      state.checkData!
                                                                  .promoCode ==
                                                              null
                                                          ? ""
                                                          : state.checkData!
                                                              .promoCode!.code!,
                                                      '',
                                                      '');
                                            }
                                          } else {}
                                        }
                                      },
                                      child: state.loadingSendOrder
                                          ? CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              "SUBMIT ORDER".tr(context),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp),
                                            )),
                                ),
                                20.verticalSpace,
                                SizedBox(
                                  width: 1.sw,
                                  height: 48.h,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (state.loadingSendOrder) {
                                        } else {
                                          // Proceed with the action
                                          if (state.checkData!.defaultAddress ==
                                              null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.red,
                                                padding: EdgeInsets.only(
                                                    bottom: 30.h,
                                                    top: 30.h,
                                                    left: 50.w,
                                                    right: 50.w),
                                                content: Text(
                                                  "Please add address"
                                                      .tr(context),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                duration:
                                                    const Duration(seconds: 2),
                                              ),
                                            );
                                          } else if (state
                                              .paymentMethod!.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.red,
                                                padding: EdgeInsets.only(
                                                    bottom: 30.h,
                                                    top: 30.h,
                                                    left: 50.w,
                                                    right: 50.w),
                                                content: Text(
                                                  "Please select payment method"
                                                      .tr(context),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                duration:
                                                    const Duration(seconds: 2),
                                              ),
                                            );
                                          } else {
                                            _selectDateTime(
                                                context, state.checkData);
                                          }
                                        }
                                      },
                                      child: state.loadingSendOrder
                                          ? CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              "Book The Product".tr(context),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp),
                                            )),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    );
        },
      ),
    );
  }
}

bool isEnglish(String text) {
  RegExp englishRegex = RegExp(r'^[a-zA-Z\s]+$');
  return englishRegex.hasMatch(text);
}

Future<bool> showConfirmationDialogForCheckOut(
    BuildContext context, String? orderConfirmationMessage) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Confirmation'.tr(context)),
      content: Container(
        height: 150.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${'Are you sure you want to proceed?'.tr(context)} "),
              orderConfirmationMessage == null
                  ? SizedBox()
                  : Text(
                      "$orderConfirmationMessage",
                      textAlign: isEnglish(orderConfirmationMessage)
                          ? TextAlign.left
                          : TextAlign.right,
                    ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'.tr(context), style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'.tr(context), style: TextStyle(color: Colors.black)),
        ),
      ],
    ),
  );
}
