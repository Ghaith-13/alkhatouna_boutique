// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:alkhatouna/features/favorite/data/models/favorite_model.dart';
import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  FavoriteState({
    this.favoriteData,
    this.favoriteDataBeforeFilter,
    this.loadingFavorite = false,
    this.loadingFilter = false,
    this.filterFeature = false,
    this.filterDiscount = false,
    this.subCategoryId = 0,
    this.activeTabIndex = 0,
    this.pageNumberForFav = 1,
    this.pageNumberBeforeFilter = 1,
    this.maxPrice = -100,
    this.minPrice = -100,
    this.sizesList,
    this.brands,
    this.colorList,
    this.weghitsList,
    this.selectedlistbrandId,
    this.dimensionsList,
  });
  List<String>? sizesList;
  List<String>? colorList;
  List<String>? weghitsList;
  List<Brands>? brands;
  List<String>? dimensionsList;
  List<String>? selectedlistbrandId;
  List<FavoriteData>? favoriteData;
  double? maxPrice, minPrice;
  List<FavoriteData>? favoriteDataBeforeFilter;
  bool loadingFavorite, loadingFilter, filterFeature, filterDiscount;
  int subCategoryId, pageNumberForFav, pageNumberBeforeFilter, activeTabIndex;

  @override
  List<Object?> get props => [
        favoriteData,
        dimensionsList,
        weghitsList,
        brands,
        activeTabIndex,
        sizesList,
        filterFeature,
        filterDiscount,
        loadingFilter,
        maxPrice,
        selectedlistbrandId,
        colorList,
        minPrice,
        favoriteDataBeforeFilter,
        loadingFavorite,
        subCategoryId,
        pageNumberForFav,
        pageNumberBeforeFilter
      ];
  FavoriteState copyWith(
          {List<FavoriteData>? favoriteData,
          List<FavoriteData>? favoriteDataBeforeFilter,
          List<String>? sizesList,
          List<String>? weghitsList,
          List<String>? dimensionsList,
          List<String>? colorList,
          List<String>? selectedlistbrandId,
          List<Brands>? brands,
          bool? loadingFavorite,
          bool? loadingFilter,
          bool? filterFeature,
          bool? filterDiscount,
          int? pageNumberBeforeFilter,
          int? activeTabIndex,
          int? subCategoryId,
          double? minPrice,
          double? maxPrice,
          int? pageNumberForFav}) =>
      FavoriteState(
          favoriteData: favoriteData ?? this.favoriteData,
          activeTabIndex: activeTabIndex ?? this.activeTabIndex,
          filterFeature: filterFeature ?? this.filterFeature,
          filterDiscount: filterDiscount ?? this.filterDiscount,
          selectedlistbrandId: selectedlistbrandId ?? this.selectedlistbrandId,
          dimensionsList: dimensionsList ?? this.dimensionsList,
          weghitsList: weghitsList ?? this.weghitsList,
          colorList: colorList ?? this.colorList,
          sizesList: sizesList ?? this.sizesList,
          maxPrice: maxPrice ?? this.maxPrice,
          brands: brands ?? this.brands,
          minPrice: minPrice ?? this.minPrice,
          favoriteDataBeforeFilter:
              favoriteDataBeforeFilter ?? this.favoriteDataBeforeFilter,
          loadingFilter: loadingFilter ?? this.loadingFilter,
          pageNumberBeforeFilter:
              pageNumberBeforeFilter ?? this.pageNumberBeforeFilter,
          pageNumberForFav: pageNumberForFav ?? this.pageNumberForFav,
          subCategoryId: subCategoryId ?? this.subCategoryId,
          loadingFavorite: loadingFavorite ?? this.loadingFavorite);
}
