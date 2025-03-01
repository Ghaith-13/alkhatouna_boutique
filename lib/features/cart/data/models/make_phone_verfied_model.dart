class MakePhoneVerifedModel {
  Data? data;
  bool? errors;

  MakePhoneVerifedModel({this.data, this.errors});

  MakePhoneVerifedModel.fromJson(Map<String, dynamic>? json) {
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
  var message;

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
  var phone2;
  var instagram;
  var isPhoneVerified;

  Address(
      {this.id,
      this.userId,
      this.title,
      this.phone,
      this.countryId,
      this.provinceId,
      this.areaId,
      this.subAreaId,
      this.longitude,
      this.latitude,
      this.notes,
      this.isDefault,
      this.createdAt,
      this.updatedAt,
      this.phone2,
      this.instagram,
      this.isPhoneVerified});

  Address.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
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
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    phone2 = json?['phone2'];
    instagram = json?['instagram'];
    isPhoneVerified = json?['is_phone_verified'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['user_id'] = this.userId;
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
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['phone2'] = this.phone2;
    data?['instagram'] = this.instagram;
    data?['is_phone_verified'] = this.isPhoneVerified;
    return data;
  }
}
