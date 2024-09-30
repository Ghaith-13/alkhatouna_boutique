class GetCartModel {
  CartData? data;
  bool? errors;

  GetCartModel({this.data, this.errors});

  GetCartModel.fromJson(Map<String, dynamic>? json) {
    data = json?['data'] != null ? new CartData.fromJson(json?['data']) : null;
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

class CartData {
  List<Carts>? carts;

  CartData({this.carts});

  CartData.fromJson(Map<String, dynamic>? json) {
    if (json?['carts'] != null) {
      carts = <Carts>[];
      json?['carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.carts != null) {
      data?['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Carts {
  int? id;
  String? userId;
  String? productId;
  String? hexColor;
  String? size;
  String? weight;
  String? dimension;
  String? quantity;
  String? createdAt;
  String? updatedAt;
  Product? product;

  Carts(
      {this.id,
      this.userId,
      this.productId,
      this.hexColor,
      this.size,
      this.quantity,
      this.weight,
      this.dimension,
      this.createdAt,
      this.updatedAt,
      this.product});

  Carts.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
    productId = json?['product_id'];
    hexColor = json?['hex_color'];
    size = json?['size'];
    quantity = json?['quantity'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    weight = json?['weight'];
    dimension = json?['dimension'];
    product = json?['product'] != null
        ? new Product.fromJson(json?['product'])
        : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['user_id'] = this.userId;
    data?['product_id'] = this.productId;
    data?['hex_color'] = this.hexColor;
    data?['size'] = this.size;
    data?['quantity'] = this.quantity;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['dimension'] = this.dimension;
    data?['weight'] = this.weight;
    if (this.product != null) {
      data?['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? nameAr;
  String? nameEn;
  String? nameKu;
  String? paragraphAr;
  String? paragraphEn;
  String? paragraphKu;
  String? descriptionAr;
  String? descriptionEn;
  String? descriptionKu;
  String? isVisible;
  String? isOutOfStock;
  String? currentQuantity;
  String? minAvailableQuantity;
  String? price;
  String? finalPrice;
  String? points;
  String? isFeatured;
  var createdBy;
  var updatedBy;
  String? createdAt;
  String? updatedAt;
  String? brandId;
  String? discount;
  int? reviewCount;
  var reviewAvg;
  bool? isFavorite;
  bool? isDiscount;
  String? imageUrl;
  var priceAfterDiscount;
  String? isVisibleBadge;
  String? isOutOfStockBadge;
  String? isFeaturedBadge;
  List<Attachments>? attachments;
  List<Reviews>? reviews;

  Product(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.paragraphAr,
      this.paragraphEn,
      this.paragraphKu,
      this.descriptionAr,
      this.descriptionEn,
      this.descriptionKu,
      this.isVisible,
      this.isOutOfStock,
      this.currentQuantity,
      this.minAvailableQuantity,
      this.price,
      this.finalPrice,
      this.points,
      this.isFeatured,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.brandId,
      this.discount,
      this.reviewCount,
      this.reviewAvg,
      this.isFavorite,
      this.isDiscount,
      this.imageUrl,
      this.priceAfterDiscount,
      this.isVisibleBadge,
      this.isOutOfStockBadge,
      this.isFeaturedBadge,
      this.attachments,
      this.reviews});

  Product.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    paragraphAr = json?['paragraph_ar'];
    paragraphEn = json?['paragraph_en'];
    paragraphKu = json?['paragraph_ku'];
    descriptionAr = json?['description_ar'];
    descriptionEn = json?['description_en'];
    descriptionKu = json?['description_ku'];
    isVisible = json?['is_visible'];
    isOutOfStock = json?['is_out_of_stock'];
    currentQuantity = json?['current_quantity'];
    minAvailableQuantity = json?['min_available_quantity'];
    price = json?['price'];
    finalPrice = json?['final_price'];
    points = json?['points'];
    isFeatured = json?['is_featured'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    brandId = json?['brand_id'];
    discount = json?['discount'];
    reviewCount = json?['review_count'];
    reviewAvg = json?['review_avg'];
    isFavorite = json?['is_favorite'];
    isDiscount = json?['is_discount'];
    imageUrl = json?['image_url'];
    priceAfterDiscount = json?['price_after_discount'];
    isVisibleBadge = json?['is_visible_badge'];
    isOutOfStockBadge = json?['is_out_of_stock_badge'];
    isFeaturedBadge = json?['is_featured_badge'];
    if (json?['attachments'] != null) {
      attachments = <Attachments>[];
      json?['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    if (json?['reviews'] != null) {
      reviews = <Reviews>[];
      json?['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['paragraph_ar'] = this.paragraphAr;
    data?['paragraph_en'] = this.paragraphEn;
    data?['paragraph_ku'] = this.paragraphKu;
    data?['description_ar'] = this.descriptionAr;
    data?['description_en'] = this.descriptionEn;
    data?['description_ku'] = this.descriptionKu;
    data?['is_visible'] = this.isVisible;
    data?['is_out_of_stock'] = this.isOutOfStock;
    data?['current_quantity'] = this.currentQuantity;
    data?['min_available_quantity'] = this.minAvailableQuantity;
    data?['price'] = this.price;
    data?['final_price'] = this.finalPrice;
    data?['points'] = this.points;
    data?['is_featured'] = this.isFeatured;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['brand_id'] = this.brandId;
    data?['discount'] = this.discount;
    data?['review_count'] = this.reviewCount;
    data?['review_avg'] = this.reviewAvg;
    data?['is_favorite'] = this.isFavorite;
    data?['is_discount'] = this.isDiscount;
    data?['image_url'] = this.imageUrl;
    data?['price_after_discount'] = this.priceAfterDiscount;
    data?['is_visible_badge'] = this.isVisibleBadge;
    data?['is_out_of_stock_badge'] = this.isOutOfStockBadge;
    data?['is_featured_badge'] = this.isFeaturedBadge;
    if (this.attachments != null) {
      data?['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data?['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  int? id;
  String? productId;
  String? type;
  String? attachment;
  String? createdAt;
  String? updatedAt;

  Attachments(
      {this.id,
      this.productId,
      this.type,
      this.attachment,
      this.createdAt,
      this.updatedAt});

  Attachments.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    productId = json?['product_id'];
    type = json?['type'];
    attachment = json?['attachment'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['product_id'] = this.productId;
    data?['type'] = this.type;
    data?['attachment'] = this.attachment;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}

class Reviews {
  int? id;
  String? productId;
  String? userId;
  String? review;
  String? rate;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.id,
      this.productId,
      this.userId,
      this.review,
      this.rate,
      this.createdAt,
      this.updatedAt});

  Reviews.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    productId = json?['product_id'];
    userId = json?['user_id'];
    review = json?['review'];
    rate = json?['rate'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['product_id'] = this.productId;
    data?['user_id'] = this.userId;
    data?['review'] = this.review;
    data?['rate'] = this.rate;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}
