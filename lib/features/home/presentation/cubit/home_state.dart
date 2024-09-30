// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_typing_uninitialized_variables

part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState(
      {this.sortName = "",
      this.showmeshProducts = true,
      this.laodingReview = false,
      this.filterFeature = false,
      this.dontshowSearchIcon = false,
      this.filterDiscount = false,
      this.stopLoadingBrand = false,
      this.loading = false,
      this.loadingBrands = false,
      this.loadingAddToCart = false,
      this.rating = 0,
      this.activeTabIndex = 0,
      this.pageNumberForBrand = 1,
      this.selectedColor = "",
      this.dimensions = "",
      this.searchValue = "",
      this.selectedlistbrandId,
      this.selectedSize = "",
      this.selectedWeight = "",
      this.review = "",
      this.brands,
      this.loadingProductDetails = false,
      this.stopLoading = false,
      this.loadingSubCateogries = false,
      this.homeInfo,
      this.brandsData,
      this.subCategoriesData,
      this.subCategoryId = 0,
      this.loadingFilter = false,
      this.pageNumberForSub = 1,
      this.minPrice = -100,
      this.maxPrice = -100,
      this.colorList,
      this.subCategoriesDataBeforeFilter,
      this.productData,
      this.sizesList,
      this.wiegthsList,
      this.oneBrandDetails,
      this.dimensionsList,
      this.pageNumberBeforeFilter = 1});

  var sortName;
  List<String>? colorList;
  List<String>? wiegthsList;
  List<String>? selectedlistbrandId;
  List<String>? sizesList;
  List<String>? dimensionsList;
  OneBrandDetails? oneBrandDetails;
  String? review;
  BrandsData? brandsData;
  String? searchValue;
  List<Brands>? brands;
  bool showmeshProducts,
      loading,
      loadingBrands,
      stopLoadingBrand,
      laodingReview,
      loadingProductDetails,
      dontshowSearchIcon,
      filterDiscount,
      filterFeature,
      loadingSubCateogries,
      loadingFilter,
      loadingAddToCart,
      stopLoading;
  HomeData? homeInfo;
  List<SubCategoryData>? subCategoriesData;
  List<SubCategoryData>? subCategoriesDataBeforeFilter;
  int subCategoryId,
      pageNumberForSub,
      pageNumberBeforeFilter,
      pageNumberForBrand,
      rating,
      activeTabIndex;
  double minPrice, maxPrice;
  ProductData? productData;
  String selectedColor;
  String dimensions;
  String selectedSize;
  String selectedWeight;

  @override
  List<Object?> get props => [
        sortName,
        subCategoriesDataBeforeFilter,
        review,
        showmeshProducts,
        homeInfo,
        stopLoadingBrand,
        searchValue,
        oneBrandDetails,
        selectedlistbrandId,
        brandsData,
        pageNumberForBrand,
        laodingReview,
        filterFeature,
        dontshowSearchIcon,
        brands,
        selectedColor,
        filterDiscount,
        selectedWeight,
        rating,
        loadingFilter,
        loadingAddToCart,
        dimensionsList,
        wiegthsList,
        productData,
        dimensions,
        activeTabIndex,
        sizesList,
        loadingProductDetails,
        subCategoryId,
        selectedSize,
        maxPrice,
        stopLoading,
        minPrice,
        loading,
        loadingBrands,
        pageNumberBeforeFilter,
        loadingSubCateogries,
        subCategoriesData,
        pageNumberForSub,
        colorList
      ];
  HomeState copyWith(
          {var sortName,
          bool? showmeshProducts,
          bool? loadingFilter,
          bool? loadingAddToCart,
          bool? laodingReview,
          bool? filterFeature,
          bool? stopLoadingBrand,
          bool? filterDiscount,
          bool? dontshowSearchIcon,
          bool? loadingProductDetails,
          bool? stopLoading,
          bool? loadingBrands,
          String? searchValue,
          String? selectedColor,
          String? review,
          String? dimensions,
          String? selectedWeight,
          OneBrandDetails? oneBrandDetails,
          String? selectedSize,
          int? subCategoryId,
          int? rating,
          int? pageNumberForBrand,
          int? activeTabIndex,
          ProductData? productData,
          List<String>? colorList,
          List<Brands>? brands,
          BrandsData? brandsData,
          List<String>? wiegthsList,
          List<String>? selectedlistbrandId,
          List<String>? sizesList,
          List<String>? dimensionsList,
          double? maxPrice,
          double? minPrice,
          int? pageNumberForSub,
          int? pageNumberBeforeFilter,
          bool? loadingSubCateogries,
          HomeData? homeInfo,
          List<SubCategoryData>? subCategoriesData,
          List<SubCategoryData>? subCategoriesDataBeforeFilter,
          bool? loading}) =>
      HomeState(
        sortName: sortName ?? this.sortName,
        dontshowSearchIcon: dontshowSearchIcon ?? this.dontshowSearchIcon,
        stopLoadingBrand: stopLoadingBrand ?? this.stopLoadingBrand,
        loadingBrands: loadingBrands ?? this.loadingBrands,
        oneBrandDetails: oneBrandDetails ?? this.oneBrandDetails,
        stopLoading: stopLoading ?? this.stopLoading,
        filterFeature: filterFeature ?? this.filterFeature,
        filterDiscount: filterDiscount ?? this.filterDiscount,
        pageNumberForBrand: pageNumberForBrand ?? this.pageNumberForBrand,
        dimensions: dimensions ?? this.dimensions,
        brandsData: brandsData ?? this.brandsData,
        selectedWeight: selectedWeight ?? this.selectedWeight,
        selectedlistbrandId: selectedlistbrandId ?? this.selectedlistbrandId,
        searchValue: searchValue ?? this.searchValue,
        activeTabIndex: activeTabIndex ?? this.activeTabIndex,
        review: review ?? this.review,
        rating: rating ?? this.rating,
        brands: brands ?? this.brands,
        laodingReview: laodingReview ?? this.laodingReview,
        selectedSize: selectedSize ?? this.selectedSize,
        dimensionsList: dimensionsList ?? this.dimensionsList,
        wiegthsList: wiegthsList ?? this.wiegthsList,
        selectedColor: selectedColor ?? this.selectedColor,
        loadingAddToCart: loadingAddToCart ?? this.loadingAddToCart,
        productData: productData ?? this.productData,
        loadingProductDetails:
            loadingProductDetails ?? this.loadingProductDetails,
        colorList: colorList ?? this.colorList,
        loadingFilter: loadingFilter ?? this.loadingFilter,
        subCategoriesDataBeforeFilter:
            subCategoriesDataBeforeFilter ?? this.subCategoriesDataBeforeFilter,
        sizesList: sizesList ?? this.sizesList,
        maxPrice: maxPrice ?? this.maxPrice,
        pageNumberBeforeFilter:
            pageNumberBeforeFilter ?? this.pageNumberBeforeFilter,
        minPrice: minPrice ?? this.minPrice,
        pageNumberForSub: pageNumberForSub ?? this.pageNumberForSub,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        loadingSubCateogries: loadingSubCateogries ?? this.loadingSubCateogries,
        loading: loading ?? this.loading,
        homeInfo: homeInfo ?? this.homeInfo,
        subCategoriesData: subCategoriesData ?? this.subCategoriesData,
        showmeshProducts: showmeshProducts ?? this.showmeshProducts,
      );
}
