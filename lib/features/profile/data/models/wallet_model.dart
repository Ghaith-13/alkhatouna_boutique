class WalletModel {
  bool? errors;
  WalletData? data;

  WalletModel({this.errors, this.data});

  WalletModel.fromJson(Map<String, dynamic>? json) {
    errors = json?['errors'];
    data =
        json?['data'] != null ? new WalletData.fromJson(json?['data']) : null;
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

class WalletData {
  String? walletBalance;
  List<Records>? records;

  WalletData({this.walletBalance, this.records});

  WalletData.fromJson(Map<String, dynamic>? json) {
    walletBalance = json?['wallet_balance'];
    if (json?['records'] != null) {
      records = <Records>[];
      json?['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['wallet_balance'] = this.walletBalance;
    if (this.records != null) {
      data?['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Records {
  int? id;
  String? createdAt;
  int? commissionValue;
  String? promoCode;

  Records({this.id, this.createdAt, this.commissionValue, this.promoCode});

  Records.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    createdAt = json?['created_at'];
    commissionValue = json?['commission_value'];
    promoCode = json?['promo_code'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['created_at'] = this.createdAt;
    data?['commission_value'] = this.commissionValue;
    data?['promo_code'] = this.promoCode;
    return data;
  }
}
