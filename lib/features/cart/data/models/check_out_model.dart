class CheckOutModel {
  CheckOutData? data;
  bool? errors;

  CheckOutModel({this.data, this.errors});

  CheckOutModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new CheckOutData.fromJson(json?['data']) : null;
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

class CheckOutData {
  DefaultAddress? defaultAddress;
  bool? isEmployee;
  List<Provinces>? provinces;

  var paymentMethod;
  var delivryFees;
  List<Carts>? carts;
  var totalAmount;
  var productsDiscountValue;
  var discountPercentage;
  var point_discount_value;
  var totalAmountAfterDiscount;
  var grandTotal;
  PromoCode? promoCode;
  var orderConfirmationMessage;
  var pre_order_message;
  var total_points;
  var paid_points;
  var total_tax;
  var point_amount;
  bool? can_pay_with_points;
  List<AvailableBenefits>? availableBenefits;
  AppliedBenefit? appliedBenefit;

  CheckOutData({
    this.isEmployee,
    this.defaultAddress,
    this.paymentMethod,
    this.delivryFees,
    this.point_discount_value,
    this.carts,
    this.pre_order_message,
    this.totalAmount,
    this.provinces,
    this.productsDiscountValue,
    this.point_amount,
    this.discountPercentage,
    this.totalAmountAfterDiscount,
    this.appliedBenefit,
    this.grandTotal,
    this.promoCode,
    this.availableBenefits,
    this.orderConfirmationMessage,
    this.can_pay_with_points,
    this.total_points,
    this.paid_points,
    this.total_tax,
  });

  CheckOutData.fromJson(Map<String, dynamic>? json) {
    isEmployee = json?['is_employee'];
    point_discount_value = json?['point_discount_value'];
    if (json?['provinces'] != null) {
      provinces = <Provinces>[];
      json?['provinces'].forEach((v) {
        provinces!.add(new Provinces.fromJson(v));
      });
    }
    defaultAddress = json?['default_address'] != null
        ? new DefaultAddress.fromJson(json?['default_address'])
        : null;
    paymentMethod = json?['payment_method'];
    point_amount = json?['point_amount'];
    pre_order_message = json?['pre_order_message'];
    orderConfirmationMessage = json?['order_confirmation_message'];
    delivryFees = json?['delivery_fees'];
    total_points = json?['total_points'];
    if (json?['carts'] != null) {
      carts = <Carts>[];
      json?['carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
    totalAmount = json?['total_amount'];
    appliedBenefit = json?['applied_benefit'] != null
        ? new AppliedBenefit.fromJson(json?['applied_benefit'])
        : null;
    productsDiscountValue = json?['products_discount_value'];
    discountPercentage = json?['discount_percentage'];
    paid_points = json?['paid_points'];
    if (json?['available_benefits'] != null) {
      availableBenefits = <AvailableBenefits>[];
      json?['available_benefits'].forEach((v) {
        availableBenefits!.add(new AvailableBenefits.fromJson(v));
      });
    }
    totalAmountAfterDiscount = json?['total_amount_after_discount'];
    grandTotal = json?['grand_total'];
    can_pay_with_points = json?['can_pay_with_points'];
    total_tax = json?['total_tax'];
    promoCode = json?['promo_code'] != null
        ? new PromoCode.fromJson(json?['promo_code'])
        : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.defaultAddress != null) {
      data?['default_address'] = this.defaultAddress!.toJson();
    }
    data?['is_employee'] = this.isEmployee;
    data?['point_discount_value'] = this.point_discount_value;
    data?['pre_order_message'] = this.pre_order_message;
    data?['point_amount'] = this.point_amount;
    if (this.provinces != null) {
      data?['provinces'] = this.provinces!.map((v) => v.toJson()).toList();
    }
    data?['payment_method'] = this.paymentMethod;
    data?['delivery_fees'] = this.delivryFees;
    data?['order_confirmation_message'] = this.orderConfirmationMessage;
    if (this.carts != null) {
      data?['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    data?['total_amount'] = this.totalAmount;
    if (this.appliedBenefit != null) {
      data?['applied_benefit'] = this.appliedBenefit!.toJson();
    }
    data?['paid_points'] = this.paid_points;
    data?['products_discount_value'] = this.productsDiscountValue;
    data?['discount_percentage'] = this.discountPercentage;
    data?['total_tax'] = this.total_tax;
    data?['total_amount_after_discount'] = this.totalAmountAfterDiscount;
    data?['grand_total'] = this.grandTotal;
    if (this.availableBenefits != null) {
      data?['available_benefits'] =
          this.availableBenefits!.map((v) => v.toJson()).toList();
    }
    data?['can_pay_with_points'] = this.can_pay_with_points;
    data?['total_points'] = this.total_points;
    if (this.promoCode != null) {
      data?['promo_code'] = this.promoCode!.toJson();
    }
    return data;
  }
}

class Provinces {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;

  Provinces({this.id, this.nameAr, this.nameEn, this.nameKu});

  Provinces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nameKu = json['name_ku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['name_ku'] = this.nameKu;
    return data;
  }
}

class DefaultAddress {
  var id;
  var userId;
  var title;
  var phone;
  var countryId;
  var provinceId;
  var areaId;
  var subAreaId;
  var longitude;
  var latitude;
  var notes;
  var isDefault;
  var createdAt;
  var updatedAt;
  var is_phone_verified;
  Country? country;
  Province? province;
  Province? area;
  Province? subArea;

  DefaultAddress(
      {this.id,
      this.userId,
      this.title,
      this.phone,
      this.countryId,
      this.provinceId,
      this.areaId,
      this.subAreaId,
      this.longitude,
      this.is_phone_verified,
      this.latitude,
      this.notes,
      this.isDefault,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.province,
      this.area,
      this.subArea});

  DefaultAddress.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
    title = json?['title'];
    phone = json?['phone'];
    countryId = json?['country_id'];
    provinceId = json?['province_id'];
    areaId = json?['area_id'];
    subAreaId = json?['sub_area_id'];
    longitude = json?['longitude'];
    is_phone_verified = json?['is_phone_verified'];
    latitude = json?['latitude'];
    notes = json?['notes'];
    isDefault = json?['is_default'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    country = json?['country'] != null
        ? new Country.fromJson(json?['country'])
        : null;
    province = json?['province'] != null
        ? new Province.fromJson(json?['province'])
        : null;
    area = json?['area'] != null ? new Province.fromJson(json?['area']) : null;
    subArea = json?['sub_area'] != null
        ? new Province.fromJson(json?['sub_area'])
        : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['user_id'] = this.userId;
    data?['title'] = this.title;
    data?['is_phone_verified'] = this.is_phone_verified;
    data?['phone'] = this.phone;
    data?['country_id'] = this.countryId;
    data?['province_id'] = this.provinceId;
    data?['area_id'] = this.areaId;
    data?['sub_area_id'] = this.subAreaId;
    data?['longitude'] = this.longitude;
    data?['latitude'] = this.latitude;
    data?['notes'] = this.notes;
    data?['is_default'] = this.isDefault;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    if (this.country != null) {
      data?['country'] = this.country!.toJson();
    }
    if (this.province != null) {
      data?['province'] = this.province!.toJson();
    }
    if (this.area != null) {
      data?['area'] = this.area!.toJson();
    }
    if (this.subArea != null) {
      data?['sub_area'] = this.subArea!.toJson();
    }
    return data;
  }
}

class Country {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  var type;
  var parentId;
  var deliveryFees;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;

  Country(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.type,
      this.parentId,
      this.deliveryFees,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  Country.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    type = json?['type'];
    parentId = json?['parent_id'];
    deliveryFees = json?['delivery_fees'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['type'] = this.type;
    data?['parent_id'] = this.parentId;
    data?['delivery_fees'] = this.deliveryFees;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}

class Province {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  var type;
  var parentId;
  var deliveryFees;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;

  Province(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.type,
      this.parentId,
      this.deliveryFees,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  Province.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    type = json?['type'];
    parentId = json?['parent_id'];
    deliveryFees = json?['delivery_fees'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['type'] = this.type;
    data?['parent_id'] = this.parentId;
    data?['delivery_fees'] = this.deliveryFees;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}

class Carts {
  var id;
  var userId;
  var productId;
  var hexColor;
  var size;
  var quantity;
  var createdAt;
  var updatedAt;
  Product? product;

  Carts(
      {this.id,
      this.userId,
      this.productId,
      this.hexColor,
      this.size,
      this.quantity,
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
    if (this.product != null) {
      data?['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  var paragraphAr;
  var paragraphEn;
  var paragraphKu;
  var descriptionAr;
  var descriptionEn;
  var descriptionKu;
  var isVisible;
  var isOutOfStock;
  var currentQuantity;
  var minAvailableQuantity;
  var price;
  var finalPrice;
  var points;
  var isFeatured;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var brandId;
  var discount;
  var isVisibleBadge;
  var isOutOfStockBadge;
  var isFeaturedBadge;

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
      this.isVisibleBadge,
      this.isOutOfStockBadge,
      this.isFeaturedBadge});

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
    isVisibleBadge = json?['is_visible_badge'];
    isOutOfStockBadge = json?['is_out_of_stock_badge'];
    isFeaturedBadge = json?['is_featured_badge'];
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
    data?['is_visible_badge'] = this.isVisibleBadge;
    data?['is_out_of_stock_badge'] = this.isOutOfStockBadge;
    data?['is_featured_badge'] = this.isFeaturedBadge;
    return data;
  }
}

class PromoCode {
  var id;
  var code;
  var userId;
  var bloggerCommissionPercentage;
  var discountPercentage;
  var expiryAt;
  var type;
  var usageCount;
  var createdAt;
  var updatedAt;

  PromoCode(
      {this.id,
      this.code,
      this.userId,
      this.bloggerCommissionPercentage,
      this.discountPercentage,
      this.expiryAt,
      this.type,
      this.usageCount,
      this.createdAt,
      this.updatedAt});

  PromoCode.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    code = json?['code'];
    userId = json?['user_id'];
    bloggerCommissionPercentage = json?['blogger_commission_percentage'];
    discountPercentage = json?['discount_percentage'];
    expiryAt = json?['expiry_at'];
    type = json?['type'];
    usageCount = json?['usage_count'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['code'] = this.code;
    data?['user_id'] = this.userId;
    data?['blogger_commission_percentage'] = this.bloggerCommissionPercentage;
    data?['discount_percentage'] = this.discountPercentage;
    data?['expiry_at'] = this.expiryAt;
    data?['type'] = this.type;
    data?['usage_count'] = this.usageCount;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}

class AvailableBenefits {
  int? id;
  var userId;
  var userCategoryId;
  var benefitId;
  var startDate;
  var endDate;
  var usedCount;
  var status;
  var createdAt;
  var updatedAt;
  Benefit? benefit;

  AvailableBenefits(
      {this.id,
      this.userId,
      this.userCategoryId,
      this.benefitId,
      this.startDate,
      this.endDate,
      this.usedCount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.benefit});

  AvailableBenefits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userCategoryId = json['user_category_id'];
    benefitId = json['benefit_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    usedCount = json['used_count'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    benefit =
        json['benefit'] != null ? new Benefit.fromJson(json['benefit']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_category_id'] = this.userCategoryId;
    data['benefit_id'] = this.benefitId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['used_count'] = this.usedCount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.benefit != null) {
      data['benefit'] = this.benefit!.toJson();
    }
    return data;
  }
}

class Benefit {
  int? id;
  var userCategoryId;
  var benefitType;
  var value;
  var durationDays;
  var limit;
  var status;
  var createdAt;
  var updatedAt;

  Benefit(
      {this.id,
      this.userCategoryId,
      this.benefitType,
      this.value,
      this.durationDays,
      this.limit,
      this.status,
      this.createdAt,
      this.updatedAt});

  Benefit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCategoryId = json['user_category_id'];
    benefitType = json['benefit_type'];
    value = json['value'];
    durationDays = json['duration_days'];
    limit = json['limit'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_category_id'] = this.userCategoryId;
    data['benefit_type'] = this.benefitType;
    data['value'] = this.value;
    data['duration_days'] = this.durationDays;
    data['limit'] = this.limit;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AppliedBenefit {
  int? id;
  var type;
  var description_en;
  var description_ar;
  var description_ku;

  AppliedBenefit(
      {this.id,
      this.type,
      this.description_en,
      this.description_ar,
      this.description_ku});

  AppliedBenefit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description_en = json['description_en'];
    description_ar = json['description_ar'];
    description_ku = json['description_ku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['description_en'] = this.description_en;
    data['description_ar'] = this.description_ar;
    data['description_ku'] = this.description_ku;
    return data;
  }
}
