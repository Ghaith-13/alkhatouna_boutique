class BrandsModel {
  BrandsData? data;
  bool? errors;

  BrandsModel({this.data, this.errors});

  BrandsModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new BrandsData.fromJson(json?['data']) : null;
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

class BrandsData {
  List<Brandss>? brands;

  BrandsData({this.brands});

  BrandsData.fromJson(Map<String, dynamic>? json) {
    if (json?['brands'] != null) {
      brands = <Brandss>[];
      json?['brands'].forEach((v) {
        brands!.add(new Brandss.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.brands != null) {
      data?['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brandss {
  var id;
  var name;
  var logoUrl;
  List<Categories>? categories;

  Brandss({this.id, this.name, this.logoUrl, this.categories});

  Brandss.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    logoUrl = json?['logo_url'];
    if (json?['categories'] != null) {
      categories = <Categories>[];
      json?['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
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

class Categories {
  var id;
  var parentId;
  var nameAr;
  var nameEn;
  var nameKu;

  Categories({this.id, this.parentId, this.nameAr, this.nameEn, this.nameKu});

  Categories.fromJson(Map<String, dynamic>? json) {
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
