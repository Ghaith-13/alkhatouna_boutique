class TutorialsModel {
  List<Tutorial>? data;
  bool? errors;

  TutorialsModel({this.data, this.errors});

  TutorialsModel.fromJson(Map<String, dynamic>? json) {
    if (json?['data'] != null) {
      data = <Tutorial>[];
      json?['data'].forEach((v) {
        data!.add(new Tutorial.fromJson(v));
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

class Tutorial {
  int? id;
  String? name;
  String? link;

  Tutorial({this.id, this.name, this.link});

  Tutorial.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    link = json?['link'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['link'] = this.link;
    return data;
  }
}
