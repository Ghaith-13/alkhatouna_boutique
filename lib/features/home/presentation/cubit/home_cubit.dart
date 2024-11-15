// ignore_for_file: non_constant_identifier_names, empty_catches, unused_local_variable

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/all_products/presentation/cubit/all_products_cubit.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/home/data/models/add_to_cart_model.dart';
import 'package:alkhatouna/features/home/data/models/brand_details_model.dart';
import 'package:alkhatouna/features/home/data/models/brands_model.dart';
import 'package:alkhatouna/features/home/data/models/categorey_children_model.dart';
import 'package:alkhatouna/features/home/data/models/favorite_model.dart';
import 'package:alkhatouna/features/home/data/models/full_search_model.dart';
import 'package:alkhatouna/features/home/data/models/product_model.dart';
import 'package:alkhatouna/features/home/data/models/review_model.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/data/models/user_categories_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_home_model.dart';
import '../../data/repositories/home_Repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit({required this.homeRepo}) : super(HomeState());
  // ChangeCategoryIndex() => emit(state.copyWith(subCategoryId: 0));
  Future<void> getHomeInfo(BuildContext context) async {
    emit(state.copyWith(loading: true));
    try {
      HomeModel response = await homeRepo.getHomeInfo();
      emit(state.copyWith(homeInfo: response.data));
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
    emit(state.copyWith(loading: false));
  }

  Future<void> getFullSearch(BuildContext context, String keyword) async {
    emit(state.copyWith(laodingFullSearch: true));
    try {
      FullSearchModel response = await homeRepo.getFullSearch(keyword);
      emit(state.copyWith(searchData: response.data));
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
    emit(state.copyWith(laodingFullSearch: false));
  }

  Future<void> getCategoreyChildren(BuildContext context, String catId) async {
    emit(state.copyWith(loadingCatChildren: true));
    try {
      CategoreyChildrenModel response =
          await homeRepo.getCategoreyChildren(catId);
      emit(state.copyWith(categoreyChildrenData: response.data));
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
    emit(state.copyWith(loadingCatChildren: false));
  }

  Future<void> getBrands(BuildContext context) async {
    emit(state.copyWith(loadingBrands: true));
    try {
      BrandsModel response = await homeRepo.getBrands();
      emit(state.copyWith(brandsData: response.data));
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
    emit(state.copyWith(loadingBrands: false));
  }

  Future exitBrandScreen() async {
    emit(state.copyWith(stopLoadingBrand: false, pageNumberForBrand: 1));
  }

  Future<void> getbrandsInfo(
    BuildContext context,
    String brandId,
  ) async {
    if (state.pageNumberForBrand == 1) {
      emit(state.copyWith(loadingBrands: true));
    }
    try {
      if (state.stopLoadingBrand == false) {
        BrandDetailsModel response =
            await homeRepo.getBrandDetails(brandId, state.pageNumberForBrand);
        if (response.data!.products!.length < 20) {
          emit(state.copyWith(stopLoadingBrand: true));
        }
        if (state.pageNumberForBrand == 1) {
          emit(state.copyWith(oneBrandDetails: response.data));
        } else {
          OneBrandDetails newbrandDetails = state.oneBrandDetails!;
          newbrandDetails.products!.addAll(response.data!.products!);
          emit(state.copyWith(oneBrandDetails: newbrandDetails));
        }
        emit(state.copyWith(pageNumberForBrand: state.pageNumberForBrand + 1));
      }
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
    emit(state.copyWith(loadingBrands: false));
  }

  cahngesearchValue(String value) => emit(state.copyWith(searchValue: value));
  cahngedontshowSearchIcon(bool value) =>
      emit(state.copyWith(dontshowSearchIcon: value));
  cahngeactiveTabIndex(int value) =>
      emit(state.copyWith(activeTabIndex: value));

  removeAllFilters() {
    emit(state.copyWith(maxPrice: -100));
    emit(state.copyWith(minPrice: -100));
    emit(state.copyWith(colorList: []));
    emit(state.copyWith(sizesList: []));
    emit(state.copyWith(dimensionsList: []));
    emit(state.copyWith(wiegthsList: []));
    emit(state.copyWith(selectedlistbrandId: []));
    emit(state.copyWith(filterDiscount: false));
    emit(state.copyWith(filterFeature: false));
  }

  EditeVariableForSearch() {
    emit(state.copyWith(maxPrice: -100));
    emit(state.copyWith(minPrice: -100));
    emit(state.copyWith(colorList: []));
    emit(state.copyWith(sizesList: []));
    emit(state.copyWith(dimensionsList: []));
    emit(state.copyWith(wiegthsList: []));
    emit(state.copyWith(selectedlistbrandId: []));
    emit(state.copyWith(filterDiscount: false));
    emit(state.copyWith(filterFeature: false));
    emit(state.copyWith(selectedlistbrandId: []));
    emit(state.copyWith(pageNumberForSub: 1));
    emit(state.copyWith(subCategoriesData: SubCategoryData()));
  }

  Future<void> getSubCategoriesInfo(BuildContext context, String categorryId,
      {bool fromFilter = false}) async {
    if (fromFilter) {
      Navigator.pop(context);

      emit(state.copyWith(loadingFilter: true));
    }
    if (fromFilter) {
      emit(state.copyWith(pageNumberBeforeFilter: state.pageNumberForSub));
      emit(state.copyWith(pageNumberForSub: 1));
      emit(state.copyWith(
          subCategoriesDataBeforeFilter: state.subCategoriesData));
      // emit(state.copyWith(subCategoriesData: []));

      // Navigator.pop(context);
    }

    if (state.pageNumberForSub == 1) {
      emit(state.copyWith(loadingSubCateogries: true));
    }
    try {
      SubCategoriesModel response = await homeRepo.GetSubGategories(
          categorryId,
          state.pageNumberForSub,
          state.minPrice,
          state.maxPrice,
          state.sizesList ?? [],
          state.colorList ?? [],
          state.wiegthsList ?? [],
          state.dimensionsList ?? [],
          state.selectedlistbrandId ?? [],
          state.filterDiscount,
          state.filterFeature,
          state.searchValue ?? "");
      emit(state.copyWith(searchValue: ""));
      emit(state.copyWith(selectedlistbrandId: []));

      if (fromFilter) {
        emit(state.copyWith(maxPrice: -100));
        emit(state.copyWith(minPrice: -100));
        emit(state.copyWith(colorList: []));
        emit(state.copyWith(sizesList: []));
        emit(state.copyWith(dimensionsList: []));
        emit(state.copyWith(wiegthsList: []));
      }
      if (state.pageNumberForSub == 1) {
        emit(state.copyWith(subCategoriesData: response.data));
        emit(state.copyWith(brands: response.brands));
      } else {
        SubCategoryData newsubCategoriesData = state.subCategoriesData!;
        newsubCategoriesData.products!.addAll(response.data!.products!);

        emit(state.copyWith(subCategoriesData: newsubCategoriesData));
        emit(state.copyWith(brands: response.brands));
      }
      emit(state.copyWith(pageNumberForSub: state.pageNumberForSub + 1));
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
    emit(state.copyWith(loadingSubCateogries: false));
  }

  changefilterFeature() =>
      emit(state.copyWith(filterFeature: !state.filterFeature));
  changefilterDiscount() =>
      emit(state.copyWith(filterDiscount: !state.filterDiscount));
  deleteFilter(BuildContext context, String ctegoreyId) {
    // emit(
    // state.copyWith(subCategoriesData: state.subCategoriesDataBeforeFilter));
    emit(state.copyWith(subCategoriesData: SubCategoryData()));
    // emit(state.copyWith(subCategoriesDataBeforeFilter: []));
    emit(state.copyWith(pageNumberForSub: 1));
    removeAllFilters();
    // emit(state.copyWith(pageNumberBeforeFilter: 1));
    getSubCategoriesInfo(context, ctegoreyId);
  }

  dealWithListIdForBrand(String value) {
    print(value);
    List<String> mylist = state.selectedlistbrandId ?? [];
    if (mylist.contains(value)) {
      // Remove the value if it exists
      mylist.remove(value);
      print("Removed $value from the list.");
    } else {
      // Add the value if it doesn't exist
      mylist.add(value);
      print("Added $value to the list.");
    }
    print(mylist);
    emit(state.copyWith(selectedlistbrandId: mylist));
  }

  changeSortName(String name) => emit(state.copyWith(sortName: name));
  changerating(int value) => emit(state.copyWith(rating: value));
  changereview(String value) => emit(state.copyWith(review: value));
  changeLoadingSubCateogries(bool value) =>
      emit(state.copyWith(loadingSubCateogries: value));

  changeSubCategory(SubCategoryData subCategoriesData) =>
      emit(state.copyWith(subCategoriesData: subCategoriesData));

  changePageNumberForSub(int pageNumberForSub) =>
      emit(state.copyWith(pageNumberForSub: pageNumberForSub));
  changeSubCategoryId(int subCategoryId) =>
      emit(state.copyWith(subCategoryId: subCategoryId));
  changeShowMesh() =>
      emit(state.copyWith(showmeshProducts: !state.showmeshProducts));

  /////////////////Filter//////////////
  changeMaxPrice(double maxPrice) => emit(state.copyWith(maxPrice: maxPrice));
  changeMinPrice(double minPrice) => emit(state.copyWith(minPrice: minPrice));
  changeColorList(List<String> colorList) {
    emit(state.copyWith(colorList: colorList));
    print(state.colorList);
  }

  changeSizesList(List<String> sizesList) {
    emit(state.copyWith(sizesList: sizesList));
  }

  changewiegthsList(List<String> wiegthsList) {
    emit(state.copyWith(wiegthsList: wiegthsList));
    print(state.wiegthsList);
  }

  changedimensionsList(List<String> dimensionsList) {
    emit(state.copyWith(dimensionsList: dimensionsList));
    print(state.dimensionsList);
  }

  changeColorSelected(String value) {
    emit(state.copyWith(selectedColor: value));
  }

  changeSelectedSize(String value) {
    emit(state.copyWith(selectedSize: value));
  }

  changedimensions(String value) {
    emit(state.copyWith(dimensions: value));
  }

  changeselectedWeight(String value) {
    emit(state.copyWith(selectedWeight: value));
  }

  Future<void> sendReview(
    BuildContext context,
    productID,
  ) async {
    try {
      emit(state.copyWith(laodingReview: true));
      Map<String, String> body = {};
      body['product_id'] = productID;
      body['review'] = "${state.review}";
      body['rate'] = "${state.rating}";
      print(state.review);
      print(state.rating);
      print(productID);
      ReviewModel? response = await homeRepo.sendReview(body: body);
      if (response.data!.message == "Review Updated successfully" ||
          response.data!.message == "Review Added successfully") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Thank you for sharing your review.".tr(context),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.pop(context);
        Navigator.pop(context);
        emit(state.copyWith(rating: 0, review: ""));
        getProductDetails(context, productID);
      }
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
    emit(state.copyWith(laodingReview: false));
  }

  ///////////////Favorite
  Future<void> toggleFavorite(BuildContext context, productID,
      {bool fromProductDetails = false,
      bool fromSimilarProduct = false,
      bool fromHome = false}) async {
    emit(state.copyWith(loadingSendFavorite: true));
    try {
      Map<String, String> body = {};
      body['product_id'] = productID;

      FavoriteModel? response = await homeRepo.toggleFavorite(body: body);
      // if (response.data!.message == "Product added to favorites") {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       backgroundColor: AppColors.primaryColor,
      //       padding: EdgeInsets.only(
      //           bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
      //       content: Text(
      //         "Product added successfully".tr(context),
      //         style: const TextStyle(color: Colors.white),
      //       ),
      //       duration: const Duration(seconds: 2),
      //     ),
      //   );
      // }
      // if (response.data!.message == "Product removed from favorites") {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       backgroundColor: AppColors.primaryColor,
      //       padding: EdgeInsets.only(
      //           bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
      //       content: Text(
      //         "Product removed successfully".tr(context),
      //         style: const TextStyle(color: Colors.white),
      //       ),
      //       duration: const Duration(seconds: 2),
      //     ),
      //   );
      // }
      if (fromProductDetails) {
        ProductData newProductData = state.productData!;
        newProductData.product!.isFavorite =
            !newProductData.product!.isFavorite!;
        emit(state.copyWith(productData: newProductData));
        context.read<FavoriteCubit>().clearAll();
        context.read<FavoriteCubit>().removeAllFilters();

        context.read<FavoriteCubit>().getFavoritesProduct(context);
        context.read<AllProductsCubit>().exitAllProductsScreen();

        context.read<AllProductsCubit>().getAllProducts(context, null);
      }
      if (fromSimilarProduct) {
        ProductData newData = state.productData!;
        for (int i = 0; i < newData.relatedProducts!.length; i++) {
          if (newData.relatedProducts![i].id == int.parse(productID)) {
            if (newData.relatedProducts![i].isFavorite!) {
              newData.relatedProducts![i].isFavorite = false;
            } else {
              newData.relatedProducts![i].isFavorite = true;
            }
          }
        }
        context.read<FavoriteCubit>().clearAll();
        context.read<FavoriteCubit>().removeAllFilters();

        context.read<FavoriteCubit>().getFavoritesProduct(context);
        emit(state.copyWith(loadingProductDetails: true));
        emit(state.copyWith(productData: newData));
        emit(state.copyWith(loadingProductDetails: false));
      }
      if (fromHome) {
        HomeData newHomeModel = state.homeInfo!;

        for (int i = 0; i < newHomeModel.bestSellingProducts!.length; i++) {
          if (newHomeModel.bestSellingProducts![i].id.toString() == productID) {
            newHomeModel.bestSellingProducts![i].is_favorite =
                !newHomeModel.bestSellingProducts![i].is_favorite!;
          }
        }
        for (int i = 0; i < newHomeModel.discountedProducts!.length; i++) {
          if (newHomeModel.discountedProducts![i].id.toString() == productID) {
            newHomeModel.discountedProducts![i].is_favorite =
                !newHomeModel.discountedProducts![i].is_favorite!;
          }
        }

        emit(state.copyWith(homeInfo: newHomeModel));
      }
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
    emit(state.copyWith(loadingSendFavorite: false));
  }

  removeProductInfoForCart() {
    emit(state.copyWith(
        selectedColor: "",
        selectedSize: "",
        selectedWeight: "",
        dimensions: ""));
  }

  Future<void> addToCart(
      BuildContext context, String productId, String Count) async {
    emit(state.copyWith(loadingAddToCart: true));
    try {
      Map<String, String> body = {};
      body['product_id'] = productId;
      body['hex_color'] = state.selectedColor;
      body['size'] = state.selectedSize;
      body['weight'] = state.selectedWeight;
      body['dimension'] = state.dimensions;
      body['quantity'] = Count;

      AddToCartModel? response = await homeRepo.addToCart(body: body);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.primaryColor,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            "The product has been successfully added to the cart.".tr(context),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      emit(state.copyWith(
          selectedColor: "",
          selectedSize: "",
          selectedWeight: "",
          dimensions: ""));
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
    emit(state.copyWith(loadingAddToCart: false));
  }
  //////////////////////Product Details

  Future<void> getProductDetails(BuildContext context, String id) async {
    emit(state.copyWith(loadingProductDetails: true));
    try {
      ProductModel response = await homeRepo.getProductDetails(id);

      emit(state.copyWith(productData: response.data));
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
    emit(state.copyWith(loadingProductDetails: false));
  }

  Future<void> getUserCategories(BuildContext context) async {
    emit(state.copyWith(loadingUserCategories: true));
    try {
      UserCategoriesModel response = await homeRepo.getUserCategories();

      emit(state.copyWith(userCategoriesData: response.data));
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
    emit(state.copyWith(loadingUserCategories: false));
  }
}
