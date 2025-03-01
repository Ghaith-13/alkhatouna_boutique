import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/utils/http_helper.dart';

class FavoriteDs {
  final ApiBaseHelper apiHelper;

  FavoriteDs({required this.apiHelper});
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
        await apiHelper.get("/favorites-v2", queryParameters: body);
    return response;
  }

  Future<Map<String, dynamic>?> getFavoriteProducts(
    int pageNumber,
    double minPrice,
    double maxPrice,
    List<String> sizes,
    List<String> colors,
    List<String> weghitsList,
    List<String> dimensionsList,
    List<String> selectedlistbrandId,
    bool filterDiscount,
    bool filterFeature,
  ) async {
    // print(minPrice);
    Map<String, String> body = {};
    body['page'] = "$pageNumber";
    body['is_feautred'] = "${filterFeature ? "1" : "0"}";
    body['is_discount'] = "${filterDiscount ? "1" : "0"}";

    if (minPrice != -100) {
      body['min_price'] = "$minPrice";
    }
    if (maxPrice != -100) {
      body['max_price'] = "$minPrice";
    }
    if (sizes.isNotEmpty) {
      for (int i = 0; i < sizes.length; i++) body['sizes[$i]'] = "${sizes[i]}";
    }
    if (colors.isNotEmpty) {
      for (int i = 0; i < colors.length; i++)
        body['colors[$i]'] = "${colors[i]}";
    }
    if (weghitsList.isNotEmpty) {
      for (int i = 0; i < weghitsList.length; i++)
        body['weights[$i]'] = "${weghitsList[i]}";
    }
    if (dimensionsList.isNotEmpty) {
      for (int i = 0; i < dimensionsList.length; i++)
        body['dimensions[$i]'] = "${dimensionsList[i]}";
    }
    if (selectedlistbrandId.isNotEmpty) {
      for (int i = 0; i < selectedlistbrandId.length; i++)
        body['brands[$i]'] = "${selectedlistbrandId[i]}";
    }
    Map<String, dynamic>? response =
        await apiHelper.get("/favorites", queryParameters: body);
    return response;
  }
}
