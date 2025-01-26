class HomeModel {
  HomeData? data;
  bool? errors;

  HomeModel({this.data, this.errors});

  HomeModel.fromJson(Map<String, dynamic>? json) {
    data = json?['data'] != null ? new HomeData.fromJson(json?['data']) : null;
    errors = json?['errors'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.data != null) {
      data?['data'] = this.data!.toJson();
    }
    data?['errors'] = this.errors;
    return data;
  }
}

class HomeData {
  List<Banners>? banners;
  List<Banners>? topBanners;
  List<Categories>? categories;
  List<HomeBrands>? brands;
  List<BestSellingProducts>? bestSellingProducts;
  List<BestSellingProducts>? new_arrival;
  List<BestSellingProducts>? with_qouta;
  List<BestSellingProducts>? on_tiktok;
  List<DiscountedProducts>? discountedProducts;
  String? phone_number;
  UserCategoryData? userCategoryData;

  HomeData(
      {this.banners,
      this.categories,
      this.brands,
      this.bestSellingProducts,
      this.discountedProducts,
      this.phone_number,
      this.topBanners,
      this.new_arrival,
      this.with_qouta,
      this.on_tiktok,
      this.userCategoryData});

  HomeData.fromJson(Map<String, dynamic>? json) {
    if (json?['top_banners'] != null) {
      topBanners = <Banners>[];
      json?['top_banners'].forEach((v) {
        topBanners!.add(new Banners.fromJson(v));
      });
    }
    if (json?['banners'] != null) {
      banners = <Banners>[];
      json?['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    if (json?['categories'] != null) {
      categories = <Categories>[];
      json?['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json?['brands'] != null) {
      brands = <HomeBrands>[];
      json?['brands'].forEach((v) {
        brands!.add(new HomeBrands.fromJson(v));
      });
    }
    if (json?['best_selling_products'] != null) {
      bestSellingProducts = <BestSellingProducts>[];
      json?['best_selling_products'].forEach((v) {
        bestSellingProducts!.add(new BestSellingProducts.fromJson(v));
      });
    }
    if (json?['with_qouta'] != null) {
      with_qouta = <BestSellingProducts>[];
      json?['with_qouta'].forEach((v) {
        with_qouta!.add(new BestSellingProducts.fromJson(v));
      });
    }
    if (json?['on_tiktok'] != null) {
      on_tiktok = <BestSellingProducts>[];
      json?['on_tiktok'].forEach((v) {
        on_tiktok!.add(new BestSellingProducts.fromJson(v));
      });
    }
    if (json?['new_arrival'] != null) {
      new_arrival = <BestSellingProducts>[];
      json?['new_arrival'].forEach((v) {
        new_arrival!.add(new BestSellingProducts.fromJson(v));
      });
    }
    if (json?['discounted_products'] != null) {
      discountedProducts = <DiscountedProducts>[];
      json?['discounted_products'].forEach((v) {
        discountedProducts!.add(new DiscountedProducts.fromJson(v));
      });
    }
    phone_number = json?['phone_number'];
    userCategoryData = json?['user_category_data'] != null
        ? new UserCategoryData.fromJson(json?['user_category_data'])
        : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.topBanners != null) {
      data?['top_banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data?['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data?['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data?['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    if (this.bestSellingProducts != null) {
      data?['best_selling_products'] =
          this.bestSellingProducts!.map((v) => v.toJson()).toList();
    }
    if (this.with_qouta != null) {
      data?['with_qouta'] = this.with_qouta!.map((v) => v.toJson()).toList();
    }
    if (this.on_tiktok != null) {
      data?['on_tiktok'] = this.on_tiktok!.map((v) => v.toJson()).toList();
    }
    if (this.new_arrival != null) {
      data?['new_arrival'] = this.new_arrival!.map((v) => v.toJson()).toList();
    }
    if (this.discountedProducts != null) {
      data?['discounted_products'] =
          this.discountedProducts!.map((v) => v.toJson()).toList();
    }
    data?['phone_number'] = this.phone_number;
    if (this.userCategoryData != null) {
      data?['user_category_data'] = this.userCategoryData!.toJson();
    }
    return data;
  }
}

class Banners {
  var id;
  var name;
  var image;
  var type;
  var categoryId;
  var productId;
  var brandId;
  var isVisible;
  var expiryDate;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var imageUrl;
  var redirection_url;

  Banners(
      {this.id,
      this.name,
      this.image,
      this.type,
      this.categoryId,
      this.productId,
      this.brandId,
      this.isVisible,
      this.expiryDate,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.redirection_url,
      this.updatedAt,
      this.imageUrl});

  Banners.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    image = json?['image'];
    type = json?['type'];
    categoryId = json?['category_id'];
    productId = json?['product_id'];
    brandId = json?['brand_id'];
    isVisible = json?['is_visible'];
    expiryDate = json?['expiry_date'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    imageUrl = json?['image_url'];
    redirection_url = json?['redirection_url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['image'] = this.image;
    data?['type'] = this.type;
    data?['category_id'] = this.categoryId;
    data?['product_id'] = this.productId;
    data?['brand_id'] = this.brandId;
    data?['is_visible'] = this.isVisible;
    data?['expiry_date'] = this.expiryDate;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['image_url'] = this.imageUrl;
    data?['redirection_url'] = this.redirection_url;
    return data;
  }
}

class Categories {
  var id;
  var type;
  var nameAr;
  var nameEn;
  var nameKu;
  var image;
  var isVisible;
  var parentId;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var imageUrl;
  List<Children>? children;

  Categories(
      {this.id,
      this.type,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.image,
      this.isVisible,
      this.parentId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.imageUrl,
      this.children});

  Categories.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    type = json?['type'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    image = json?['image'];
    isVisible = json?['is_visible'];
    parentId = json?['parent_id'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    imageUrl = json?['image_url'];
    if (json?['children'] != null) {
      children = <Children>[];
      json?['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['type'] = this.type;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['image'] = this.image;
    data?['is_visible'] = this.isVisible;
    data?['parent_id'] = this.parentId;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['image_url'] = this.imageUrl;
    if (this.children != null) {
      data?['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  var id;
  var type;
  var nameAr;
  var nameEn;
  var nameKu;
  var image;
  var isVisible;
  var parentId;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var imageUrl;

  Children(
      {this.id,
      this.type,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.image,
      this.isVisible,
      this.parentId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  Children.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    type = json?['type'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    image = json?['image'];
    isVisible = json?['is_visible'];
    parentId = json?['parent_id'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    imageUrl = json?['image_url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['type'] = this.type;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['image'] = this.image;
    data?['is_visible'] = this.isVisible;
    data?['parent_id'] = this.parentId;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['image_url'] = this.imageUrl;
    return data;
  }
}

class HomeBrands {
  var id;
  var name;
  var logo;
  var status;
  var createdAt;
  var updatedAt;
  var createdBy;
  var updatedBy;
  var logoUrl;

  HomeBrands(
      {this.id,
      this.name,
      this.logo,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.logoUrl});

  HomeBrands.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    logo = json?['logo'];
    status = json?['status'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    logoUrl = json?['logo_url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['logo'] = this.logo;
    data?['status'] = this.status;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['logo_url'] = this.logoUrl;
    return data;
  }
}

class BestSellingProducts {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  var price;
  bool? isDiscount;
  var discount;
  var priceAfterDiscount;
  var reviewCount;
  var reviewAvg;
  var imageUrl;
  var isFeatured;
  var createdAt;
  var finalPrice;
  var minAvailableQuantity;
  var currentQuantity;
  var isOutOfStock;
  bool? displayProduct;
  bool? is_favorite;
  var brandName;

  BestSellingProducts(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.price,
      this.isDiscount,
      this.discount,
      this.priceAfterDiscount,
      this.reviewCount,
      this.reviewAvg,
      this.imageUrl,
      this.isFeatured,
      this.createdAt,
      this.finalPrice,
      this.minAvailableQuantity,
      this.currentQuantity,
      this.isOutOfStock,
      this.displayProduct,
      this.is_favorite,
      this.brandName});

  BestSellingProducts.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    price = json?['price'];
    isDiscount = json?['is_discount'];
    discount = json?['discount'];
    priceAfterDiscount = json?['price_after_discount'];
    reviewCount = json?['review_count'];
    reviewAvg = json?['review_avg'];
    imageUrl = json?['image_url'];
    isFeatured = json?['is_featured'];
    createdAt = json?['created_at'];
    finalPrice = json?['final_price'];
    minAvailableQuantity = json?['min_available_quantity'];
    currentQuantity = json?['current_quantity'];
    isOutOfStock = json?['is_out_of_stock'];
    displayProduct = json?['display_product'];
    brandName = json?['brand_name'];
    is_favorite = json?['is_favorite'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['price'] = this.price;
    data?['is_discount'] = this.isDiscount;
    data?['discount'] = this.discount;
    data?['price_after_discount'] = this.priceAfterDiscount;
    data?['review_count'] = this.reviewCount;
    data?['review_avg'] = this.reviewAvg;
    data?['image_url'] = this.imageUrl;
    data?['is_featured'] = this.isFeatured;
    data?['created_at'] = this.createdAt;
    data?['final_price'] = this.finalPrice;
    data?['min_available_quantity'] = this.minAvailableQuantity;
    data?['current_quantity'] = this.currentQuantity;
    data?['is_out_of_stock'] = this.isOutOfStock;
    data?['display_product'] = this.displayProduct;
    data?['brand_name'] = this.brandName;
    data?['is_favorite'] = this.is_favorite;
    return data;
  }
}

class DiscountedProducts {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  var price;
  bool? isDiscount;
  var discount;
  var priceAfterDiscount;
  var reviewCount;
  var reviewAvg;
  var imageUrl;
  var isFeatured;
  var createdAt;
  var finalPrice;
  var minAvailableQuantity;
  var currentQuantity;
  var isOutOfStock;
  bool? displayProduct;
  bool? is_favorite;
  var brandName;

  DiscountedProducts(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.price,
      this.isDiscount,
      this.discount,
      this.priceAfterDiscount,
      this.reviewCount,
      this.reviewAvg,
      this.imageUrl,
      this.isFeatured,
      this.createdAt,
      this.finalPrice,
      this.minAvailableQuantity,
      this.currentQuantity,
      this.isOutOfStock,
      this.displayProduct,
      this.is_favorite,
      this.brandName});

  DiscountedProducts.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    price = json?['price'];
    isDiscount = json?['is_discount'];
    discount = json?['discount'];
    priceAfterDiscount = json?['price_after_discount'];
    reviewCount = json?['review_count'];
    reviewAvg = json?['review_avg'];
    imageUrl = json?['image_url'];
    isFeatured = json?['is_featured'];
    createdAt = json?['created_at'];
    finalPrice = json?['final_price'];
    minAvailableQuantity = json?['min_available_quantity'];
    currentQuantity = json?['current_quantity'];
    isOutOfStock = json?['is_out_of_stock'];
    displayProduct = json?['display_product'];
    brandName = json?['brand_name'];
    is_favorite = json?['is_favorite'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['price'] = this.price;
    data?['is_discount'] = this.isDiscount;
    data?['discount'] = this.discount;
    data?['price_after_discount'] = this.priceAfterDiscount;
    data?['review_count'] = this.reviewCount;
    data?['review_avg'] = this.reviewAvg;
    data?['image_url'] = this.imageUrl;
    data?['is_featured'] = this.isFeatured;
    data?['created_at'] = this.createdAt;
    data?['final_price'] = this.finalPrice;
    data?['min_available_quantity'] = this.minAvailableQuantity;
    data?['current_quantity'] = this.currentQuantity;
    data?['is_out_of_stock'] = this.isOutOfStock;
    data?['display_product'] = this.displayProduct;
    data?['brand_name'] = this.brandName;
    data?['is_favorite'] = this.is_favorite;
    return data;
  }
}

class UserCategoryData {
  String? currentCategoryEn;
  String? currentCategoryAr;
  String? currentCategoryKu;
  int? completedOrdersCount;
  String? nextCategoryEn;
  String? nextCategoryAr;
  String? nextCategoryKu;
  int? progressPercentage;
  int? ordersNeeded;
  String? messageEn;
  String? messageAr;
  String? messageKu;

  UserCategoryData(
      {this.currentCategoryEn,
      this.currentCategoryAr,
      this.currentCategoryKu,
      this.completedOrdersCount,
      this.nextCategoryEn,
      this.nextCategoryAr,
      this.nextCategoryKu,
      this.progressPercentage,
      this.ordersNeeded,
      this.messageEn,
      this.messageAr,
      this.messageKu});

  UserCategoryData.fromJson(Map<String, dynamic> json) {
    currentCategoryEn = json['current_category_en'];
    currentCategoryAr = json['current_category_ar'];
    currentCategoryKu = json['current_category_ku'];
    completedOrdersCount = json['completed_orders_count'];
    nextCategoryEn = json['next_category_en'];
    nextCategoryAr = json['next_category_ar'];
    nextCategoryKu = json['next_category_ku'];
    progressPercentage = json['progress_percentage'];
    ordersNeeded = json['orders_needed'];
    messageEn = json['message_en'];
    messageAr = json['message_ar'];
    messageKu = json['message_ku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_category_en'] = this.currentCategoryEn;
    data['current_category_ar'] = this.currentCategoryAr;
    data['current_category_ku'] = this.currentCategoryKu;
    data['completed_orders_count'] = this.completedOrdersCount;
    data['next_category_en'] = this.nextCategoryEn;
    data['next_category_ar'] = this.nextCategoryAr;
    data['next_category_ku'] = this.nextCategoryKu;
    data['progress_percentage'] = this.progressPercentage;
    data['orders_needed'] = this.ordersNeeded;
    data['message_en'] = this.messageEn;
    data['message_ar'] = this.messageAr;
    data['message_ku'] = this.messageKu;
    return data;
  }
}
