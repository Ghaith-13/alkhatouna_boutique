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
    if (addressID == null) {
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

  Future<Map<String, dynamic>?> sendOrder(String promoCode) async {
    Map<String, String> body = {};
    body['promo_code'] = promoCode;
    Map<String, dynamic>? response = await apiHelper.post("/add-order",
        body: promoCode.isEmpty ? null : body);
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

  Future<Map<String, dynamic>?> getCheckOut(
      bool fromPromoCode, String promoCode) async {
    Map<String, dynamic>? response = await apiHelper.get(
      fromPromoCode ? "/get-checkout?promo_code=$promoCode" : "/get-checkout",
    );
    return response;
  }
}
