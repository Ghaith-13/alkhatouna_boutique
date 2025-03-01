import 'dart:math';

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/bloc_provider.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alkhatouna/features/cart/presentation/pages/shipping_addresses_screen.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/features/profile/presentation/pages/add_newnumber_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;

class VerficationPhoneAddress extends StatefulWidget {
  final String phoneNumber;
  final String lat;
  final bool fromMakeAddressDefault;
  final bool fromSetting;
  final bool fromCheckOut;
  final bool fromUpdate;
  final bool fromHomePage;
  final String log;
  final String? addressId;
  const VerficationPhoneAddress(
      {super.key,
      required this.phoneNumber,
      this.addressId = "null",
      this.fromMakeAddressDefault = false,
      this.fromHomePage = false,
      this.fromUpdate = false,
      this.fromCheckOut = false,
      this.fromSetting = false,
      required this.lat,
      required this.log});

  @override
  State<VerficationPhoneAddress> createState() =>
      _VerficationPhoneAddressState();
}

class _VerficationPhoneAddressState extends State<VerficationPhoneAddress> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<AuthCubit>()
        .sendVerficationPhoneAddress(context, widget.phoneNumber);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    context.read<AuthCubit>().changeverficationPhoneNumber("");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Stack(children: [
          Scaffold(
            appBar: AppConstant.customAppBar(context, "", true),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'The code has been sent to the number'
                                .tr(context),
                          ),
                          TextSpan(
                              text: ' ${widget.phoneNumber} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor)),
                          TextSpan(
                            text: widget.fromSetting || widget.fromUpdate
                                ? "to verify it.".tr(context)
                                : 'which was used in the address to verify it.'
                                    .tr(context),
                          ),
                        ],
                      ),
                    ),
                    20.ph,
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, authState) {
                        return Directionality(
                          textDirection: TextDirection.ltr,
                          child: PinCodeTextField(
                            keyboardType: TextInputType.number,
                            appContext: context,
                            length: 4,
                            onChanged: (value) {},
                            onCompleted: (value) {
                              if (value == authState.verficationPhoneNumber) {
                                if (widget.fromHomePage) {
                                  context
                                      .read<ProfileCubit>()
                                      .updateUpdatePhone(
                                          context, widget.phoneNumber,
                                          fromHomePage: widget.fromHomePage);
                                } else if (widget.fromUpdate) {
                                  context
                                      .read<ProfileCubit>()
                                      .updateUpdatePhone(
                                          context, widget.phoneNumber);
                                } else if (widget.fromSetting) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const AddNewnumberScreen(),
                                    ),
                                  );
                                } else if (widget.fromMakeAddressDefault) {
                                  context.read<CartCubit>().makeAdressDefault(
                                      widget.addressId.toString());
                                  context
                                      .read<CartCubit>()
                                      .makePhoneVerfication(
                                          makeAddressDefault: true,
                                          widget.addressId.toString());
                                } else if (widget.fromCheckOut) {
                                  context
                                      .read<CartCubit>()
                                      .makePhoneVerfication(
                                          fromCheckOut: true,
                                          widget.addressId.toString());
                                } else {
                                  context.read<CartCubit>().addAdress(
                                      widget.log.toString(),
                                      widget.lat.toString(),
                                      addressID: widget.addressId.toString());
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.redColor,
                                    padding: EdgeInsets.only(
                                        bottom: 20.h,
                                        top: 20.h,
                                        left: 20.w,
                                        right: 20.w),
                                    content: Text(
                                      'The PIN code does not match the code sent.'
                                          .tr(context),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            textStyle: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 75.sp,
                                fontWeight: FontWeight.bold),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            enableActiveFill: true,
                            pinTheme: PinTheme(
                                disabledColor: Colors.white,
                                selectedFillColor: Colors.white,
                                activeFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                fieldHeight: 100.h,
                                fieldWidth: 75.w,
                                shape: PinCodeFieldShape.box,
                                activeColor: AppColors.primaryColor,
                                inactiveColor: AppColors.primaryColor,
                                selectedColor:
                                    const Color.fromARGB(153, 0, 0, 0),
                                borderRadius: BorderRadius.circular(8.sp)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (state.loadingAddAdress)
            ModalBarrier(
              dismissible: false,
              color: Colors.black.withOpacity(0.5),
            ),
          if (state.loadingAddAdress)
            Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              ),
            )
        ]);
      },
    );
  }
}
