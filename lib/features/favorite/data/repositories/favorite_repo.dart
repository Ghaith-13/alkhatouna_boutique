// ignore_for_file: file_names, non_constant_identifier_names

import 'package:alkhatouna/features/all_products/data/models/all_products_model.dart';
import 'package:alkhatouna/features/favorite/data/datasources/favorite_ds.dart';
import 'package:alkhatouna/features/favorite/data/models/favorite_model.dart';

class FavoriteRepo {
  final FavoriteDs dataSource;

  FavoriteRepo({required this.dataSource});
  Future<AllProductsModel> getAllProducts(
    int pageNumber,
    String? type,
  ) async {
    AllProductsModel MyOrdersResponse = AllProductsModel.fromJson(
      await dataSource.getAllProducts(pageNumber, type),
    );
    return MyOrdersResponse;
  }

  Future<FavoriteProductModel> getFavoriteProducts(
      int pageNumber,
      double min,
      double max,
      List<String> colors,
      List<String> sizes,
      List<String> weghitsList,
      List<String> dimensionsList,
      List<String> selectedlistbrandId,
      bool filterDiscount,
      bool filterFeature) async {
    FavoriteProductModel MyOrdersResponse = FavoriteProductModel.fromJson(
      await dataSource.getFavoriteProducts(
          pageNumber,
          min,
          max,
          colors,
          sizes,
          weghitsList,
          dimensionsList,
          selectedlistbrandId,
          filterDiscount,
          filterFeature),
    );
    return MyOrdersResponse;
  }
}
