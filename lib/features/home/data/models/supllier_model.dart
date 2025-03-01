class SupllierModel {
  SupplierData? data;
  bool? errors;

  SupllierModel({this.data, this.errors});

  SupllierModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new SupplierData.fromJson(json?['data']) : null;
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

class SupplierData {
  List<Suppliers>? suppliers;

  SupplierData({this.suppliers});

  SupplierData.fromJson(Map<String, dynamic>? json) {
    if (json?['suppliers'] != null) {
      suppliers = <Suppliers>[];
      json?['suppliers'].forEach((v) {
        suppliers!.add(new Suppliers.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.suppliers != null) {
      data?['suppliers'] = this.suppliers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suppliers {
  int? id;
  String? name;
  Null? imageUrl;

  Suppliers({this.id, this.name, this.imageUrl});

  Suppliers.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    imageUrl = json?['image_url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['image_url'] = this.imageUrl;
    return data;
  }
}
