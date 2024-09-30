// ignore_for_file: unused_local_variable

import 'package:alkhatouna/features/cart/data/models/add_adress_model.dart';
import 'package:alkhatouna/features/cart/data/models/check_out_model.dart';
import 'package:alkhatouna/features/cart/data/models/delete_address_model.dart';
import 'package:alkhatouna/features/cart/data/models/get_address_model.dart';
import 'package:alkhatouna/features/cart/data/models/get_cart_model.dart';
import 'package:alkhatouna/features/cart/data/models/make_default_model.dart';
import 'package:alkhatouna/features/cart/data/models/remove_from_cart_model.dart';
import 'package:alkhatouna/features/cart/data/models/send_check_out.dart';
import 'package:alkhatouna/features/cart/data/repositories/cart_repo.dart';
import 'package:alkhatouna/features/cart/presentation/pages/confetti_screen.dart';
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

  Future<void> getAdress(BuildContext context) async {
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
      getCheckOut(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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

  Future<void> getCheckOut(BuildContext context,
      {bool fromPromoCode = false}) async {
    emit(state.copyWith(laodingCheckOut: true));
    try {
      CheckOutModel response =
          await cartRepo.getCheckOut(fromPromoCode, state.promoCode ?? "");

      emit(state.copyWith(checkData: response.data));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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

  Future<void> removeFromCart(
      BuildContext context, String quantity, String cartID,
      {bool deleteAll = false, String FinalPrice = "0.0"}) async {
    emit(state.copyWith(laodingUpdateItem: true));
    emit(state.copyWith(loadingGetCart: true));

    try {
      Map<String, String> body = {};
      body['cart_id'] = cartID;
      body['quantity'] = quantity;

      RemoveFromCartModel? response = await cartRepo.removeFromCart(body: body);
      getCarts(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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

  Future<void> getCarts(BuildContext context) async {
    emit(state.copyWith(loadingGetCart: true));
    try {
      GetCartModel response = await cartRepo.getCarts();
      emit(state.copyWith(cartData: response.data));
      double amount = 0;
      for (int i = 0; i < response.data!.carts!.length; i++) {
        amount = amount +
            double.parse(response.data!.carts![i].product!.finalPrice!) *
                double.parse(response.data!.carts![i].quantity!);
      }
      emit(state.copyWith(totalCartPrice: amount));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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
    newTotal = newTotal - price;
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
        countryId: "-100",
        provinceId: "-100",
        areaId: "-100",
        subAreaId: "-100",
        province: [],
        areaName: "",
        countryName: "",
        subAreaName: "",
        provicesName: "",
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

  editeAdress(Addresses address) {
    emit(state.copyWith(
        addressTitle: address.title,
        addressPhoneNumber: address.phone,
        adressNotes: address.notes,
        countryId: address.countryId,
        provinceId: address.provinceId,
        areaId: address.areaId,
        subAreaId: address.subAreaId,
        adressIsDefault: address.isDefault));
  }

  Future<void> addAdress(
      BuildContext context, String longitude, String latitude,
      {String? addressID}) async {
    emit(state.copyWith(loadingAddAdress: true));
    try {
      Map<String, String> body = {};
      body['phone'] = state.addressPhoneNumber!;
      body['title'] = state.addressTitle!;
      body['country_id'] = state.countryId!;
      body['province_id'] = state.provinceId!;
      body['area_id'] = state.areaId == "-100" ? "" : state.areaId!;
      body['sub_area_id'] = state.subAreaId == "-100" ? "" : state.subAreaId!;
      body['longitude'] = longitude;
      body['latitude'] = latitude;
      body['notes'] = state.adressNotes!;
      body['is_default'] = state.adressIsDefault!;

      AddAdressModel? response =
          await cartRepo.addAdress(body: body, addressID: addressID);
      Navigator.pop(context);
      getAdress(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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

  Future<void> sendOrder(BuildContext context, String promoCode) async {
    emit(state.copyWith(loadingSendOrder: true));
    try {
      SendCheckOut? response = await cartRepo.sendOrder(promoCode);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ConfettiScreen()),
        (Route route) => false,
      );
      // AppConstant.customNavigation(context, ConfettiScreen(), 0, 1);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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

  Future<void> makeAdressDefault(BuildContext context, String addressID) async {
    try {
      MakeDefaultModel? response =
          await cartRepo.makeAdressDefault(addressID: addressID);
      AdressData? newadressData = state.adressData;
      for (int i = 0; i < newadressData!.addresses!.length; i++) {
        print(newadressData.addresses![i].id);
        print(addressID);
        if (newadressData.addresses![i].id == int.parse(addressID)) {
          newadressData.addresses![i].isDefault = "1";
        } else {
          newadressData.addresses![i].isDefault = "0";
        }
      }
      emit(state.copyWith(loadingAddress: true));
      emit(state.copyWith(adressData: newadressData));
      emit(state.copyWith(loadingAddress: false));
      getCheckOut(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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

  Future<void> deleteAddress(BuildContext context, String addressID) async {
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
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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
