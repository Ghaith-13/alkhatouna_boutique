class ArticlesModel {
  List<Articles>? data;
  bool? errors;

  ArticlesModel({this.data, this.errors});

  ArticlesModel.fromJson(Map<String, dynamic>? json) {
    if (json?['data'] != null) {
      data = <Articles>[];
      json?['data'].forEach((v) {
        data!.add(new Articles.fromJson(v));
      });
    }
    errors = json?['errors'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.data != null) {
      data?['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data?['errors'] = this.errors;
    return data;
  }
}

class Articles {
  int? id;
  String? title;
  String? body;
  List<Images>? images;
  String? createdAt;

  Articles({this.id, this.title, this.body, this.images, this.createdAt});

  Articles.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    title = json?['title'];
    body = json?['body'];
    if (json?['images'] != null) {
      images = <Images>[];
      json?['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    createdAt = json?['created_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['title'] = this.title;
    data?['body'] = this.body;
    if (this.images != null) {
      data?['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data?['created_at'] = this.createdAt;
    return data;
  }
}

class Images {
  int? id;
  String? url;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    url = json?['url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['url'] = this.url;
    return data;
  }
}
