class CheckPhoneVerfiedModel {
  Data? data;
  bool? errors;

  CheckPhoneVerfiedModel({this.data, this.errors});

  CheckPhoneVerfiedModel.fromJson(Map<String, dynamic>? json) {
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
  var isPhoneVerified;

  Data({this.isPhoneVerified});

  Data.fromJson(Map<String, dynamic>? json) {
    isPhoneVerified = json?['is_phone_verified'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['is_phone_verified'] = this.isPhoneVerified;
    return data;
  }
}
