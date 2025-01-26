// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:alkhatouna/features/all_products/data/models/all_products_model.dart';
import 'package:equatable/equatable.dart';

class AllProductsState extends Equatable {
  AllProductsState(
      {this.pageNumber = 1,
      this.loadingproducts = false,
      this.stopLoading = false,
      this.allProductsData});

  int pageNumber;
  bool loadingproducts, stopLoading;
  List<AllProductsProduct>? allProductsData;
  @override
  List<Object?> get props =>
      [pageNumber, loadingproducts, stopLoading, allProductsData];
  AllProductsState copyWith(
          {int? pageNumber,
          bool? loadingproducts,
          bool? stopLoading,
          List<AllProductsProduct>? allProductsData}) =>
      AllProductsState(
          pageNumber: pageNumber ?? this.pageNumber,
          loadingproducts: loadingproducts ?? this.loadingproducts,
          stopLoading: stopLoading ?? this.stopLoading,
          allProductsData: allProductsData ?? this.allProductsData);
}
