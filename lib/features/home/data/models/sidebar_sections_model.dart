class SidebarSectionsModel {
  Data? data;
  bool? errors;

  SidebarSectionsModel({this.data, this.errors});

  SidebarSectionsModel.fromJson(Map<String, dynamic>? json) {
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
  List<SideBarSections>? sections;

  Data({this.sections});

  Data.fromJson(Map<String, dynamic>? json) {
    if (json?['sections'] != null) {
      sections = <SideBarSections>[];
      json?['sections'].forEach((v) {
        sections!.add(new SideBarSections.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.sections != null) {
      data?['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SideBarSections {
  int? id;
  String? nameAr;
  String? nameEn;
  String? type;

  SideBarSections({this.id, this.nameAr, this.nameEn, this.type});

  SideBarSections.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    type = json?['type'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['type'] = this.type;
    return data;
  }
}
