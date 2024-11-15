import 'package:alkhatouna/core/utils/cache_helper.dart';

import '../../../../core/utils/http_helper.dart';

class HomeDs {
  final ApiBaseHelper apiHelper;

  HomeDs({required this.apiHelper});

  Future<Map<String, dynamic>?> getHomeInfo() async {
    String? userID = await CacheHelper.getData(key: "USER_ID");
    print(userID);
    print("Ghaith");
    Map<String, dynamic>? response =
        await apiHelper.get("/home", queryParameters: {"user_id": userID});
    return response;
  }

  Future<Map<String, dynamic>?> getUserCategories() async {
    Map<String, dynamic>? response = await apiHelper.get(
      "/get-user-categories",
    );
    return response;
  }

  Future<Map<String, dynamic>?> getProductDetails(String prouctid) async {
    String? userID = await CacheHelper.getData(key: "USER_ID");

    Map<String, String> body = {};
    body['product_id'] = "$prouctid";
    body['user_id'] = "$userID";
    Map<String, dynamic>? response =
        await apiHelper.get("/get-product", queryParameters: body);
    return response;
  }

  Future<Map<String, dynamic>?> getBrandDetails(
      String brandId, int pagenumber) async {
    String? userID = await CacheHelper.getData(key: "USER_ID");

    Map<String, dynamic>? response = await apiHelper.get(
        "/brands/$brandId/products-with-pagination?page=$pagenumber",
        queryParameters: {"user_id": userID});
    return response;
  }

  Future<Map<String, dynamic>?> getFullSearch(String catID) async {
    Map<String, dynamic>? response =
        await apiHelper.get("/full-search?keyword=$catID");
    return response;
  }

  Future<Map<String, dynamic>?> getCategoreyChildren(String keyword) async {
    Map<String, dynamic>? response =
        await apiHelper.get("/get-category-children?category_id=$keyword");
    return response;
  }

  Future<Map<String, dynamic>?> getBrands() async {
    Map<String, dynamic>? response = await apiHelper.get("/brands");
    return response;
  }

  Future<Map<String, dynamic>?> toggleFavorite(
      Map<String, String>? body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/toggle-favorite",
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> sendReview(Map<String, String>? body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/add-review",
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> addToCart(Map<String, String>? body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/add-to-cart",
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> getSubGategories(
      String category_id,
      int pageNumber,
      double minPrice,
      double maxPrice,
      List<String> sizes,
      List<String> colors,
      List<String> weights,
      List<String> dimensions,
      List<String> selectedlistbrandId,
      bool filterDiscount,
      bool filterFeature,
      String searchValue) async {
    String? userID = await CacheHelper.getData(key: "USER_ID");

    Map<String, String?> body = {};
    body['page'] = "$pageNumber";
    body['is_feautred'] = "${filterFeature ? "1" : "0"}";
    body['is_discount'] = "${filterDiscount ? "1" : "0"}";
    body['category_id'] = "$category_id";
    body['user_id'] = userID;

    if (minPrice != -100) {
      body['min_price'] = "$minPrice";
    }
    if (searchValue.isNotEmpty) {
      body['keyword'] = "$searchValue";
    }
    if (maxPrice != -100) {
      body['max_price'] = "$maxPrice";
    }
    if (sizes.isNotEmpty) {
      for (int i = 0; i < sizes.length; i++) body['sizes[$i]'] = "${sizes[i]}";
    }
    if (colors.isNotEmpty) {
      for (int i = 0; i < colors.length; i++)
        body['colors[$i]'] = "${colors[i]}";
    }
    if (weights.isNotEmpty) {
      for (int i = 0; i < weights.length; i++)
        body['weights[$i]'] = "${weights[i]}";
    }
    if (dimensions.isNotEmpty) {
      for (int i = 0; i < dimensions.length; i++)
        body['dimensions[$i]'] = "${dimensions[i]}";
    }
    if (selectedlistbrandId.isNotEmpty) {
      for (int i = 0; i < selectedlistbrandId.length; i++)
        body['brands[$i]'] = "${selectedlistbrandId[i]}";
    }
    Map<String, dynamic>? response =
        await apiHelper.get("/get-category-products", queryParameters: body);
    return response;
  }
}
