class FullSearchModel {
  SearchData? data;
  bool? errors;

  FullSearchModel({this.data, this.errors});

  FullSearchModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new SearchData.fromJson(json?['data']) : null;
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

class SearchData {
  List<BrandsChildren>? brands;
  List<Categories>? categories;
  List<Products>? products;

  SearchData({this.brands, this.categories, this.products});

  SearchData.fromJson(Map<String, dynamic>? json) {
    if (json?['brands'] != null) {
      brands = <BrandsChildren>[];
      json?['brands'].forEach((v) {
        brands!.add(new BrandsChildren.fromJson(v));
      });
    }
    if (json?['categories'] != null) {
      categories = <Categories>[];
      json?['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json?['products'] != null) {
      products = <Products>[];
      json?['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.brands != null) {
      data?['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data?['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data?['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrandsChildren {
  var id;
  var name;
  var logoUrl;
  List<childreCategories>? categories;

  BrandsChildren({this.id, this.name, this.logoUrl, this.categories});

  BrandsChildren.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    logoUrl = json?['logo_url'];
    if (json?['categories'] != null) {
      categories = <childreCategories>[];
      json?['categories'].forEach((v) {
        categories!.add(new childreCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['logo_url'] = this.logoUrl;
    if (this.categories != null) {
      data?['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class childreCategories {
  var id;
  var parentId;
  var nameAr;
  var nameEn;
  var nameKu;

  childreCategories(
      {this.id, this.parentId, this.nameAr, this.nameEn, this.nameKu});

  childreCategories.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    parentId = json?['parent_id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['parent_id'] = this.parentId;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
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

class Products {
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
  var points;
  bool? isFavorite;
  var createdAt;
  var finalPrice;
  var minAvailableQuantity;
  var currentQuantity;
  var isOutOfStock;
  bool? displayProduct;
  var brandName;

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
      this.points,
      this.reviewAvg,
      this.imageUrl,
      this.isFeatured,
      this.isFavorite,
      this.createdAt,
      this.finalPrice,
      this.minAvailableQuantity,
      this.currentQuantity,
      this.isOutOfStock,
      this.displayProduct,
      this.brandName});

  Products.fromJson(Map<String, dynamic>? json) {
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
    return data;
  }
}
