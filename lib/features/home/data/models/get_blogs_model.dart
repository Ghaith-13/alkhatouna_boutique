class GetPlogsModel {
  Data? data;
  bool? errors;

  GetPlogsModel({this.data, this.errors});

  GetPlogsModel.fromJson(Map<String, dynamic>? json) {
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
  SectionInfo? sectionInfo;
  List<Blogs>? blogs;

  Data({this.sectionInfo, this.blogs});

  Data.fromJson(Map<String, dynamic>? json) {
    sectionInfo = json?['section_info'] != null
        ? new SectionInfo.fromJson(json?['section_info'])
        : null;
    if (json?['blogs'] != null) {
      blogs = <Blogs>[];
      json?['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.sectionInfo != null) {
      data?['section_info'] = this.sectionInfo!.toJson();
    }
    if (this.blogs != null) {
      data?['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SectionInfo {
  int? id;
  String? nameAr;
  String? nameEn;
  String? type;
  String? descriptionAr;
  String? descriptionEn;
  String? imageUrl;

  SectionInfo(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.type,
      this.descriptionAr,
      this.descriptionEn,
      this.imageUrl});

  SectionInfo.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    type = json?['type'];
    descriptionAr = json?['description_ar'];
    descriptionEn = json?['description_en'];
    imageUrl = json?['image_url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['type'] = this.type;
    data?['description_ar'] = this.descriptionAr;
    data?['description_en'] = this.descriptionEn;
    data?['image_url'] = this.imageUrl;
    return data;
  }
}

class Blogs {
  int? id;
  String? titleAr;
  String? titleEn;
  String? bodyAr;
  String? bodyEn;
  String? outsideImageUrl;
  String? insideImageUrl;

  Blogs(
      {this.id,
      this.titleAr,
      this.titleEn,
      this.bodyAr,
      this.bodyEn,
      this.outsideImageUrl,
      this.insideImageUrl});

  Blogs.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    titleAr = json?['title_ar'];
    titleEn = json?['title_en'];
    bodyAr = json?['body_ar'];
    bodyEn = json?['body_en'];
    outsideImageUrl = json?['outside_image_url'];
    insideImageUrl = json?['inside_image_url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['title_ar'] = this.titleAr;
    data?['title_en'] = this.titleEn;
    data?['body_ar'] = this.bodyAr;
    data?['body_en'] = this.bodyEn;
    data?['outside_image_url'] = this.outsideImageUrl;
    data?['inside_image_url'] = this.insideImageUrl;
    return data;
  }
}
