class FavoriteProductModel {
  List<FavoriteData>? data;
  List<Brands>? brands;
  bool? errors;

  FavoriteProductModel({this.data, this.brands, this.errors});

  FavoriteProductModel.fromJson(Map<String, dynamic>? json) {
    if (json?['data'] != null) {
      data = <FavoriteData>[];
      json?['data'].forEach((v) {
        data!.add(new FavoriteData.fromJson(v));
      });
    }
    if (json?['brands'] != null) {
      brands = <Brands>[];
      json?['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
    errors = json?['errors'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.data != null) {
      data?['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data?['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    data?['errors'] = this.errors;
    return data;
  }
}

class FavoriteData {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  List<FavoriteProduct>? products;
  var minPrice;
  var maxPrice;
  var imageUrl;
  List<String>? uniqueColors;
  List<String>? uniqueSizes;
  List<String>? uniqueWeights;
  List<String>? uniqueDimensions;

  FavoriteData({
    this.id,
    this.nameAr,
    this.nameEn,
    this.nameKu,
    this.products,
    this.minPrice,
    this.maxPrice,
    this.uniqueColors,
    this.uniqueSizes,
    this.uniqueWeights,
    this.uniqueDimensions,
    this.imageUrl,
  });

  FavoriteData.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    imageUrl = json?['image_url'];
    if (json?['products'] != null) {
      products = <FavoriteProduct>[];
      json?['products'].forEach((v) {
        products!.add(new FavoriteProduct.fromJson(v));
      });
    }
    minPrice = json?['min_price'];
    maxPrice = json?['max_price'];
    uniqueColors = json?['unique_colors'].cast<String>();
    uniqueSizes = json?['unique_sizes'].cast<String>();
    uniqueWeights = json?['unique_weights'].cast<String>();
    uniqueDimensions = json?['unique_dimensions'].cast<String>();
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    if (this.products != null) {
      data?['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data?['min_price'] = this.minPrice;
    data?['max_price'] = this.maxPrice;
    data?['unique_colors'] = this.uniqueColors;
    data?['unique_sizes'] = this.uniqueSizes;
    data?['unique_weights'] = this.uniqueWeights;
    data?['unique_dimensions'] = this.uniqueDimensions;
    data?['image_url'] = this.imageUrl;
    return data;
  }
}

class FavoriteProduct {
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
  var isOutOfStock;
  var createdAt;
  var finalPrice;
  var minAvailableQuantity;
  var currentQuantity;
  bool? displayProduct;

  FavoriteProduct(
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
      this.isOutOfStock,
      this.createdAt,
      this.finalPrice,
      this.minAvailableQuantity,
      this.currentQuantity,
      this.displayProduct});

  FavoriteProduct.fromJson(Map<String, dynamic>? json) {
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
    isOutOfStock = json?['is_out_of_stock'];
    createdAt = json?['created_at'];
    finalPrice = json?['final_price'];
    minAvailableQuantity = json?['min_available_quantity'];
    currentQuantity = json?['current_quantity'];
    displayProduct = json?['display_product'];
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
    data?['is_out_of_stock'] = this.isOutOfStock;
    data?['created_at'] = this.createdAt;
    data?['final_price'] = this.finalPrice;
    data?['min_available_quantity'] = this.minAvailableQuantity;
    data?['current_quantity'] = this.currentQuantity;
    data?['display_product'] = this.displayProduct;
    return data;
  }
}

class Brands {
  var id;
  var name;
  var logo;

  Brands({this.id, this.name, this.logo});

  Brands.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    logo = json?['logo'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['logo'] = this.logo;
    return data;
  }
}
