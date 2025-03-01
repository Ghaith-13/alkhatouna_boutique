class GetAdressModel {
  AdressData? data;
  bool? errors;

  GetAdressModel({this.data, this.errors});

  GetAdressModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new AdressData.fromJson(json?['data']) : null;
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

class AdressData {
  List<Addresses>? addresses;
  List<Regions>? regions;
  var show_location;
  AdressData({this.addresses, this.regions, this.show_location});

  AdressData.fromJson(Map<String, dynamic>? json) {
    if (json?['addresses'] != null) {
      addresses = <Addresses>[];
      json?['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    if (json?['regions'] != null) {
      regions = <Regions>[];
      json?['regions'].forEach((v) {
        regions!.add(new Regions.fromJson(v));
      });
    }
    show_location = json?['show_location'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.addresses != null) {
      data?['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    if (this.regions != null) {
      data?['regions'] = this.regions!.map((v) => v.toJson()).toList();
    }
    data?['show_location'] = this.show_location;

    return data;
  }
}

class Addresses {
  var id;
  var userId;
  var title;
  var phone;
  var countryId;
  var provinceId;
  var instagram;
  var areaId;
  var subAreaId;
  var longitude;
  var latitude;
  var notes;
  var isDefault;
  var createdAt;
  var updatedAt;
  var phone2;
  var base_phone2;
  var base_phone;
  var country_code2;
  var country_code_number2;
  var country_code;
  var country_code_number;
  var is_phone_verified;
  Country? country;
  Province? province;
  Province? area;
  Province? subArea;

  Addresses(
      {this.id,
      this.userId,
      this.title,
      this.phone,
      this.instagram,
      this.phone2,
      this.countryId,
      this.provinceId,
      this.areaId,
      this.base_phone2,
      this.country_code2,
      this.base_phone,
      this.country_code,
      this.country_code_number,
      this.subAreaId,
      this.longitude,
      this.latitude,
      this.country_code_number2,
      this.is_phone_verified,
      this.notes,
      this.isDefault,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.province,
      this.area,
      this.subArea});

  Addresses.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
    title = json?['title'];
    phone = json?['phone'];
    instagram = json?['instagram'];
    countryId = json?['country_id'];
    country_code2 = json?['country_code2'];
    phone2 = json?['phone2'];
    base_phone2 = json?['base_phone2'];
    country_code_number2 = json?['country_code_number2'];
    base_phone = json?['base_phone'];
    country_code = json?['country_code'];
    country_code_number = json?['country_code_number'];
    provinceId = json?['province_id'];
    areaId = json?['area_id'];
    is_phone_verified = json?['is_phone_verified'];
    subAreaId = json?['sub_area_id'];
    longitude = json?['longitude'];
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
    data?['base_phone2'] = this.base_phone2;
    data?['title'] = this.title;
    data?['instagram'] = this.instagram;
    data?['phone'] = this.phone;
    data?['phone2'] = this.phone2;
    data?['country_code2'] = this.country_code2;
    data?['country_code'] = this.country_code;
    data?['base_phone'] = this.base_phone;
    data?['country_id'] = this.countryId;
    data?['country_code_number'] = this.country_code_number;
    data?['is_phone_verified'] = this.is_phone_verified;
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

class Regions {
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
  List<Children>? children;

  Regions(
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
      this.updatedAt,
      this.children});

  Regions.fromJson(Map<String, dynamic>? json) {
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
    if (this.children != null) {
      data?['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
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
  List<Children>? children;

  Children(
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
      this.updatedAt,
      this.children});

  Children.fromJson(Map<String, dynamic>? json) {
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
    if (this.children != null) {
      data?['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
