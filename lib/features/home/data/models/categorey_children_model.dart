class CategoreyChildrenModel {
  CategoreyChildrenData? data;
  bool? errors;

  CategoreyChildrenModel({this.data, this.errors});

  CategoreyChildrenModel.fromJson(Map<String, dynamic>? json) {
    data = json?['data'] != null
        ? new CategoreyChildrenData.fromJson(json?['data'])
        : null;
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

class CategoreyChildrenData {
  List<Categories>? categories;

  CategoreyChildrenData({this.categories});

  CategoreyChildrenData.fromJson(Map<String, dynamic>? json) {
    if (json?['categories'] != null) {
      categories = <Categories>[];
      json?['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.categories != null) {
      data?['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? type;
  String? nameAr;
  String? nameEn;
  String? nameKu;
  String? image;
  String? isVisible;
  String? parentId;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  bool? hasChildren;
  List<dynamic>? children;

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
      this.hasChildren,
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
    hasChildren = json?['has_children'];
    if (json?['children'] != null) {
      children = <Null>[];
      json?['children'].forEach((v) {
        // children!.add(new fromJson(v));
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
    data?['has_children'] = this.hasChildren;
    if (this.children != null) {
      data?['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
