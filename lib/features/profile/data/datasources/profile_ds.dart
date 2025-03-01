import 'package:alkhatouna/core/utils/cache_helper.dart';

import '../../../../core/utils/http_helper.dart';

class ProfileDs {
  final ApiBaseHelper apiHelper;

  ProfileDs({required this.apiHelper});

  Future<Map<String, dynamic>?> getOrders() async {
    Map<String, dynamic>? response = await apiHelper.get("/my-orders");
    return response;
  }

  Future<Map<String, dynamic>?> getuserInfo() async {
    Map<String, dynamic>? response = await apiHelper.get("/get-user");
    return response;
  }

  Future<Map<String, dynamic>?> cancelOrder(String orderid) async {
    Map<String, dynamic>? response =
        await apiHelper.post("/cancel-order?order_id=$orderid");
    return response;
  }

  Future<Map<String, dynamic>?> updatebirthdate(String birthdate) async {
    Map<String, dynamic>? response =
        await apiHelper.post("/update-birthdate?birthdate=$birthdate");
    return response;
  }

  Future<Map<String, dynamic>?> updateUpdatePhone(String phone) async {
    String? userID = await CacheHelper.getData(key: "USER_ID");

    Map<String, dynamic>? response = await apiHelper.post("/update-phone",
        body: {"user_id": "$userID", "phone": "${phone}"});
    return response;
  }

  Future<Map<String, dynamic>?> getPoints() async {
    Map<String, dynamic>? response = await apiHelper.get("/get-point-records");
    return response;
  }

  Future<Map<String, dynamic>?> getFaq() async {
    Map<String, dynamic>? response = await apiHelper.get("/get-faqs");
    return response;
  }

  Future<Map<String, dynamic>?> sendFeedBack(Map<String, String>? body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/add-feedback",
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> deleteAccount(Map<String, String>? body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/delete-account",
    );
    return response;
  }

  Future<Map<String, dynamic>?> getArticles() async {
    Map<String, dynamic>? response = await apiHelper.get(
      "/get-articles",
    );
    return response;
  }

  Future<Map<String, dynamic>?> getSettings() async {
    Map<String, dynamic>? response = await apiHelper.get(
      "/settings",
    );
    return response;
  }

  Future<Map<String, dynamic>?> gettutorials() async {
    Map<String, dynamic>? response = await apiHelper.get(
      "/get-tutorials",
    );
    return response;
  }

  Future<Map<String, dynamic>?> getWallet() async {
    Map<String, dynamic>? response = await apiHelper.get(
      "/get-wallet",
    );
    return response;
  }
}
