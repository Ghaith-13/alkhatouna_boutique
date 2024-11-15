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

  AdressData({this.addresses, this.regions});

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
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.addresses != null) {
      data?['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    if (this.regions != null) {
      data?['regions'] = this.regions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? id;
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
  Country? country;
  Province? province;
  Province? area;
  Province? subArea;

  Addresses(
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
      this.country,
      this.province,
      this.area,
      this.subArea});

  Addresses.fromJson(Map<String, dynamic>? json) {
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
  int? id;
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
  int? id;
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
  int? id;
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
  int? id;
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
