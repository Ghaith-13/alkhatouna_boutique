class SettingsModel {
  SettingsDataModel? data;
  bool? errors;

  SettingsModel({this.data, this.errors});

  SettingsModel.fromJson(Map<String, dynamic>? json) {
    data = json?['data'] != null
        ? new SettingsDataModel.fromJson(json?['data'])
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

class SettingsDataModel {
  Settings? settings;

  SettingsDataModel({this.settings});

  SettingsDataModel.fromJson(Map<String, dynamic>? json) {
    settings = json?['settings'] != null
        ? new Settings.fromJson(json?['settings'])
        : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.settings != null) {
      data?['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class Settings {
  int? id;
  String? phoneSupport;
  String? emailSupport;
  String? facebookLink;
  String? facebookName;
  String? instagramName;
  String? instagramLink;
  var whatsappLink;
  var whatsappName;
  var tiktokLink;
  var tiktokName;
  var close_app;
  String? orderConfirmationMessage;
  String? aboutUs;
  String? termsAndConditions;
  String? privacyPolicy;
  String? refundPolicy;
  String? createdAt;
  String? updatedAt;

  Settings(
      {this.id,
      this.phoneSupport,
      this.emailSupport,
      this.facebookLink,
      this.facebookName,
      this.instagramName,
      this.instagramLink,
      this.whatsappLink,
      this.whatsappName,
      this.tiktokLink,
      this.tiktokName,
      this.orderConfirmationMessage,
      this.aboutUs,
      this.termsAndConditions,
      this.privacyPolicy,
      this.refundPolicy,
      this.close_app,
      this.createdAt,
      this.updatedAt});

  Settings.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    phoneSupport = json?['phone_support'];
    emailSupport = json?['email_support'];
    facebookLink = json?['facebook_link'];
    facebookName = json?['facebook_name'];
    instagramName = json?['instagram_name'];
    instagramLink = json?['instagram_link'];
    whatsappLink = json?['whatsapp_link'];
    whatsappName = json?['whatsapp_name'];
    tiktokLink = json?['tiktok_link'];
    tiktokName = json?['tiktok_name'];
    orderConfirmationMessage = json?['order_confirmation_message'];
    aboutUs = json?['about_us'];
    termsAndConditions = json?['terms_and_conditions'];
    privacyPolicy = json?['privacy_policy'];
    refundPolicy = json?['refund_policy'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    close_app = json?['close_app'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['phone_support'] = this.phoneSupport;
    data?['email_support'] = this.emailSupport;
    data?['facebook_link'] = this.facebookLink;
    data?['facebook_name'] = this.facebookName;
    data?['instagram_name'] = this.instagramName;
    data?['instagram_link'] = this.instagramLink;
    data?['whatsapp_link'] = this.whatsappLink;
    data?['whatsapp_name'] = this.whatsappName;
    data?['tiktok_link'] = this.tiktokLink;
    data?['tiktok_name'] = this.tiktokName;
    data?['order_confirmation_message'] = this.orderConfirmationMessage;
    data?['about_us'] = this.aboutUs;
    data?['terms_and_conditions'] = this.termsAndConditions;
    data?['privacy_policy'] = this.privacyPolicy;
    data?['refund_policy'] = this.refundPolicy;
    data?['created_at'] = this.createdAt;
    data?['close_app'] = this.close_app;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}
