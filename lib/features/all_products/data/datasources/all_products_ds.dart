import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/utils/http_helper.dart';

class AllProductsDS {
  final ApiBaseHelper apiHelper;

  AllProductsDS({required this.apiHelper});

  Future<Map<String, dynamic>?> getAllProducts(
    int pageNumber,
    String? type,
  ) async {
    String? userID = await CacheHelper.getData(key: "USER_ID");
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    var fcmToken = await messaging.getToken();

    Map<String, String> body = {};
    body['page'] = "$pageNumber";
    if (userID != null) {
      body['user_id'] = "$userID";
    }
    if (type == "notified_products") {
      body['fcm_token'] = "$fcmToken";
    }
    if (type != null) {
      body['type'] = "$type";
    }

    Map<String, dynamic>? response =
        await apiHelper.get("/products-with-pagination", queryParameters: body);
    return response;
  }
}
