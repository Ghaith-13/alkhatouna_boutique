class MyPointsModel {
  MyPointsData? data;
  bool? errors;

  MyPointsModel({this.data, this.errors});

  MyPointsModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new MyPointsData.fromJson(json?['data']) : null;
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

class MyPointsData {
  List<PointRecords>? pointRecords;
  int? totalPoints;

  MyPointsData({this.pointRecords, this.totalPoints});

  MyPointsData.fromJson(Map<String, dynamic>? json) {
    if (json?['point_records'] != null) {
      pointRecords = <PointRecords>[];
      json?['point_records'].forEach((v) {
        pointRecords!.add(new PointRecords.fromJson(v));
      });
    }
    totalPoints = json?['total_points'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.pointRecords != null) {
      data?['point_records'] =
          this.pointRecords!.map((v) => v.toJson()).toList();
    }
    data?['total_points'] = this.totalPoints;
    return data;
  }
}

class PointRecords {
  int? id;
  String? userId;
  String? points;
  String? type;
  String? createdAt;
  String? updatedAt;

  PointRecords(
      {this.id,
      this.userId,
      this.points,
      this.type,
      this.createdAt,
      this.updatedAt});

  PointRecords.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
    points = json?['points'];
    type = json?['type'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['user_id'] = this.userId;
    data?['points'] = this.points;
    data?['type'] = this.type;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}
