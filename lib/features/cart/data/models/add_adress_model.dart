class AddAdressModel {
  Data? data;
  bool? errors;

  AddAdressModel({this.data, this.errors});

  AddAdressModel.fromJson(Map<String, dynamic>? json) {
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
  Address? address;
  String? message;

  Data({this.address, this.message});

  Data.fromJson(Map<String, dynamic>? json) {
    address = json?['address'] != null
        ? new Address.fromJson(json?['address'])
        : null;
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.address != null) {
      data?['address'] = this.address!.toJson();
    }
    data?['message'] = this.message;
    return data;
  }
}

class Address {
  String? title;
  String? phone;
  String? countryId;
  String? provinceId;
  var areaId;
  var subAreaId;
  String? longitude;
  String? latitude;
  String? notes;
  String? isDefault;
  var userId;
  String? updatedAt;
  String? createdAt;
  var id;

  Address(
      {this.title,
      this.phone,
      this.countryId,
      this.provinceId,
      this.areaId,
      this.subAreaId,
      this.longitude,
      this.latitude,
      this.notes,
      this.isDefault,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Address.fromJson(Map<String, dynamic>? json) {
    title = json?['title'];
    phone = json?['phone'];
    countryId = json?['country_id'];
    provinceId = json?['province_id'];
    areaId = json?['area_id'];
    subAreaId = json?['sub_area_id'];
    longitude = json?['longitude'];
    latitude = json?['latitude'];
    notes = json?['notes'];
    isDefault = json?['is_default'];
    userId = json?['user_id'];
    updatedAt = json?['updated_at'];
    createdAt = json?['created_at'];
    id = json?['id'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['title'] = this.title;
    data?['phone'] = this.phone;
    data?['country_id'] = this.countryId;
    data?['province_id'] = this.provinceId;
    data?['area_id'] = this.areaId;
    data?['sub_area_id'] = this.subAreaId;
    data?['longitude'] = this.longitude;
    data?['latitude'] = this.latitude;
    data?['notes'] = this.notes;
    data?['is_default'] = this.isDefault;
    data?['user_id'] = this.userId;
    data?['updated_at'] = this.updatedAt;
    data?['created_at'] = this.createdAt;
    data?['id'] = this.id;
    return data;
  }
}
