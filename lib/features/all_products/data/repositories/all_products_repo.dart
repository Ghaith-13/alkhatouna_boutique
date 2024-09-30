// ignore_for_file: file_names, non_constant_identifier_names

import 'package:alkhatouna/features/all_products/data/datasources/all_products_ds.dart';
import 'package:alkhatouna/features/all_products/data/models/all_products_model.dart';

class AllProductsRepo {
  final AllProductsDS dataSource;

  AllProductsRepo({required this.dataSource});

  Future<AllProductsModel> getAllProducts(
    int pageNumber,
    String? type,
  ) async {
    AllProductsModel MyOrdersResponse = AllProductsModel.fromJson(
      await dataSource.getAllProducts(pageNumber, type),
    );
    return MyOrdersResponse;
  }
}
