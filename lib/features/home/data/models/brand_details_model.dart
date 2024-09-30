class BrandDetailsModel {
  OneBrandDetails? data;
  bool? errors;

  BrandDetailsModel({this.data, this.errors});

  BrandDetailsModel.fromJson(Map<String, dynamic>? json) {
    data = json?['data'] != null
        ? new OneBrandDetails.fromJson(json?['data'])
        : null;
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

class OneBrandDetails {
  List<Products>? products;
  Brand? brand;

  OneBrandDetails({this.products, this.brand});

  OneBrandDetails.fromJson(Map<String, dynamic>? json) {
    if (json?['products'] != null) {
      products = <Products>[];
      json?['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    brand = json?['brand'] != null ? new Brand.fromJson(json?['brand']) : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.products != null) {
      data?['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data?['brand'] = this.brand!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  String? nameAr;
  String? nameEn;
  var nameKu;
  String? price;
  bool? isDiscount;
  String? discount;
  String? priceAfterDiscount;
  int? reviewCount;
  int? reviewAvg;
  String? imageUrl;
  String? isFeatured;
  String? createdAt;
  String? finalPrice;
  String? minAvailableQuantity;
  String? currentQuantity;
  String? isOutOfStock;
  bool? displayProduct;

  Products(
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
      this.displayProduct});

  Products.fromJson(Map<String, dynamic>? json) {
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
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? logo;

  Brand({this.id, this.name, this.logo});

  Brand.fromJson(Map<String, dynamic>? json) {
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
