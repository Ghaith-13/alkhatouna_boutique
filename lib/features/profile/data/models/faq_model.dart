class faqModel {
  FaqData? data;
  bool? errors;

  faqModel({this.data, this.errors});

  faqModel.fromJson(Map<String, dynamic>? json) {
    data = json?['data'] != null ? new FaqData.fromJson(json?['data']) : null;
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

class FaqData {
  List<Faqs>? faqs;

  FaqData({this.faqs});

  FaqData.fromJson(Map<String, dynamic>? json) {
    if (json?['faqs'] != null) {
      faqs = <Faqs>[];
      json?['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.faqs != null) {
      data?['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Faqs {
  int? id;
  String? questionAr;
  String? questionEn;
  String? questionKu;
  String? answerAr;
  String? answerEn;
  String? answerKu;
  String? createdAt;
  String? updatedAt;

  Faqs(
      {this.id,
      this.questionAr,
      this.questionEn,
      this.questionKu,
      this.answerAr,
      this.answerEn,
      this.answerKu,
      this.createdAt,
      this.updatedAt});

  Faqs.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    questionAr = json?['question_ar'];
    questionEn = json?['question_en'];
    questionKu = json?['question_ku'];
    answerAr = json?['answer_ar'];
    answerEn = json?['answer_en'];
    answerKu = json?['answer_ku'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['question_ar'] = this.questionAr;
    data?['question_en'] = this.questionEn;
    data?['question_ku'] = this.questionKu;
    data?['answer_ar'] = this.answerAr;
    data?['answer_en'] = this.answerEn;
    data?['answer_ku'] = this.answerKu;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}
