class NotificationModel {
  List<Notifications>? data;
  bool? errors;

  NotificationModel({this.data, this.errors});

  NotificationModel.fromJson(Map<String, dynamic>? json) {
    if (json?['data'] != null) {
      data = <Notifications>[];
      json?['data'].forEach((v) {
        data!.add(new Notifications.fromJson(v));
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

class Notifications {
  int? id;
  String? body;
  var image;
  String? title;
  int? userId;
  int? senderId;
  String? createdAt;
  String? updatedAt;

  Notifications(
      {this.id,
      this.body,
      this.image,
      this.title,
      this.userId,
      this.senderId,
      this.createdAt,
      this.updatedAt});

  Notifications.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    body = json?['body'];
    image = json?['image'];
    title = json?['title'];
    userId = json?['user_id'];
    senderId = json?['sender_id'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['body'] = this.body;
    data?['image'] = this.image;
    data?['title'] = this.title;
    data?['user_id'] = this.userId;
    data?['sender_id'] = this.senderId;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}
