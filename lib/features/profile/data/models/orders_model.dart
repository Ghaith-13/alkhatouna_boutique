class MyOrdersModel {
  OrdersList? data;
  bool? errors;

  MyOrdersModel({this.data, this.errors});

  MyOrdersModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new OrdersList.fromJson(json?['data']) : null;
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

class OrdersList {
  List<Pending>? pending;
  List<Pending>? confirmed;
  List<Pending>? readyToShip;
  List<Pending>? onTheWay;
  List<Pending>? delivered;
  List<Pending>? completed;
  List<Pending>? cancelled;

  OrdersList(
      {this.pending,
      this.confirmed,
      this.readyToShip,
      this.onTheWay,
      this.delivered,
      this.completed,
      this.cancelled});

  OrdersList.fromJson(Map<String, dynamic>? json) {
    if (json?['pending'] != null) {
      pending = <Pending>[];
      json?['pending'].forEach((v) {
        pending!.add(new Pending.fromJson(v));
      });
    }
    if (json?['confirmed'] != null) {
      confirmed = <Pending>[];
      json?['confirmed'].forEach((v) {
        confirmed!.add(new Pending.fromJson(v));
      });
    }
    if (json?['ready_to_ship'] != null) {
      readyToShip = <Pending>[];
      json?['ready_to_ship'].forEach((v) {
        readyToShip!.add(new Pending.fromJson(v));
      });
    }
    if (json?['on_the_way'] != null) {
      onTheWay = <Pending>[];
      json?['on_the_way'].forEach((v) {
        onTheWay!.add(new Pending.fromJson(v));
      });
    }
    if (json?['delivered'] != null) {
      delivered = <Pending>[];
      json?['delivered'].forEach((v) {
        delivered!.add(new Pending.fromJson(v));
      });
    }
    if (json?['completed'] != null) {
      completed = <Pending>[];
      json?['completed'].forEach((v) {
        completed!.add(new Pending.fromJson(v));
      });
    }
    if (json?['cancelled'] != null) {
      cancelled = <Pending>[];
      json?['cancelled'].forEach((v) {
        cancelled!.add(new Pending.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.pending != null) {
      data?['pending'] = this.pending!.map((v) => v.toJson()).toList();
    }
    if (this.confirmed != null) {
      data?['confirmed'] = this.confirmed!.map((v) => v.toJson()).toList();
    }
    if (this.readyToShip != null) {
      data?['ready_to_ship'] =
          this.readyToShip!.map((v) => v.toJson()).toList();
    }
    if (this.onTheWay != null) {
      data?['on_the_way'] = this.onTheWay!.map((v) => v.toJson()).toList();
    }
    if (this.delivered != null) {
      data?['delivered'] = this.delivered!.map((v) => v.toJson()).toList();
    }
    if (this.completed != null) {
      data?['completed'] = this.completed!.map((v) => v.toJson()).toList();
    }
    if (this.cancelled != null) {
      data?['cancelled'] = this.cancelled!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pending {
  int? id;
  var number;
  var userId;
  var status;
  var totalAmount;
  var discountPercentage;
  var discountValue;
  var totalAmountAfterDiscount;
  var deliveryFees;
  var grandTotal;
  var notes;
  var isPaid;
  var paidAt;
  var countryName;
  var provinceName;
  var areaName;
  var subAreaName;
  var addressTitle;
  var addressPhone;
  var addressNotes;
  var addressId;
  var longtitude;
  var latitude;
  var currencyId;
  var exchangeRate;
  var paymentMethod;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  List<Items>? items;

  Pending(
      {this.id,
      this.number,
      this.userId,
      this.status,
      this.totalAmount,
      this.discountPercentage,
      this.discountValue,
      this.totalAmountAfterDiscount,
      this.deliveryFees,
      this.grandTotal,
      this.notes,
      this.isPaid,
      this.paidAt,
      this.countryName,
      this.provinceName,
      this.areaName,
      this.subAreaName,
      this.addressTitle,
      this.addressPhone,
      this.addressNotes,
      this.addressId,
      this.longtitude,
      this.latitude,
      this.currencyId,
      this.exchangeRate,
      this.paymentMethod,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.items});

  Pending.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    number = json?['number'];
    userId = json?['user_id'];
    status = json?['status'];
    totalAmount = json?['total_amount'];
    discountPercentage = json?['discount_percentage'];
    discountValue = json?['discount_value'];
    totalAmountAfterDiscount = json?['total_amount_after_discount'];
    deliveryFees = json?['delivery_fees'];
    grandTotal = json?['grand_total'];
    notes = json?['notes'];
    isPaid = json?['is_paid'];
    paidAt = json?['paid_at'];
    countryName = json?['country_name'];
    provinceName = json?['province_name'];
    areaName = json?['area_name'];
    subAreaName = json?['sub_area_name'];
    addressTitle = json?['address_title'];
    addressPhone = json?['address_phone'];
    addressNotes = json?['address_notes'];
    addressId = json?['address_id'];
    longtitude = json?['longtitude'];
    latitude = json?['latitude'];
    currencyId = json?['currency_id'];
    exchangeRate = json?['exchange_rate'];
    paymentMethod = json?['payment_method'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    if (json?['items'] != null) {
      items = <Items>[];
      json?['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['number'] = this.number;
    data?['user_id'] = this.userId;
    data?['status'] = this.status;
    data?['total_amount'] = this.totalAmount;
    data?['discount_percentage'] = this.discountPercentage;
    data?['discount_value'] = this.discountValue;
    data?['total_amount_after_discount'] = this.totalAmountAfterDiscount;
    data?['delivery_fees'] = this.deliveryFees;
    data?['grand_total'] = this.grandTotal;
    data?['notes'] = this.notes;
    data?['is_paid'] = this.isPaid;
    data?['paid_at'] = this.paidAt;
    data?['country_name'] = this.countryName;
    data?['province_name'] = this.provinceName;
    data?['area_name'] = this.areaName;
    data?['sub_area_name'] = this.subAreaName;
    data?['address_title'] = this.addressTitle;
    data?['address_phone'] = this.addressPhone;
    data?['address_notes'] = this.addressNotes;
    data?['address_id'] = this.addressId;
    data?['longtitude'] = this.longtitude;
    data?['latitude'] = this.latitude;
    data?['currency_id'] = this.currencyId;
    data?['exchange_rate'] = this.exchangeRate;
    data?['payment_method'] = this.paymentMethod;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    if (this.items != null) {
      data?['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  var orderId;
  var productId;
  var productQuantity;
  var productColor;
  var productSize;
  var productPrice;
  var productTotalAmount;
  var productDiscountPercentage;
  var productDiscountValue;
  var productTotalAmountAfterDiscount;
  var productNotes;
  var createdAt;
  var updatedAt;
  var imageUrl;
  Product? product;

  Items(
      {this.id,
      this.orderId,
      this.productId,
      this.productQuantity,
      this.productColor,
      this.productSize,
      this.productPrice,
      this.productTotalAmount,
      this.productDiscountPercentage,
      this.productDiscountValue,
      this.productTotalAmountAfterDiscount,
      this.productNotes,
      this.createdAt,
      this.updatedAt,
      this.imageUrl,
      this.product});

  Items.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    orderId = json?['order_id'];
    productId = json?['product_id'];
    productQuantity = json?['product_quantity'];
    productColor = json?['product_color'];
    productSize = json?['product_size'];
    productPrice = json?['product_price'];
    productTotalAmount = json?['product_total_amount'];
    productDiscountPercentage = json?['product_discount_percentage'];
    productDiscountValue = json?['product_discount_value'];
    productTotalAmountAfterDiscount =
        json?['product_total_amount_after_discount'];
    productNotes = json?['product_notes'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    imageUrl = json?['image_url'];
    product = json?['product'] != null
        ? new Product.fromJson(json?['product'])
        : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['order_id'] = this.orderId;
    data?['product_id'] = this.productId;
    data?['product_quantity'] = this.productQuantity;
    data?['product_color'] = this.productColor;
    data?['product_size'] = this.productSize;
    data?['product_price'] = this.productPrice;
    data?['product_total_amount'] = this.productTotalAmount;
    data?['product_discount_percentage'] = this.productDiscountPercentage;
    data?['product_discount_value'] = this.productDiscountValue;
    data?['product_total_amount_after_discount'] =
        this.productTotalAmountAfterDiscount;
    data?['product_notes'] = this.productNotes;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['image_url'] = this.imageUrl;
    if (this.product != null) {
      data?['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
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
  List<Attachments>? attachments;

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
      this.isFeaturedBadge,
      this.attachments});

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
    if (json?['attachments'] != null) {
      attachments = <Attachments>[];
      json?['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
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
    data?['is_visible_badge'] = this.isVisibleBadge;
    data?['is_out_of_stock_badge'] = this.isOutOfStockBadge;
    data?['is_featured_badge'] = this.isFeaturedBadge;
    if (this.attachments != null) {
      data?['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  int? id;
  var productId;
  var type;
  var attachment;
  var createdAt;
  var updatedAt;

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
