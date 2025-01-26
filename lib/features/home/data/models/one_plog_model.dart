class OnePlogModel {
  Data? data;
  bool? errors;

  OnePlogModel({this.data, this.errors});

  OnePlogModel.fromJson(Map<String, dynamic>? json) {
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
  Blog? blog;
  List<Paragraphs>? paragraphs;

  Data({this.blog, this.paragraphs});

  Data.fromJson(Map<String, dynamic>? json) {
    blog = json?['blog'] != null ? new Blog.fromJson(json?['blog']) : null;
    if (json?['paragraphs'] != null) {
      paragraphs = <Paragraphs>[];
      json?['paragraphs'].forEach((v) {
        paragraphs!.add(new Paragraphs.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.blog != null) {
      data?['blog'] = this.blog!.toJson();
    }
    if (this.paragraphs != null) {
      data?['paragraphs'] = this.paragraphs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blog {
  int? id;
  String? titleAr;
  String? titleEn;
  String? bodyAr;
  String? bodyEn;
  String? outsideImageUrl;
  String? insideImageUrl;

  Blog(
      {this.id,
      this.titleAr,
      this.titleEn,
      this.bodyAr,
      this.bodyEn,
      this.outsideImageUrl,
      this.insideImageUrl});

  Blog.fromJson(Map<String, dynamic>? json) {
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

class Paragraphs {
  int? id;
  String? titleAr;
  String? titleEn;
  String? paragraphAr;
  String? paragraphEn;
  String? fileUrl;
  String? fileType;

  Paragraphs(
      {this.id,
      this.titleAr,
      this.titleEn,
      this.paragraphAr,
      this.paragraphEn,
      this.fileUrl,
      this.fileType});

  Paragraphs.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    titleAr = json?['title_ar'];
    titleEn = json?['title_en'];
    paragraphAr = json?['paragraph_ar'];
    paragraphEn = json?['paragraph_en'];
    fileUrl = json?['file_url'];
    fileType = json?['file_type'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['title_ar'] = this.titleAr;
    data?['title_en'] = this.titleEn;
    data?['paragraph_ar'] = this.paragraphAr;
    data?['paragraph_en'] = this.paragraphEn;
    data?['file_url'] = this.fileUrl;
    data?['file_type'] = this.fileType;
    return data;
  }
}
