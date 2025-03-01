class UserCategoriesModel {
  UserCategoriesData? data;
  bool? errors;

  UserCategoriesModel({this.data, this.errors});

  UserCategoriesModel.fromJson(Map<String, dynamic>? json) {
    data = json?['data'] != null
        ? new UserCategoriesData.fromJson(json?['data'])
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

class UserCategoriesData {
  List<Categories>? categories;

  UserCategoriesData({this.categories});

  UserCategoriesData.fromJson(Map<String, dynamic>? json) {
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
  var name;
  var orderCount;
  var status;
  var createdAt;
  var updatedAt;
  var nameAr;
  var nameKu;
  var descriptionAr;
  var descriptionEn;
  var descriptionKu;
  List<Benefits>? benefits;

  Categories(
      {this.id,
      this.name,
      this.orderCount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.nameAr,
      this.nameKu,
      this.descriptionAr,
      this.descriptionEn,
      this.descriptionKu,
      this.benefits});

  Categories.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    orderCount = json?['order_count'];
    status = json?['status'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    nameAr = json?['name_ar'];
    nameKu = json?['name_ku'];
    descriptionAr = json?['description_ar'];
    descriptionEn = json?['description_en'];
    descriptionKu = json?['description_ku'];
    if (json?['benefits'] != null) {
      benefits = <Benefits>[];
      json?['benefits'].forEach((v) {
        benefits!.add(new Benefits.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['order_count'] = this.orderCount;
    data?['status'] = this.status;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['name_ar'] = this.nameAr;
    data?['name_ku'] = this.nameKu;
    data?['description_ar'] = this.descriptionAr;
    data?['description_en'] = this.descriptionEn;
    data?['description_ku'] = this.descriptionKu;
    if (this.benefits != null) {
      data?['benefits'] = this.benefits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Benefits {
  int? id;
  var userCategoryId;
  var benefitType;
  var value;
  var durationDays;
  var limit;
  var status;
  var createdAt;
  var updatedAt;

  Benefits(
      {this.id,
      this.userCategoryId,
      this.benefitType,
      this.value,
      this.durationDays,
      this.limit,
      this.status,
      this.createdAt,
      this.updatedAt});

  Benefits.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userCategoryId = json?['user_category_id'];
    benefitType = json?['benefit_type'];
    value = json?['value'];
    durationDays = json?['duration_days'];
    limit = json?['limit'];
    status = json?['status'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['user_category_id'] = this.userCategoryId;
    data?['benefit_type'] = this.benefitType;
    data?['value'] = this.value;
    data?['duration_days'] = this.durationDays;
    data?['limit'] = this.limit;
    data?['status'] = this.status;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}
