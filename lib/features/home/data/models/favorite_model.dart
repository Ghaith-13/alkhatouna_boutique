class FavoriteModel {
  bool? errors;
  Data? data;

  FavoriteModel({this.errors, this.data});

  FavoriteModel.fromJson(Map<String, dynamic>? json) {
    errors = json?['errors'];
    data = json?['data'] != null ? new Data.fromJson(json?['data']) : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['errors'] = this.errors;
    if (this.data != null) {
      data?['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? message;

  Data({this.message});

  Data.fromJson(Map<String, dynamic>? json) {
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['message'] = this.message;
    return data;
  }
}
