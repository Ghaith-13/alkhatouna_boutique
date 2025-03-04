// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/auth/data/models/whatsapp_settings_model.dart';
import 'package:alkhatouna/features/cart/data/models/add_adress_model.dart';
import 'package:alkhatouna/features/cart/data/models/check_out_model.dart';
import 'package:alkhatouna/features/cart/data/models/check_phone_verfied_model.dart';
import 'package:alkhatouna/features/cart/data/models/delete_address_model.dart';
import 'package:alkhatouna/features/cart/data/models/get_address_model.dart';
import 'package:alkhatouna/features/cart/data/models/get_cart_model.dart';
import 'package:alkhatouna/features/cart/data/models/make_default_model.dart';
import 'package:alkhatouna/features/cart/data/models/make_phone_verfied_model.dart';
import 'package:alkhatouna/features/cart/data/models/remove_from_cart_model.dart';
import 'package:alkhatouna/features/cart/data/models/send_check_out.dart';
import 'package:alkhatouna/features/cart/data/repositories/cart_repo.dart';
import 'package:alkhatouna/features/cart/presentation/pages/check_out_screen.dart';
import 'package:alkhatouna/features/cart/presentation/pages/confetti_screen.dart';
import 'package:alkhatouna/features/cart/presentation/pages/shipping_addresses_screen.dart';
import 'package:alkhatouna/features/cart/presentation/pages/verfication_phone_address.dart';
import 'package:alkhatouna/main.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit({
    required this.cartRepo,
  }) : super(CartInitial());
  changecountryName(String value) => emit(state.copyWith(countryName: value));
  changepromoCode(String value) => emit(state.copyWith(promoCode: value));
  changeprovicesName(String value) => emit(state.copyWith(provicesName: value));
  changeareaName(String value) => emit(state.copyWith(areaName: value));
  changesubAreaName(String value) => emit(state.copyWith(subAreaName: value));

  Future<void> getAdress() async {
    emit(state.copyWith(loadingAddress: true));
    try {
      GetAdressModel response = await cartRepo.getAddress();
      emit(state.copyWith(adressData: response.data));
      List<Regions> countries = [];
      if (response.data!.regions != null) {
        for (int i = 0; i < response.data!.regions!.length; i++) {
          if (response.data!.regions![i].type == "country") {
            countries.add(response.data!.regions![i]);
          }
        }
      }
      emit(state.copyWith(countries: countries));
      getCheckOut(navigatorKey.currentContext);
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingAddress: false));
  }

  void selectedBenefitId(value) =>
      emit(state.copyWith(selectedBenefitId: value));
  void changeinstaName(value) => emit(state.copyWith(instaName: value));
  void changeemployeerAddress(value) =>
      emit(state.copyWith(employeerAddress: value));
  void changeemployeerAddressText(value) =>
      emit(state.copyWith(employeerAddressText: value));
  void changeemployeerPhoneNumber(value) =>
      emit(state.copyWith(employeerPhoneNumber: value));
  void changeemployeerPhoneNumber2(value) =>
      emit(state.copyWith(employeerPhoneNumber2: value));
  void changeemployeerEnterTitle(value) =>
      emit(state.copyWith(employeerEnterTitle: value));

  Future<void> getCheckOut(
    context, {
    bool frompaymentmethod = false,
    bool checkphoneAddressVerifed = false,
    String pymentmethod = "",
    String pointsAmount = "",
    bool fromPromoCode = false,
    bool fromEmployeeAddress = false,
  }) async {
    emit(state.copyWith(laodingCheckOut: true));
    try {
      CheckOutModel response = await cartRepo.getCheckOut(
          pointsAmount,
          frompaymentmethod,
          pymentmethod,
          fromEmployeeAddress,
          state.employeerAddress ?? "",
          fromPromoCode,
          state.promoCode ?? "",
          state.selectedBenefitId ?? "");

      emit(state.copyWith(checkData: response.data));

      if (checkphoneAddressVerifed) {
        // print("Ghaith ${response.data!.defaultAddress!.is_phone_verified}");
        // print();
        if (response.data!.defaultAddress != null) {
          if (response.data!.defaultAddress!.is_phone_verified.toString() ==
                  "0" &&
              response.data!.isEmployee == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => VerficationPhoneAddress(
                  fromCheckOut: true,
                  phoneNumber: response.data!.defaultAddress!.phone.toString(),
                  lat: response.data!.defaultAddress!.latitude.toString(),
                  log: response.data!.defaultAddress!.longitude.toString(),
                  addressId: response.data!.defaultAddress!.id.toString(),
                ),
              ),
            );
          }
        }
      }
      if (response.data!.can_pay_with_points == false) {
        emit(state.copyWith(paymentMethod: "Cash"));
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingCheckOut: false));
  }

  changepaymentMethod(String value) =>
      emit(state.copyWith(paymentMethod: value));
  cahngeclcikedCartId(value) => emit(state.copyWith(clcikedCartId: value));
  Future<void> removeFromCart(String quantity, String cartID,
      {bool deleteAll = false, String FinalPrice = "0.0"}) async {
    emit(state.copyWith(laodingUpdateItem: true));
    // emit(state.copyWith(loadingGetCart: true));

    try {
      Map<String, String> body = {};
      body['cart_id'] = cartID;
      body['quantity'] = quantity;

      RemoveFromCartModel? response = await cartRepo.removeFromCart(body: body);
      if (deleteAll) {
        getCarts();
      }
      emit(state.copyWith(clcikedCartId: -100));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingUpdateItem: false));
  }

  Future<void> getCarts() async {
    emit(state.copyWith(loadingGetCart: true));
    try {
      GetCartModel response = await cartRepo.getCarts();
      emit(state.copyWith(cartData: response.data));
      double amount = 0;
      for (int i = 0; i < response.data!.carts!.length; i++) {
        amount = amount +
            double.parse(
                    response.data!.carts![i].product!.finalPrice!.toString()) *
                double.parse(response.data!.carts![i].quantity!.toString());
      }
      emit(state.copyWith(totalCartPrice: amount));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingGetCart: false));
  }

  addToTotalPrice(double price) {
    double newTotal = state.totalCartPrice;
    newTotal = newTotal + price;
    emit(state.copyWith(totalCartPrice: newTotal));
  }

  removefromTotalPrice(double price) {
    double newTotal = state.totalCartPrice;
    newTotal = newTotal - price;
    emit(state.copyWith(totalCartPrice: newTotal));
  }

  changeprovince(String countryId) {
    emit(state.copyWith(
        countryId: countryId,
        province: [],
        areas: [],
        subAreas: [],
        provinceId: "-100",
        provicesName: "",
        areaName: "",
        subAreaName: "",
        areaId: "-100",
        subAreaId: "-100"));
    List<Children>? province = [];
    for (int i = 0; i < state.countries!.length; i++) {
      if (state.countries![i].id == int.parse(countryId)) {
        if (state.countries![i].children != null) {
          for (int j = 0; j < state.countries![i].children!.length; j++) {
            province.add(state.countries![i].children![j]);
          }
        }
      }
    }
    emit(state.copyWith(province: province));
  }

  exitFromAddAdress() {
    emit(state.copyWith(
        addressTitle: "",
        addressPhoneNumber: "",
        addressPhoneNumber2: "",
        countryId: "-100",
        provinceId: "-100",
        areaId: "-100",
        subAreaId: "-100",
        province: [],
        areaName: "",
        countryName: "",
        subAreaName: "",
        provicesName: "",
        instaName: "",
        areas: [],
        subAreas: [],
        adressIsDefault: "0",
        adressNotes: ""));
  }

  changearea(String provinceid) {
    emit(state.copyWith(
        provinceId: provinceid,
        areas: [],
        areaName: "",
        subAreaName: "",
        subAreas: [],
        areaId: "-100",
        subAreaId: "-100"));

    List<Children>? areas = [];
    for (int i = 0; i < state.countries!.length; i++) {
      if (state.countries![i].id == int.parse(state.countryId!)) {
        for (int j = 0; j < state.countries![i].children!.length; j++) {
          if (state.countries![i].children![j].id == int.parse(provinceid)) {
            for (int k = 0;
                k < state.countries![i].children![j].children!.length;
                k++) {
              areas.add(state.countries![i].children![j].children![k]);
            }
          }
        }
      }
      emit(state.copyWith(areas: areas));
    }
  }

  changeSubArea(String areaId) {
    emit(state.copyWith(
        areaId: areaId, subAreas: [], subAreaId: "-100", subAreaName: ""));
    List<Children>? subareas = [];
    for (int i = 0; i < state.countries!.length; i++) {
      if (state.countries![i].id == int.parse(state.countryId!)) {
        for (int j = 0; j < state.countries![i].children!.length; j++) {
          if (state.countries![i].children![j].id ==
              int.parse(state.provinceId!)) {
            for (int k = 0;
                k < state.countries![i].children![j].children!.length;
                k++) {
              if (state.countries![i].children![j].children![k].id ==
                  int.parse(areaId)) {
                for (int m = 0;
                    m <
                        state.countries![i].children![j].children![k].children!
                            .length;
                    m++) {
                  subareas.add(state
                      .countries![i].children![j].children![k].children![m]);
                }
              }
            }
          }
        }
      }
      emit(state.copyWith(subAreas: subareas));
    }
  }

  changeSubAreaID(String value) => emit(state.copyWith(subAreaId: value));
  changeaddressTitle(String value) => emit(state.copyWith(addressTitle: value));
  changeadressNotes(String value) => emit(state.copyWith(adressNotes: value));
  changeadressIsDefault(String value) =>
      emit(state.copyWith(adressIsDefault: value));
  changeaddressPhoneNumber(String value) =>
      emit(state.copyWith(addressPhoneNumber: value));
  changeaddressPhoneNumber2(String value) =>
      emit(state.copyWith(addressPhoneNumber2: value));
  changebase_phone(String value) => emit(state.copyWith(base_phone: value));
  changecountry_code(String value) {
    emit(state.copyWith(country_code: value));
    print(value);
    print("////////////");
    print(state.country_code);
  }

  changecountry_code_number(String value) =>
      emit(state.copyWith(country_code_number: value));
  changebase_phone2(String value) => emit(state.copyWith(base_phone2: value));
  changecountry_code2(String value) =>
      emit(state.copyWith(country_code2: value));
  changecountry_code_number2(String value) =>
      emit(state.copyWith(country_code_number2: value));

  editeAdress(Addresses address) {
    emit(state.copyWith(
        base_phone: address.base_phone,
        base_phone2: address.base_phone2,
        country_code: address.country_code,
        country_code2: address.country_code2,
        country_code_number2: address.country_code_number2,
        country_code_number: address.country_code_number,
        addressTitle: address.title,
        addressPhoneNumber: address.phone,
        addressPhoneNumber2: address.phone2,
        adressNotes: address.notes,
        instaName: address.instagram,
        countryId: address.countryId.toString(),
        provinceId: address.provinceId.toString(),
        areaId: address.areaId.toString(),
        subAreaId: address.subAreaId.toString(),
        adressIsDefault: address.isDefault.toString()));
  }

  Future<void> addAdress(String longitude, String latitude,
      {String? addressID}) async {
    print(addressID);
    emit(state.copyWith(loadingAddAdress: true));
    try {
      Map<String, String> body = {};
      body['base_phone'] = state.base_phone ?? "";
      body['country_code'] = state.country_code ?? "";
      body['country_code_number'] = state.country_code_number ?? "";
      body['base_phone2'] = state.base_phone2 ?? "";
      body['country_code2'] = state.country_code2 ?? "";
      body['country_code_number2'] = state.country_code_number2 ?? "";

      body['phone'] = state.addressPhoneNumber!;
      body['instagram'] = state.instaName ?? "";
      body['phone2'] = state.addressPhoneNumber2 == "null"
          ? ""
          : state.addressPhoneNumber2 ?? "";
      body['title'] = state.addressTitle!;
      body['country_id'] = state.countryId!;
      body['province_id'] = state.provinceId!;
      body['area_id'] = state.areaId == "-100"
          ? ""
          : state.areaId == "null"
              ? ""
              : state.areaId!;
      body['sub_area_id'] = state.subAreaId == "-100"
          ? ""
          : state.subAreaId == "null"
              ? ""
              : state.subAreaId!;
      body['longitude'] =
          state.adressData!.show_location.toString() == "0" ? "0" : longitude;
      body['latitude'] =
          state.adressData!.show_location.toString() == "0" ? "0" : latitude;
      body['notes'] = state.adressNotes!;
      body['is_default'] = state.adressIsDefault!;

      AddAdressModel? response =
          await cartRepo.addAdress(body: body, addressID: addressID);
      if (response.data != null) {
        if (response.data!.address!.id != null) {
          makePhoneVerfication(response.data!.address!.id!.toString());
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingAddAdress: false));
  }

  changeenteredPoints(value) => emit(state.copyWith(enteredPoints: value));
  Future<void> sendOrder(
      String promoCode, String type, String date, bool isEmployee) async {
    emit(state.copyWith(loadingSendOrder: true));
    try {
      SendCheckOut? response = await cartRepo.sendOrder(
          state.enteredPoints ?? "",
          promoCode,
          state.paymentMethod!.isEmpty ? "Cash" : state.paymentMethod!,
          state.selectedBenefitId ?? "",
          type,
          date,
          isEmployee,
          state.employeerPhoneNumber!,
          state.employeerPhoneNumber2!,
          state.employeerEnterTitle!,
          state.employeerAddress!);
      Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ConfettiScreen()),
        (Route route) => false,
      );
      // AppConstant.customNavigation(navigatorKey.currentContext, ConfettiScreen(), 0, 1);
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingSendOrder: false));
  }

  Future<void> makePhoneVerfication(String addressid,
      {bool makeAddressDefault = false, bool fromCheckOut = false}) async {
    emit(state.copyWith(loadingAddAdress: true));
    try {
      MakePhoneVerifedModel? response =
          await cartRepo.makePhoneVerfication(addressid);
      if (fromCheckOut) {
        Navigator.pushReplacement(
          navigatorKey.currentContext!,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const CheckOutScreen(),
          ),
        );
      } else if (makeAddressDefault == false) {
        Navigator.pop(navigatorKey.currentContext!);
        Navigator.pop(navigatorKey.currentContext!);
        getAdress();
        getCheckOut(navigatorKey.currentContext);
      } else {
        Navigator.pop(navigatorKey.currentContext!);
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingAddAdress: false));
  }

  Future<void> deleteCart() async {
    emit(state.copyWith(loadingdeleteCart: true));
    try {
      SendCheckOut? response = await cartRepo.deleteCart();
      if (response.data?.message == "cart deleted successfully") {
        getCarts();
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingdeleteCart: false));
  }

  Future<void> makeAdressDefault(String addressID) async {
    try {
      emit(state.copyWith(loadingMakeDefault: true));
      MakeDefaultModel? response =
          await cartRepo.makeAdressDefault(addressID: addressID);
      AdressData? newadressData = state.adressData;
      for (int i = 0; i < newadressData!.addresses!.length; i++) {
        // print(newadressData.addresses![i].id);
        // print(addressID);
        if (newadressData.addresses![i].id == int.parse(addressID)) {
          newadressData.addresses![i].isDefault = "1";
        } else {
          newadressData.addresses![i].isDefault = "0";
        }
      }
      emit(state.copyWith(loadingAddress: true));
      emit(state.copyWith(adressData: newadressData));
      emit(state.copyWith(loadingAddress: false));
      getCheckOut(navigatorKey.currentContext);
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingMakeDefault: false));
  }

  // Future<void> checkphoneVerfied(
  //   BuildContext context,
  //   String addressID,
  //   String phoneNumber,
  //   String lat,
  //   String log,
  // ) async {
  //   try {
  //     emit(state.copyWith(loadingMakeDefault: true));

  //     CheckPhoneVerfiedModel? response =
  //         await cartRepo.checkphoneVerfied(addressID: addressID);
  //     if (response.data != null) {
  //       if (response.data!.isPhoneVerified.toString() == "0") {
  //         AppConstant.customNavigation(
  //             context,
  //             VerficationPhoneAddress(
  //               fromMakeAddressDefault: true,
  //               phoneNumber: phoneNumber,
  //               lat: lat,
  //               log: log,
  //               addressId: addressID,
  //             ),
  //             -1,
  //             0);
  //       }
  //       if (response.data!.isPhoneVerified.toString() == "1") {
  //         makeAdressDefault(addressID);
  //       }
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.red,
  //         padding:
  //             EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
  //         content: Text(
  //           e.toString(),
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //         duration: const Duration(seconds: 2),
  //       ),
  //     );
  //   }
  //   emit(state.copyWith(loadingMakeDefault: false));
  // }

  Future<void> deleteAddress(String addressID) async {
    try {
      DeleteAddressModel? response =
          await cartRepo.deleteAddress(addressID: addressID);
      AdressData? newadressData = state.adressData;
      List<Addresses>? newAddress = [];
      for (int i = 0; i < newadressData!.addresses!.length; i++) {
        if (newadressData.addresses![i].id == int.parse(addressID)) {
        } else {
          newAddress.add(newadressData.addresses![i]);
        }
      }
      newadressData.addresses = newAddress;
      emit(state.copyWith(loadingAddress: true));
      emit(state.copyWith(adressData: newadressData));
      emit(state.copyWith(loadingAddress: false));
      getCheckOut(navigatorKey.currentContext);
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
