class UserModel {
  UserInfo? data;
  bool? errors;

  UserModel({this.data, this.errors});

  UserModel.fromJson(Map<String, dynamic>? json) {
    data = json?['data'] != null ? new UserInfo.fromJson(json?['data']) : null;
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

class UserInfo {
  int? id;
  var name;
  var phone;
  var email;
  var isActive;
  var type;
  var referralCode;
  var points;
  var fcmToken;
  var emailVerifiedAt;
  var createdAt;
  var updatedAt;
  var createdBy;
  var updatedBy;
  var isBlogger;
  var walletBalance;

  UserInfo(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.isActive,
      this.type,
      this.referralCode,
      this.points,
      this.fcmToken,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.isBlogger,
      this.walletBalance});

  UserInfo.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    phone = json?['phone'];
    email = json?['email'];
    isActive = json?['is_active'];
    type = json?['type'];
    referralCode = json?['referral_code'];
    points = json?['points'];
    fcmToken = json?['fcm_token'];
    emailVerifiedAt = json?['email_verified_at'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    isBlogger = json?['is_blogger'];
    walletBalance = json?['wallet_balance'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['phone'] = this.phone;
    data?['email'] = this.email;
    data?['is_active'] = this.isActive;
    data?['type'] = this.type;
    data?['referral_code'] = this.referralCode;
    data?['points'] = this.points;
    data?['fcm_token'] = this.fcmToken;
    data?['email_verified_at'] = this.emailVerifiedAt;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['is_blogger'] = this.isBlogger;
    data?['wallet_balance'] = this.walletBalance;
    return data;
  }
}
