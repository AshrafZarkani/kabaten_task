import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/services/networking/networking.dart';

class ProfileApis {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Future<dynamic> getUserProfile() async {
    try {
      final res = await _apiBaseHelper.get(ApiPaths.user);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateUserProfile(body) async {
    try {
      final res = await _apiBaseHelper.patch(ApiPaths.user, body);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
