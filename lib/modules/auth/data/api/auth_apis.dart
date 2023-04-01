import 'package:kabaten_task/core/constants/api_paths.dart';
import 'package:kabaten_task/core/services/networking/api_base_helper.dart';

class AuthApis {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Future<dynamic> register(body) async {
    try {
      final res = await _apiBaseHelper.post(ApiPaths.user, body);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> login(body) async {
    try {
      final res = await _apiBaseHelper.post(ApiPaths.login, body);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> verifyToken(String verifyCode) async {
    try {
      final res = await _apiBaseHelper.post(
          ApiPaths.verifyToken, {"activation_code": verifyCode},
          verify: true);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> refreshToken(String oldToken) async {
    try {
      final res = await _apiBaseHelper
          .post("${ApiPaths.refreshToken}?refresh_token=$oldToken", {});
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
