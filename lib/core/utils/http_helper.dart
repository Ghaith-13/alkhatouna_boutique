import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'app_logger.dart';
import 'cache_helper.dart';
import 'http_custom_exception.dart';

enum RequestState { initial, loading, success, failed }

class ApiBaseHelper {
  final String baseUrl;
  Map<String, String>? baseHeaders;

  ApiBaseHelper(this.baseUrl) {
    baseHeaders = {
      'Accept': 'application/json',
      // 'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Authorization': 'Bearer ${CacheHelper.getData(
        key: "USER_TOKEN",
      )}'
    };
  }
  void updateHeader() {
    baseHeaders = {
      'Accept': 'application/json',
      // 'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Authorization': 'Bearer ${CacheHelper.getData(
        key: "USER_TOKEN",
      )}'
    };
  }

  Future<Map<String, dynamic>?> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    String? newBaseUrl,
  }) async {
    Map<String, dynamic>? responseJson;
    log("api url $url");

    Uri urlRequest = Uri.parse("${newBaseUrl ?? baseUrl}$url")
        .replace(queryParameters: queryParameters);
    try {
      log(urlRequest.toString());
      log(baseHeaders.toString());

      final http.Response response =
          await http.get(urlRequest, headers: headers ?? baseHeaders);
      responseJson =
          _returnResponse(response, url: urlRequest.toString(), request: "GET");
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالانترنت');
    }
    return responseJson;
  }

  Future<Map<String, dynamic>?> post(String url,
      {Object? body, Map<String, String>? headers}) async {
    logger.i(body);
    logger.i(url);
    logger.i(baseHeaders);
    Map<String, dynamic>? responseJson;
    Uri urlRequest = Uri.parse("$baseUrl$url");
    try {
      final http.Response response = await http.post(urlRequest,
          body: body, headers: headers ?? baseHeaders);
      logger.i(response.body);

      responseJson = _returnResponse(response,
          url: urlRequest.toString(), request: "POST");
    } on SocketException catch (e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  Future<Map<String, dynamic>?> delete(String url,
      {Object? body, Map<String, String>? headers}) async {
    logger.i(body);
    logger.i(url);
    logger.i(baseHeaders);
    Map<String, dynamic>? responseJson;
    Uri urlRequest = Uri.parse("$baseUrl$url");
    try {
      final http.Response response = await http.delete(urlRequest,
          body: body, headers: headers ?? baseHeaders);
      logger.i(response.body);

      responseJson = _returnResponse(response,
          url: urlRequest.toString(), request: "Delete");
    } on SocketException catch (e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  ///to upload image
  Future<Map<String, dynamic>?> multiPartRequest(
    String url, {
    required Map<String, String>? body,
    required List<File>? files,
    required String fileKey,
    String? newBaseUrl,
    List<File>? documents,
    String? documentsKey,
    Map<String, String>? headers,
  }) async {
    Map<String, dynamic>? responseJson;
    Uri urlRequest = Uri.parse("${newBaseUrl ?? baseUrl}$url");
    //Uri urlRequest = Uri.parse(baseUrl + url);
    log(urlRequest.toString());
    try {
      var request = http.MultipartRequest(
        'POST',
        urlRequest,
      );

      request.headers["Content-Type"] = "multipart/form-data";
      request.headers["Accept"] = "application/json";
      request.headers["Authorization"] = 'Bearer ${CacheHelper.getData(
        key: "USER_TOKEN",
      )}';

      //init form data eg,name,description,...
      body?.forEach((key, value) {
        request.fields[key] = value;
      });
      //init file data eg,pdf,img,..

      if (files != null) {
        for (int i = 0; i < files.length; i++) {
          request.files.add(
            await http.MultipartFile.fromPath(
              files.length > 1
                  ? "$fileKey[$i]"
                  : fileKey, //name of field in request api form data
              files[i].path,
            ),
          );
        }
      }
      //init document data eg,pdf,img,..
      if (documents != null) {
        for (int i = 0; i < documents.length; i++) {
          request.files.add(
            await http.MultipartFile.fromPath(
              documents.length > 1
                  ? "$documentsKey[$i]"
                  : documentsKey!, //name of field in request api form data
              documents[i].path,
            ),
          );
        }
      }
      var result = await request.send();

      responseJson = _returnResponse(
          http.Response(
            await result.stream.bytesToString(),
            result.statusCode,
          ),
          url: urlRequest.toString(),
          request: "POST");
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالانترنت');
    }
    return responseJson;
  }

  ///to update request
  Future<Map<String, dynamic>?> update(String url,
      {Object? body,
      Map<String, String>? headers,
      Map<String, String>? query}) async {
    Map<String, dynamic>? responseJson;
    Uri urlRequest = Uri.parse(baseUrl + url).replace(queryParameters: query);
    try {
      final http.Response response = await http.put(urlRequest,
          body: body, headers: headers ?? baseHeaders);
      responseJson = _returnResponse(response,
          url: urlRequest.toString(), request: "POST");
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالانترنت');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response,
      {required String url, String? request}) {
    ResponseFailure? error;
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        logger.i(
            "REQUEST[$request] StatusCode[${response.statusCode}]=> PATH: $url"
            "=> REQUEST VALUES: $responseJson => HEADERS: ${response.headers}");
        return responseJson;
      case 201 || 202:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        logger.i(
            "REQUEST[$request] StatusCode[${response.statusCode}]=> PATH: $url"
            "=> REQUEST VALUES: $responseJson => HEADERS: ${response.headers}");
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        error = handleError(responseJson);
        logger.i("RESPONSE[${response.statusCode}] => DATA: ${response.body}");
        throw BadRequestException(error);
      case 401:
        var responseJson = json.decode(response.body.toString());
        error = handleError(responseJson);
        logger.i(
            "REQUEST[$request] => PATH: $url RESPONSE[${response.statusCode}] => DATA: ${response.body}");
        throw UnauthorisedException(error);
      case 404:
      case 403:
      case 422:
        var responseJson = json.decode(response.body.toString());
        error = handleError(responseJson);
        logger.i(
            "REQUEST[$request] => PATH: $url RESPONSE[${response.statusCode}] => DATA: ${response.body}");
        throw UnauthorisedException(error);
      case 500:
      default:
        logger.i(
            "REQUEST [$request] => PATH: $url => \nSTATUS CODE[${response.statusCode}] => \nDATA: ${response.body}");
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
