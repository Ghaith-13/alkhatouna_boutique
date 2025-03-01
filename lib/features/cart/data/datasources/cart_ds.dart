import 'package:alkhatouna/features/cart/data/models/make_phone_verfied_model.dart';

import '../../../../core/utils/http_helper.dart';

class CartDS {
  final ApiBaseHelper apiHelper;

  CartDS({required this.apiHelper});

  Future<Map<String, dynamic>?> getAddress() async {
    Map<String, dynamic>? response = await apiHelper.get("/get-addresses");
    return response;
  }

  Future<Map<String, dynamic>?> getCarts() async {
    Map<String, dynamic>? response = await apiHelper.get("/get-carts");
    return response;
  }

  Future<Map<String, dynamic>?> addAdress(
      Map<String, String>? body, addressID) async {
    if (addressID == "null") {
      Map<String, dynamic>? response = await apiHelper.post(
        "/add-address",
        body: body,
      );
      return response;
    } else {
      Map<String, dynamic>? response = await apiHelper.post(
        "/update-address/$addressID",
        body: body,
      );
      return response;
    }
  }

  Future<Map<String, dynamic>?> makeAdressDefault(addressID) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/make-default/$addressID",
    );
    return response;
  }

  Future<Map<String, dynamic>?> checkphoneVerfied(addressID) async {
    Map<String, dynamic>? response = await apiHelper.get(
      "/check-address-phone-verified/$addressID",
    );
    return response;
  }

  Future<Map<String, dynamic>?> sendOrder(
    String enteredPoints,
    String promoCode,
    String paymentMethod,
    String selectedBenefitId,
    String type,
    String date,
    bool isEmployee,
    String employeerPhoneNumber,
    String employeerPhoneNumber2,
    String address_notes,
    String province_id,
  ) async {
    Map<String, String> body = {};

    if (isEmployee) {
      body['province_id'] = province_id;
      body['address_phone'] = employeerPhoneNumber;
      body['address_phone2'] =
          employeerPhoneNumber2 == "null" ? "" : employeerPhoneNumber2;
      body['address_notes'] = address_notes;
    }
    if (type.isNotEmpty) {
      body['order_type'] = type;
      body['pre_order_at'] = date;
    }
    body['promo_code'] = promoCode;
    body['selected_benefit_id'] = selectedBenefitId;
    if (paymentMethod == "Points") {
      body['used_points_amount'] = enteredPoints;
    }
    body['payment_method'] =
        paymentMethod == "Points" ? "points" : paymentMethod;

    Map<String, dynamic>? response =
        await apiHelper.post("/add-order", body: body);
    return response;
  }

  Future<Map<String, dynamic>?> removeFromCart(
      Map<String, String>? body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/remove-from-cart",
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> deleteAddress(addressID) async {
    Map<String, dynamic>? response = await apiHelper.delete(
      "/delete-address/$addressID",
    );
    return response;
  }

  Future<Map<String, dynamic>?> makePhoneVerfication(addressID) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/make-phone-verified/$addressID",
    );
    return response;
  }

  Future<Map<String, dynamic>?> deleteCart() async {
    Map<String, dynamic>? response = await apiHelper.delete(
      "/empty-carts",
    );
    return response;
  }

  Future<Map<String, dynamic>?> getCheckOut(
      String pointsAmount,
      bool frompaymentmethod,
      String pymentmethod,
      bool fromEmployeeAddress,
      String employeerAddress,
      bool fromPromoCode,
      String promoCode,
      String benefit) async {
    if (fromEmployeeAddress) {
      Map<String, dynamic>? response = await apiHelper.get(
          "/get-checkout?promo_code=$promoCode&selected_benefit_id=$benefit&province_id=$employeerAddress&payment_method=$pymentmethod&used_points_amount=$pointsAmount");
      return response;
    } else {
      Map<String, dynamic>? response = await apiHelper.get(
          "/get-checkout?promo_code=$promoCode&selected_benefit_id=$benefit&payment_method=$pymentmethod&used_points_amount=$pointsAmount");
      return response;
    }
  }
}
