// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:alkhatouna/features/favorite/data/models/favorite_model.dart';
import 'package:alkhatouna/features/favorite/data/repositories/favorite_repo.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit({required this.favoriteRepo}) : super(FavoriteState());
  dealWithListIdForBrand(String value) {
    // print(value);
    List<String> mylist = state.selectedlistbrandId ?? [];
    if (mylist.contains(value)) {
      // Remove the value if it exists
      mylist.remove(value);
      // print("Removed $value from the list.");
    } else {
      // Add the value if it doesn't exist
      mylist.add(value);
      // print("Added $value to the list.");
    }
    // print(mylist);
    emit(state.copyWith(selectedlistbrandId: mylist));
  }

  removeAllFilters() {
    emit(state.copyWith(maxPrice: -100));
    emit(state.copyWith(minPrice: -100));
    emit(state.copyWith(colorList: []));
    emit(state.copyWith(sizesList: []));
    emit(state.copyWith(dimensionsList: []));
    emit(state.copyWith(weghitsList: []));
    emit(state.copyWith(selectedlistbrandId: []));
    emit(state.copyWith(filterDiscount: false));
    emit(state.copyWith(filterFeature: false));
  }

  changefilterFeature() =>
      emit(state.copyWith(filterFeature: !state.filterFeature));
  changefilterDiscount() =>
      emit(state.copyWith(filterDiscount: !state.filterDiscount));
  deleteFilter(BuildContext context) {
    // emit(
    // state.copyWith(subCategoriesData: state.subCategoriesDataBeforeFilter));
    emit(state.copyWith(favoriteData: []));
    // emit(state.copyWith(subCategoriesDataBeforeFilter: []));
    emit(state.copyWith(pageNumberForFav: 1));
    removeAllFilters();
    // emit(state.copyWith(pageNumberBeforeFilter: 1));
    getFavoritesProduct(context);
  }

  Future<void> getFavoritesProduct(BuildContext context,
      {bool fromFilter = false}) async {
    if (fromFilter) {
      Navigator.pop(context);

      emit(state.copyWith(loadingFilter: true));
    }
    if (fromFilter) {
      emit(state.copyWith(pageNumberBeforeFilter: state.pageNumberForFav));
      emit(state.copyWith(pageNumberForFav: 1));
      emit(state.copyWith(favoriteDataBeforeFilter: state.favoriteData));
      // emit(state.copyWith(favoriteData: []));

      // Navigator.pop(context);
    }
    if (state.pageNumberForFav == 1) {
      emit(state.copyWith(loadingFavorite: true));
    }
    try {
      FavoriteProductModel response = await favoriteRepo.getFavoriteProducts(
        state.pageNumberForFav,
        state.minPrice ?? -100,
        state.maxPrice ?? -100,
        state.sizesList ?? [],
        state.colorList ?? [],
        state.weghitsList ?? [],
        state.dimensionsList ?? [],
        state.selectedlistbrandId ?? [],
        state.filterDiscount,
        state.filterFeature,
      );

      if (fromFilter) {
        emit(state.copyWith(maxPrice: -100));
        emit(state.copyWith(minPrice: -100));
        emit(state.copyWith(colorList: []));
        emit(state.copyWith(sizesList: []));
        emit(state.copyWith(dimensionsList: []));
        emit(state.copyWith(weghitsList: []));
      }
      if (state.pageNumberForFav == 1) {
        emit(state.copyWith(favoriteData: response.data));
        emit(state.copyWith(brands: response.brands));
      } else {
        List<FavoriteData>? newfavoriteData = state.favoriteData ?? [];
        for (int i = 0; i < state.favoriteData!.length; i++) {
          newfavoriteData[i].products!.addAll(response.data![i].products!);
        }
        emit(state.copyWith(favoriteData: newfavoriteData));
        emit(state.copyWith(brands: response.brands));
      }
      emit(state.copyWith(pageNumberForFav: state.pageNumberForFav + 1));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    if (fromFilter) {
      emit(state.copyWith(loadingFilter: false));
    }
    emit(state.copyWith(loadingFavorite: false));
  }

  clearAll() {
    emit(state.copyWith(
      pageNumberForFav: 1,
      favoriteData: [],
      brands: [],
    ));
  }

  // deleteFilter() {
  //   emit(state.copyWith(favoriteData: state.favoriteDataBeforeFilter));
  //   emit(state.copyWith(favoriteDataBeforeFilter: []));
  //   emit(state.copyWith(pageNumberForFav: state.pageNumberBeforeFilter));
  //   emit(state.copyWith(pageNumberBeforeFilter: 1));
  // }

  changeColorList(List<String> colorList) {
    emit(state.copyWith(colorList: colorList));
    // print(state.colorList);
  }

  changeSizesList(List<String> sizesList) {
    emit(state.copyWith(sizesList: sizesList));
    // print(state.sizesList);
  }

  changeactiveTabIndex(int value) {
    emit(state.copyWith(activeTabIndex: value));
  }

  changeweghitsList(List<String> weghitsList) {
    emit(state.copyWith(weghitsList: weghitsList));
    // print(state.weghitsList);
  }

  changedimensionsList(List<String> dimensionsList) {
    emit(state.copyWith(dimensionsList: dimensionsList));
    // print(state.dimensionsList);
  }

  changeFavoriteData(List<FavoriteData>? favoriteData) =>
      emit(state.copyWith(favoriteData: favoriteData));
  changeSubCategoryId(int subCategoryId) =>
      emit(state.copyWith(subCategoryId: subCategoryId));
  toggleFavorite(int productId) {
    List<FavoriteData> newlist = state.favoriteData!;
    List<FavoriteProduct> newProduct = [];

    for (int i = 0;
        i < state.favoriteData![state.subCategoryId].products!.length;
        i++) {
      if (state.favoriteData![state.subCategoryId].products![i].id ==
          productId) {
      } else {
        newProduct.add(state.favoriteData![state.subCategoryId].products![i]);
      }
    }
    newlist[state.subCategoryId].products = newProduct;
    emit(state.copyWith(favoriteData: []));
    emit(state.copyWith(favoriteData: newlist));
  }
}
