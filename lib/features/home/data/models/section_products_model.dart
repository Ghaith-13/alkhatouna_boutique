class SectionProductsModel {
  Data? data;
  bool? errors;

  SectionProductsModel({this.data, this.errors});

  SectionProductsModel.fromJson(Map<String, dynamic>? json) {
    data = json?['data'] != null ? new Data.fromJson(json?['data']) : null;
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

class Data {
  SectionInfo? sectionInfo;
  List<SectionBanners>? sectionBanners;
  List<ProductsSection>? products;

  Data({this.sectionInfo, this.sectionBanners, this.products});

  Data.fromJson(Map<String, dynamic>? json) {
    sectionInfo = json?['section_info'] != null
        ? new SectionInfo.fromJson(json?['section_info'])
        : null;
    if (json?['section_banners'] != null) {
      sectionBanners = <SectionBanners>[];
      json?['section_banners'].forEach((v) {
        sectionBanners!.add(new SectionBanners.fromJson(v));
      });
    }
    if (json?['products'] != null) {
      products = <ProductsSection>[];
      json?['products'].forEach((v) {
        products!.add(new ProductsSection.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.sectionInfo != null) {
      data?['section_info'] = this.sectionInfo!.toJson();
    }
    if (this.sectionBanners != null) {
      data?['section_banners'] =
          this.sectionBanners!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data?['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SectionInfo {
  var id;
  String? nameAr;
  String? nameEn;
  String? type;
  String? descriptionAr;
  String? descriptionEn;
  String? imageUrl;

  SectionInfo(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.type,
      this.descriptionAr,
      this.descriptionEn,
      this.imageUrl});

  SectionInfo.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    type = json?['type'];
    descriptionAr = json?['description_ar'];
    descriptionEn = json?['description_en'];
    imageUrl = json?['image_url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['type'] = this.type;
    data?['description_ar'] = this.descriptionAr;
    data?['description_en'] = this.descriptionEn;
    data?['image_url'] = this.imageUrl;
    return data;
  }
}

class SectionBanners {
  var id;
  String? imageUrl;

  SectionBanners({this.id, this.imageUrl});

  SectionBanners.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    imageUrl = json?['image_url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['image_url'] = this.imageUrl;
    return data;
  }
}

class ProductsSection {
  var id;
  String? nameAr;
  String? nameEn;
  var nameKu;
  var price;
  var points;
  bool? isDiscount;
  var discount;
  var priceAfterDiscount;
  var reviewCount;
  var reviewAvg;
  String? imageUrl;
  var isFeatured;
  bool? isFavorite;
  String? createdAt;
  var finalPrice;
  var minAvailableQuantity;
  var currentQuantity;
  var isOutOfStock;
  bool? displayProduct;
  bool? is_favorite;
  String? brandName;

  ProductsSection(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.points,
      this.price,
      this.isDiscount,
      this.discount,
      this.priceAfterDiscount,
      this.reviewCount,
      this.reviewAvg,
      this.imageUrl,
      this.isFeatured,
      this.isFavorite,
      this.createdAt,
      this.finalPrice,
      this.minAvailableQuantity,
      this.currentQuantity,
      this.is_favorite,
      this.isOutOfStock,
      this.displayProduct,
      this.brandName});

  ProductsSection.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    price = json?['price'];
    points = json?['points'];
    isDiscount = json?['is_discount'];
    discount = json?['discount'];
    priceAfterDiscount = json?['price_after_discount'];
    reviewCount = json?['review_count'];
    reviewAvg = json?['review_avg'];
    imageUrl = json?['image_url'];
    isFeatured = json?['is_featured'];
    isFavorite = json?['is_favorite'];
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
    data?['points'] = this.points;
    data?['is_discount'] = this.isDiscount;
    data?['discount'] = this.discount;
    data?['price_after_discount'] = this.priceAfterDiscount;
    data?['review_count'] = this.reviewCount;
    data?['review_avg'] = this.reviewAvg;
    data?['image_url'] = this.imageUrl;
    data?['is_featured'] = this.isFeatured;
    data?['is_favorite'] = this.isFavorite;
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
