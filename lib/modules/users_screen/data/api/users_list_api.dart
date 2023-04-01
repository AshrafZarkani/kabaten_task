import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/services/networking/networking.dart';

class UsersApi {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Future<dynamic> getUserList(int page) async {
    try {
      Map<String, dynamic> query = {"page": page, "page_size": 20};
      final res =
          await _apiBaseHelper.get(ApiPaths.users, queryParameters: query);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getUserDetails(String id) async {
    try {
      final res = await _apiBaseHelper.get("${ApiPaths.user}/$id");
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
