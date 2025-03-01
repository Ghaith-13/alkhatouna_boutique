// ignore_for_file: prefer_typing_uninitialized_variables

class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([ResponseFailure? message])
      : super('${message?.message}', "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([ResponseFailure? message])
      : super(' ${message?.message}', '');
  // "Unauthorised "
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class ResponseFailure {
  bool? success;
  String? message;
  ErrorData? data;

  ResponseFailure({this.success, this.message, this.data});

  ResponseFailure.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    message = json?['message'];
    data = json?['data'] != null ? ErrorData.fromJson(json?['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ErrorData {
  List<String?>? descAr;

  ErrorData({this.descAr});

  ErrorData.fromJson(Map<String, dynamic>? json) {
    descAr = json?['desc_ar'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['desc_ar'] = descAr;
    return data;
  }
}

class ValidationErrorModel {
  List<Errors>? errors;

  ValidationErrorModel({this.errors});

  ValidationErrorModel.fromJson(Map<String, dynamic>? json) {
    if (json?['errors'] != null) {
      errors = <Errors>[];
      json?['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String? code;
  String? message;

  Errors({this.code, this.message});

  Errors.fromJson(Map<String, dynamic>? json) {
    code = json?['code'];
    message = json?['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

ResponseFailure handleError(dynamic response) {
  var error;
  // List<Errors> errors = [Errors(code: "", message: "")];

  // if (response['message'] != null) {
  //   error = ResponseFailure.fromJson(response);
  // } else

  if (response['data'] != null) {
    // errors = ValidationErrorModel.fromJson(response).errors ??
    //     [Errors(code: "", message: "")];
    error = ResponseFailure(
      success: false,
      message: response['data']['message'] == null
          ? response['data'].toString()
          : response['data']['message'].toString(),
    );
  } else {
    error = ResponseFailure(
      success: false,
      message: "",
    );
  }
  return error;
}
