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
      this.getHomeData = false,
      this.notifyProduct = false,
      this.suplliers,
      this.notifications,
      this.stopLoadingBrand = false,
      this.loadingProductSection = false,
      this.stopLoadingCategorey = false,
      this.loadingNotifications = false,
      this.loadingSendFavorite = false,
      this.loadingUserCategories = false,
      this.loadingSuplliers = false,
      this.showUpdatePhonePopUp = false,
      this.loadingSupllierProducts = false,
      this.laodingFullSearch = false,
      this.sendSuggestion = false,
      this.stopLoadingProductSection = false,
      this.loading = false,
      this.sectionProductsModel,
      this.loadingBrands = false,
      this.loadingCatChildren = false,
      this.loadingAddToCart = false,
      this.loadingoneBlog = false,
      this.getTheSection = false,
      this.stopLoadingSupllier = false,
      this.rating = 0,
      this.activeTabIndex = 0,
      this.productsSection,
      this.productsForSuplliers,
      this.pageNumberForProductsSection = 1,
      this.pageNumberForSupllier = 1,
      this.pageNumberForBrand = 1,
      this.selectedColor = "",
      this.keywordForBrand = "",
      this.dimensions = "",
      this.suggestionNumber = "",
      this.keyWordForBrandDetails = "",
      this.searchValue = "",
      this.reservationDate = "",
      this.suggestionsName = "",
      this.suggestionText = "",
      this.selectedlistbrandId,
      this.selectedSize = "",
      this.selectedWeight = "",
      this.review = "",
      this.brands,
      this.searchData,
      this.onePlogModel,
      this.getPlogsModel,
      this.categoreyChildrenData,
      this.loadingProductDetails = false,
      this.stopLoading = false,
      this.loadingSubCateogries = false,
      this.loadingSideBarSection = false,
      this.homeInfo,
      this.brandsData,
      this.sideBarSections,
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
      this.userCategoriesData,
      this.dimensionsList,
      this.pageNumberBeforeFilter = 1});

  var sortName;
  List<String>? colorList;
  List<Notifications>? notifications = [];
  List<String>? wiegthsList;
  List<AllProductsProduct>? productsForSuplliers;
  List<ProductsSection>? productsSection = [];
  List<Suppliers>? suplliers = [];
  List<String>? selectedlistbrandId;
  List<String>? sizesList;
  List<String>? dimensionsList;
  SectionProductsModel? sectionProductsModel;
  List<SideBarSections>? sideBarSections = [];
  UserCategoriesData? userCategoriesData;
  OneBrandDetails? oneBrandDetails;
  SearchData? searchData;
  OnePlogModel? onePlogModel;
  String? review, suggestionsName;
  BrandsData? brandsData;
  GetPlogsModel? getPlogsModel;
  String? searchValue;
  String? keyWordForBrandDetails;
  String? reservationDate;
  String? keywordForBrand;
  String? suggestionText, suggestionNumber;
  List<Brands>? brands;
  int? pageNumberForProductsSection;
  int? pageNumberForSupllier;
  CategoreyChildrenData? categoreyChildrenData;
  bool showmeshProducts,
      loading,
      stopLoadingSupllier,
      showUpdatePhonePopUp,
      stopLoadingCategorey,
      loadingNotifications,
      loadingUserCategories,
      loadingSendFavorite,
      loadingSuplliers,
      notifyProduct,
      getHomeData,
      loadingBrands,
      sendSuggestion,
      loadingSupllierProducts,
      loadingoneBlog,
      loadingProductSection,
      stopLoadingProductSection,
      stopLoadingBrand,
      getTheSection,
      loadingSideBarSection,
      laodingReview,
      loadingProductDetails,
      dontshowSearchIcon,
      loadingCatChildren,
      laodingFullSearch,
      filterDiscount,
      filterFeature,
      loadingSubCateogries,
      loadingFilter,
      loadingAddToCart,
      stopLoading;
  HomeData? homeInfo;
  SubCategoryData? subCategoriesData;
  SubCategoryData? subCategoriesDataBeforeFilter;
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
        productsSection,
        notifications,
        showmeshProducts,
        showUpdatePhonePopUp,
        suggestionsName,
        reservationDate,
        keywordForBrand,
        sectionProductsModel,
        keyWordForBrandDetails,
        stopLoadingSupllier,
        loadingNotifications,
        productsForSuplliers,
        loadingUserCategories,
        stopLoadingCategorey,
        pageNumberForSupllier,
        loadingSuplliers,
        loadingSupllierProducts,
        suplliers,
        loadingSendFavorite,
        suggestionText,
        sendSuggestion,
        homeInfo,
        suggestionNumber,
        stopLoadingBrand,
        loadingProductSection,
        searchValue,
        getHomeData,
        loadingoneBlog,
        onePlogModel,
        oneBrandDetails,
        getPlogsModel,
        userCategoriesData,
        stopLoadingProductSection,
        notifyProduct,
        laodingFullSearch,
        getTheSection,
        loadingCatChildren,
        selectedlistbrandId,
        brandsData,
        pageNumberForProductsSection,
        loadingSideBarSection,
        categoreyChildrenData,
        pageNumberForBrand,
        laodingReview,
        searchData,
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
        sideBarSections,
        colorList
      ];
  HomeState copyWith(
          {var sortName,
          bool? showmeshProducts,
          bool? loadingFilter,
          bool? stopLoadingSupllier,
          bool? loadingAddToCart,
          bool? laodingReview,
          bool? loadingSuplliers,
          bool? stopLoadingCategorey,
          bool? loadingSupllierProducts,
          bool? showUpdatePhonePopUp,
          bool? loadingNotifications,
          bool? notifyProduct,
          bool? sendSuggestion,
          List<Notifications>? notifications,
          List<ProductsSection>? productsSection,
          List<AllProductsProduct>? productsForSuplliers,
          List<Suppliers>? suplliers,
          bool? getHomeData,
          bool? loadingSideBarSection,
          bool? loadingProductSection,
          OnePlogModel? onePlogModel,
          bool? stopLoadingProductSection,
          bool? loadingUserCategories,
          SectionProductsModel? sectionProductsModel,
          List<SideBarSections>? sideBarSections,
          bool? filterFeature,
          bool? stopLoadingBrand,
          bool? loadingoneBlog,
          bool? filterDiscount,
          GetPlogsModel? getPlogsModel,
          bool? loadingCatChildren,
          bool? getTheSection,
          bool? dontshowSearchIcon,
          bool? loadingSendFavorite,
          bool? loadingProductDetails,
          bool? laodingFullSearch,
          bool? stopLoading,
          UserCategoriesData? userCategoriesData,
          CategoreyChildrenData? categoreyChildrenData,
          bool? loadingBrands,
          String? searchValue,
          String? selectedColor,
          String? suggestionsName,
          String? keyWordForBrandDetails,
          String? reservationDate,
          String? keywordForBrand,
          int? pageNumberForProductsSection,
          int? pageNumberForSupllier,
          String? review,
          String? dimensions,
          String? suggestionText,
          String? suggestionNumber,
          String? selectedWeight,
          OneBrandDetails? oneBrandDetails,
          String? selectedSize,
          SearchData? searchData,
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
          SubCategoryData? subCategoriesData,
          SubCategoryData? subCategoriesDataBeforeFilter,
          bool? loading}) =>
      HomeState(
        sortName: sortName ?? this.sortName,
        keyWordForBrandDetails:
            keyWordForBrandDetails ?? this.keyWordForBrandDetails,
        keywordForBrand: keywordForBrand ?? this.keywordForBrand,
        showUpdatePhonePopUp: showUpdatePhonePopUp ?? this.showUpdatePhonePopUp,
        notifications: notifications ?? this.notifications,
        reservationDate: reservationDate ?? this.reservationDate,
        stopLoadingSupllier: stopLoadingSupllier ?? this.stopLoadingSupllier,
        loadingNotifications: loadingNotifications ?? this.loadingNotifications,
        productsForSuplliers: productsForSuplliers ?? this.productsForSuplliers,
        stopLoadingCategorey: stopLoadingCategorey ?? this.stopLoadingCategorey,
        loadingSupllierProducts:
            loadingSupllierProducts ?? this.loadingSupllierProducts,
        pageNumberForSupllier:
            pageNumberForSupllier ?? this.pageNumberForSupllier,
        loadingSuplliers: loadingSuplliers ?? this.loadingSuplliers,
        suplliers: suplliers ?? this.suplliers,
        suggestionText: suggestionText ?? this.suggestionText,
        suggestionNumber: suggestionNumber ?? this.suggestionNumber,
        sendSuggestion: sendSuggestion ?? this.sendSuggestion,
        suggestionsName: suggestionsName ?? this.suggestionsName,
        notifyProduct: notifyProduct ?? this.notifyProduct,
        loadingoneBlog: loadingoneBlog ?? this.loadingoneBlog,
        onePlogModel: onePlogModel ?? this.onePlogModel,
        stopLoadingProductSection:
            stopLoadingProductSection ?? this.stopLoadingProductSection,
        loadingProductSection:
            loadingProductSection ?? this.loadingProductSection,
        sectionProductsModel: sectionProductsModel ?? this.sectionProductsModel,
        getHomeData: getHomeData ?? this.getHomeData,
        productsSection: productsSection ?? this.productsSection,
        pageNumberForProductsSection:
            pageNumberForProductsSection ?? this.pageNumberForProductsSection,
        dontshowSearchIcon: dontshowSearchIcon ?? this.dontshowSearchIcon,
        getTheSection: getTheSection ?? this.getTheSection,
        loadingSideBarSection:
            loadingSideBarSection ?? this.loadingSideBarSection,
        categoreyChildrenData:
            categoreyChildrenData ?? this.categoreyChildrenData,
        stopLoadingBrand: stopLoadingBrand ?? this.stopLoadingBrand,
        getPlogsModel: getPlogsModel ?? this.getPlogsModel,
        loadingBrands: loadingBrands ?? this.loadingBrands,
        sideBarSections: sideBarSections ?? this.sideBarSections,
        loadingUserCategories:
            loadingUserCategories ?? this.loadingUserCategories,
        loadingCatChildren: loadingCatChildren ?? this.loadingCatChildren,
        oneBrandDetails: oneBrandDetails ?? this.oneBrandDetails,
        userCategoriesData: userCategoriesData ?? this.userCategoriesData,
        searchData: searchData ?? this.searchData,
        stopLoading: stopLoading ?? this.stopLoading,
        laodingFullSearch: laodingFullSearch ?? this.laodingFullSearch,
        loadingSendFavorite: loadingSendFavorite ?? this.loadingSendFavorite,
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
