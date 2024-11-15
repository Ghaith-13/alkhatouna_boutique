class WhatsappSettingsModel {
  WhatsappData? data;
  bool? errors;

  WhatsappSettingsModel({this.data, this.errors});

  WhatsappSettingsModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new WhatsappData.fromJson(json?['data']) : null;
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

class WhatsappData {
  String? instanceId;
  String? token;

  WhatsappData({this.instanceId, this.token});

  WhatsappData.fromJson(Map<String, dynamic>? json) {
    instanceId = json?['instance_id'];
    token = json?['token'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['instance_id'] = this.instanceId;
    data?['token'] = this.token;
    return data;
  }
}
