import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/services/networking/networking.dart';
import 'package:kabaten_task/core/services/storage/storage.dart';
import 'package:kabaten_task/modules/auth/helper/helper.dart';

class ApiBaseHelper {
  String? get baseUrl =>
      "https://3idm1phq74.execute-api.eu-west-1.amazonaws.com/staging/api/v1/";

  Future<Map<String, String>?> headers([bool? verifyApi]) async {
    final StorageService storageService = StorageService.instance;
    final verifyAuthorization =
        await storageService.readSecureData(StaticStrings.registerAccessToken);
    final loginAccessToken =
        await storageService.readSecureData(StaticStrings.loginAccessToken);
    Map<String, String>? headers = {};
    headers["Content-Type"] = 'application/json';
    headers["Accept"] = "application/json";
    headers['Authorization'] = verifyApi == true
        ? "VRF ${verifyAuthorization.toString()}"
        : "JWT ${loginAccessToken.toString()}";
    return headers;
  }

  var dio = Dio()
    ..interceptors.add(
        LogInterceptor(requestBody: true, request: true, requestHeader: true));

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    var headers = await this.headers();
    try {
      final Response response = await dio.get(baseUrl! + url,
          options: Options(
            headers: headers,
          ),
          queryParameters: queryParameters);
      return response.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      GlobalNavigator.showAlertDialog(errorMessage);
      return errorMessage;
    } catch (e) {
      if (kDebugMode) debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<dynamic> post(String url, dynamic body, {bool? verify}) async {
    var headers = await this.headers(verify);
    try {
      final response = await dio.post(
        baseUrl! + url,
        data: jsonEncode(body),
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      GlobalNavigator.showAlertDialog(errorMessage);
      return errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> put(String url, dynamic body) async {
    var headers = await this.headers();
    try {
      final response = await dio.put(
        baseUrl! + url,
        data: jsonEncode(body),
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      GlobalNavigator.showAlertDialog(errorMessage);
      return errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> patch(String url, dynamic body) async {
    var headers = await this.headers();
    try {
      final response = await dio.patch(
        baseUrl! + url,
        data: jsonEncode(body),
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      GlobalNavigator.showAlertDialog(errorMessage);
      return errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<dynamic> delete(String url) async {
    var headers = await this.headers();
    try {
      final response = await dio.delete(
        baseUrl! + url,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      GlobalNavigator.showAlertDialog(errorMessage);
      return errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }
}
