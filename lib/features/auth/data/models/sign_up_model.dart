class SignUpModel {
  bool? errors;
  Data? data;

  SignUpModel({this.errors, this.data});

  SignUpModel.fromJson(Map<String, dynamic>? json) {
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
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic>? json) {
    user = json?['user'] != null ? new User.fromJson(json?['user']) : null;
    token = json?['token'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.user != null) {
      data?['user'] = this.user!.toJson();
    }
    data?['token'] = this.token;
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? phone;
  String? type;
  var isActive;
  var birthdate;
  var referralCode;
  var points;
  String? fcmToken;
  var updatedAt;
  var createdAt;
  var id;

  User(
      {this.name,
      this.email,
      this.phone,
      this.type,
      this.isActive,
      this.referralCode,
      this.points,
      this.birthdate,
      this.fcmToken,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    email = json?['email'];
    phone = json?['phone'];
    type = json?['type'];
    isActive = json?['is_active'];
    birthdate = json?['birthdate'];
    referralCode = json?['referral_code'];
    points = json?['points'];
    fcmToken = json?['fcm_token'];
    updatedAt = json?['updated_at'];
    createdAt = json?['created_at'];
    id = json?['id'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['name'] = this.name;
    data?['email'] = this.email;
    data?['birthdate'] = this.birthdate;
    data?['phone'] = this.phone;
    data?['type'] = this.type;
    data?['is_active'] = this.isActive;
    data?['referral_code'] = this.referralCode;
    data?['points'] = this.points;
    data?['fcm_token'] = this.fcmToken;
    data?['updated_at'] = this.updatedAt;
    data?['created_at'] = this.createdAt;
    data?['id'] = this.id;
    return data;
  }
}
