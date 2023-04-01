import 'package:flutter/material.dart';
import 'package:kabaten_task/core/constants/static_strings.dart';
import 'package:kabaten_task/core/services/storage/secure_storage.dart';
import 'package:kabaten_task/modules/auth/controller/auth_controller.dart';
import 'package:kabaten_task/modules/auth/data/data.dart';
import 'package:kabaten_task/modules/auth/helper/helper.dart';

class AuthRepository {
  static Future<RegisterModel?> registerUser(
      {String? email,
      String? password,
      required BuildContext context,
      required AuthProvider authProv}) async {
    try {
      authProv.setLoading(true);
      final Map<String, String> body = {
        "email": email.toString(),
        "password": password.toString()
      };
      final res = await AuthApis().register(body);
      if (res != null) {
        RegisterModel registerUser = RegisterModel.fromJson(res);
        if (registerUser.status == "200" || registerUser.status == "201") {
          final StorageService storageService = StorageService.instance;
          await storageService.deleteSecureData(
              StorageItem(StaticStrings.registerAccessToken, ""));
          await storageService.deleteSecureData(
              StorageItem(StaticStrings.loginAccessToken, ""));
          await storageService
              .deleteSecureData(StorageItem(StaticStrings.refreshToken, ""));
          final StorageItem newItem = StorageItem(
              StaticStrings.registerAccessToken,
              registerUser.data?.accessToken.toString() ?? "");
          await storageService.writeSecureData(newItem);
          authProv.setLoading(false);
          return registerUser;
        }
      }
      authProv.setLoading(false);
    } catch (e) {
      authProv.setLoading(false);
      showMyDialog(e.toString(), context);
      rethrow;
    }
    return null;
  }

  static Future<RegisterModel?> loginUser(
      {String? email,
      String? password,
      required BuildContext context,
      required AuthProvider authProv}) async {
    try {
      authProv.setLoading(true);
      final Map<String, String> body = {
        "email": email.toString(),
        "password": password.toString()
      };
      final res = await AuthApis().login(body);
      if (res != null && (res['status'] == "200" || res['status'] == "201")) {
        RegisterModel loggedInUser = RegisterModel.fromJson(res);
        if (loggedInUser.status == "200" || loggedInUser.status == "201") {
          final StorageService storageService = StorageService.instance;
          final StorageItem newAccessToken = StorageItem(
              StaticStrings.loginAccessToken,
              loggedInUser.data?.accessToken.toString() ?? "");
          final StorageItem newRefreshToken = StorageItem(
              StaticStrings.refreshToken,
              loggedInUser.data?.refreshToken.toString() ?? "");
          await storageService.writeSecureData(newAccessToken);
          await storageService.writeSecureData(newRefreshToken);
          authProv.setLoading(false);
          return loggedInUser;
        }
      }
      authProv.setLoading(false);
    } catch (e) {
      authProv.setLoading(false);
      showMyDialog(e.toString(), context);
      rethrow;
    }
    return null;
  }

  static Future<RegisterModel?> verifyToken(
      String verifyCode, BuildContext context,
      {required AuthProvider authProv}) async {
    try {
      authProv.setLoading(true);
      final res = await AuthApis().verifyToken(verifyCode);
      if (res != null && res['status'] == "201" || res['status'] == "200") {
        RegisterModel loggedInUser = RegisterModel.fromJson(res);
        authProv.setLoading(false);
        return loggedInUser;
      }
      authProv.setLoading(false);
    } catch (e) {
      authProv.setLoading(false);
      showMyDialog(e.toString(), context);
      rethrow;
    }
    return null;
  }

  static Future<void> refreshToken({required BuildContext context}) async {
    try {
      final StorageService storageService = StorageService.instance;
      final oldRefreshToken =
          await storageService.readSecureData(StaticStrings.refreshToken);
      if (oldRefreshToken != null) {
        final res = await AuthApis().refreshToken(oldRefreshToken);
        if (res != null && res['status'] == "201" || res['status'] == "200") {
          RegisterModel newRegistrationModel = RegisterModel.fromJson(res);
          final StorageService storageService = StorageService.instance;
          final StorageItem newAccessToken = StorageItem(
              StaticStrings.loginAccessToken,
              newRegistrationModel.data?.accessToken.toString() ?? "");
          final StorageItem newRefreshToken = StorageItem(
              StaticStrings.refreshToken,
              newRegistrationModel.data?.refreshToken.toString() ?? "");
          await storageService.writeSecureData(newAccessToken);
          await storageService.writeSecureData(newRefreshToken);
        }
      }
    } catch (e) {
      showMyDialog(e.toString(), context);
      rethrow;
    }
  }
}
