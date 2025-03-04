// ignore_for_file: must_be_immutable

part of 'cart_cubit.dart';

class CartState extends Equatable {
  CartState(
      {this.loadingAddress = false,
      this.countryName = "",
      this.provicesName = "",
      this.promoCode = "",
      this.enteredPoints = "",
      this.selectedBenefitId = "",
      this.areaName = "",
      this.paymentMethod = "",
      this.employeerAddressText = "",
      this.base_phone = "",
      this.base_phone2 = "",
      this.employeerAddress = "",
      this.employeerPhoneNumber = "",
      this.employeerPhoneNumber2 = "",
      this.employeerEnterTitle = "",
      this.country_code_number = "",
      this.country_code_number2 = "",
      this.country_code = "IQ",
      this.country_code2 = "IQ",
      this.instaName = "",
      this.subAreaName = "",
      this.loadingAddAdress = false,
      this.loadingSendOrder = false,
      this.loadingMakeDefault = false,
      this.loadingdeleteCart = false,
      this.laodingUpdateItem = false,
      this.laodingCheckOut = false,
      this.loadingGetCart = false,
      this.adressData,
      this.clcikedCartId = -100,
      this.countries,
      this.countryId = "-100",
      this.addressTitle = "",
      this.addressPhoneNumber = "",
      this.addressPhoneNumber2 = "",
      this.provinceId = "-100",
      this.areas,
      this.cartData,
      this.checkData,
      this.areaId = "-100",
      this.subAreaId = "-100",
      this.subAreas,
      this.totalCartPrice = 0.0,
      this.adressNotes = "",
      this.adressIsDefault = "0",
      this.province});
  CheckOutData? checkData;
  bool loadingAddress,
      loadingAddAdress,
      loadingGetCart,
      laodingUpdateItem,
      loadingdeleteCart,
      loadingMakeDefault,
      loadingSendOrder,
      laodingCheckOut;
  AdressData? adressData;
  String? addressPhoneNumber,
      addressPhoneNumber2,
      countryId,
      provinceId,
      base_phone,
      base_phone2,
      employeerEnterTitle,
      instaName,
      employeerPhoneNumber,
      employeerPhoneNumber2,
      promoCode,
      selectedBenefitId,
      employeerAddressText,
      countryName,
      enteredPoints,
      country_code,
      country_code2,
      paymentMethod,
      areaName,
      provicesName,
      country_code_number,
      country_code_number2,
      employeerAddress,
      areaId,
      subAreaName,
      subAreaId,
      adressIsDefault,
      adressNotes,
      addressTitle;
  double totalCartPrice;
  List<Regions>? countries;
  CartData? cartData;
  List<Children>? province;
  List<Children>? areas;
  List<Children>? subAreas;
  int? clcikedCartId;
  @override
  List<Object?> get props => [
        loadingAddress,
        adressData,
        adressNotes,
        employeerAddressText,
        addressTitle,
        instaName,
        base_phone2,
        base_phone,
        employeerEnterTitle,
        country_code_number,
        country_code_number2,
        loadingMakeDefault,
        enteredPoints,
        employeerAddress,
        employeerPhoneNumber,
        employeerPhoneNumber2,
        loadingdeleteCart,
        promoCode,
        selectedBenefitId,
        laodingUpdateItem,
        loadingSendOrder,
        subAreaName,
        clcikedCartId,
        paymentMethod,
        totalCartPrice,
        areaName,
        cartData,
        provicesName,
        country_code,
        country_code2,
        loadingGetCart,
        laodingCheckOut,
        countryName,
        loadingAddAdress,
        adressIsDefault,
        countries,
        subAreas,
        areaId,
        addressPhoneNumber,
        addressPhoneNumber2,
        province,
        countryId,
        subAreaId,
        checkData,
        provinceId,
        areas
      ];
  CartState copyWith(
          {bool? loadingAddress,
          bool? loadingAddAdress,
          bool? loadingSendOrder,
          bool? loadingGetCart,
          bool? laodingUpdateItem,
          bool? laodingCheckOut,
          bool? loadingMakeDefault,
          bool? loadingdeleteCart,
          AdressData? adressData,
          String? countryId,
          String? instaName,
          String? base_phone,
          String? base_phone2,
          String? country_code,
          String? country_code2,
          String? country_code_number,
          String? country_code_number2,
          String? promoCode,
          String? enteredPoints,
          String? employeerEnterTitle,
          String? selectedBenefitId,
          String? employeerPhoneNumber,
          String? employeerPhoneNumber2,
          String? employeerAddressText,
          String? employeerAddress,
          String? subAreaName,
          String? paymentMethod,
          int? clcikedCartId,
          CheckOutData? checkData,
          String? provicesName,
          String? areaName,
          String? countryName,
          String? adressNotes,
          double? totalCartPrice,
          CartData? cartData,
          String? addressPhoneNumber,
          String? addressPhoneNumber2,
          String? adressIsDefault,
          String? provinceId,
          String? areaId,
          String? subAreaId,
          String? addressTitle,
          List<Regions>? countries,
          List<Children>? province,
          List<Children>? areas,
          List<Children>? subAreas}) =>
      CartState(
        instaName: instaName ?? this.instaName,
        country_code_number: country_code_number ?? this.country_code_number,
        country_code_number2: country_code_number2 ?? this.country_code_number2,
        country_code: country_code ?? this.country_code,
        country_code2: country_code2 ?? this.country_code2,
        base_phone: base_phone ?? this.base_phone,
        base_phone2: base_phone2 ?? this.base_phone2,
        loadingAddress: loadingAddress ?? this.loadingAddress,
        loadingMakeDefault: loadingMakeDefault ?? this.loadingMakeDefault,
        employeerEnterTitle: employeerEnterTitle ?? this.employeerEnterTitle,
        enteredPoints: enteredPoints ?? this.enteredPoints,
        employeerAddressText: employeerAddressText ?? this.employeerAddressText,
        employeerPhoneNumber: employeerPhoneNumber ?? this.employeerPhoneNumber,
        employeerPhoneNumber2:
            employeerPhoneNumber2 ?? this.employeerPhoneNumber2,
        employeerAddress: employeerAddress ?? this.employeerAddress,
        loadingdeleteCart: loadingdeleteCart ?? this.loadingdeleteCart,
        checkData: checkData ?? this.checkData,
        clcikedCartId: clcikedCartId ?? this.clcikedCartId,
        countryName: countryName ?? this.countryName,
        promoCode: promoCode ?? this.promoCode,
        selectedBenefitId: selectedBenefitId ?? this.selectedBenefitId,
        laodingCheckOut: laodingCheckOut ?? this.laodingCheckOut,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        subAreaName: subAreaName ?? this.subAreaName,
        loadingGetCart: loadingGetCart ?? this.loadingGetCart,
        laodingUpdateItem: laodingUpdateItem ?? this.laodingUpdateItem,
        areaName: areaName ?? this.areaName,
        totalCartPrice: totalCartPrice ?? this.totalCartPrice,
        loadingSendOrder: loadingSendOrder ?? this.loadingSendOrder,
        cartData: cartData ?? this.cartData,
        provicesName: provicesName ?? this.provicesName,
        loadingAddAdress: loadingAddAdress ?? this.loadingAddAdress,
        adressIsDefault: adressIsDefault ?? this.adressIsDefault,
        addressPhoneNumber: addressPhoneNumber ?? this.addressPhoneNumber,
        addressPhoneNumber2: addressPhoneNumber2 ?? this.addressPhoneNumber2,
        adressNotes: adressNotes ?? this.adressNotes,
        subAreaId: subAreaId ?? this.subAreaId,
        areas: areas ?? this.areas,
        provinceId: provinceId ?? this.provinceId,
        addressTitle: addressTitle ?? this.addressTitle,
        areaId: areaId ?? this.areaId,
        subAreas: subAreas ?? this.subAreas,
        countryId: countryId ?? this.countryId,
        province: province ?? this.province,
        countries: countries ?? this.countries,
        adressData: adressData ?? this.adressData,
      );
}

class CartInitial extends CartState {}
