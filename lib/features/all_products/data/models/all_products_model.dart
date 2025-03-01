class AllProductsModel {
  List<AllProductsProduct>? data;
  Pagination? pagination;
  bool? errors;

  AllProductsModel({this.data, this.pagination, this.errors});

  AllProductsModel.fromJson(Map<String, dynamic>? json) {
    if (json?['data'] != null) {
      data = <AllProductsProduct>[];
      json?['data'].forEach((v) {
        data!.add(new AllProductsProduct.fromJson(v));
      });
    }
    pagination = json?['pagination'] != null
        ? new Pagination.fromJson(json?['pagination'])
        : null;
    errors = json?['errors'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.data != null) {
      data?['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data?['pagination'] = this.pagination!.toJson();
    }
    data?['errors'] = this.errors;
    return data;
  }
}

class AllProductsProduct {
  int? id;
  var nameAr;
  var nameEn;
  var nameKu;
  var price;
  bool? isDiscount;
  var discount;
  var priceAfterDiscount;
  int? reviewCount;
  int? reviewAvg;
  var imageUrl;
  var isFeatured;
  var createdAt;
  var finalPrice;
  var minAvailableQuantity;
  var currentQuantity;
  var isOutOfStock;
  var points;
  bool? displayProduct;
  var brandName;
  bool? is_favorite;

  AllProductsProduct({
    this.id,
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
    this.points,
    this.isFeatured,
    this.createdAt,
    this.finalPrice,
    this.minAvailableQuantity,
    this.currentQuantity,
    this.isOutOfStock,
    this.displayProduct,
    this.brandName,
    this.is_favorite,
  });

  AllProductsProduct.fromJson(Map<String, dynamic>? json) {
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
    points = json?['points'];
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
    data?['points'] = this.points;
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

class Pagination {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? from;
  int? to;

  Pagination(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.from,
      this.to});

  Pagination.fromJson(Map<String, dynamic>? json) {
    total = json?['total'];
    perPage = json?['per_page'];
    currentPage = json?['current_page'];
    lastPage = json?['last_page'];
    from = json?['from'];
    to = json?['to'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['total'] = this.total;
    data?['per_page'] = this.perPage;
    data?['current_page'] = this.currentPage;
    data?['last_page'] = this.lastPage;
    data?['from'] = this.from;
    data?['to'] = this.to;
    return data;
  }
}
