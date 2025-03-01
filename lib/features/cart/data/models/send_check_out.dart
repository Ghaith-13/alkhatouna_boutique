class SendCheckOut {
  Data? data;
  bool? errors;

  SendCheckOut({this.data, this.errors});

  SendCheckOut.fromJson(Map<String, dynamic>? json) {
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
