class AddToCartModel {
  Data? data;
  bool? errors;

  AddToCartModel({this.data, this.errors});

  AddToCartModel.fromJson(Map<String, dynamic>? json) {
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
  Cart? cart;
  String? message;

  Data({this.cart, this.message});

  Data.fromJson(Map<String, dynamic>? json) {
    cart = json?['cart'] != null ? new Cart.fromJson(json?['cart']) : null;
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.cart != null) {
      data?['cart'] = this.cart!.toJson();
    }
    data?['message'] = this.message;
    return data;
  }
}

class Cart {
  String? productId;
  String? hexColor;
  String? size;
  String? quantity;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Cart(
      {this.productId,
      this.hexColor,
      this.size,
      this.quantity,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Cart.fromJson(Map<String, dynamic>? json) {
    productId = json?['product_id'];
    hexColor = json?['hex_color'];
    size = json?['size'];
    quantity = json?['quantity'];
    userId = json?['user_id'];
    updatedAt = json?['updated_at'];
    createdAt = json?['created_at'];
    id = json?['id'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['product_id'] = this.productId;
    data?['hex_color'] = this.hexColor;
    data?['size'] = this.size;
    data?['quantity'] = this.quantity;
    data?['user_id'] = this.userId;
    data?['updated_at'] = this.updatedAt;
    data?['created_at'] = this.createdAt;
    data?['id'] = this.id;
    return data;
  }
}
