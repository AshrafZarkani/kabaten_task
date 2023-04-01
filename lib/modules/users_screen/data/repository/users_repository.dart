import 'package:kabaten_task/modules/profile_screen/profile_sr.dart';
import 'package:kabaten_task/modules/users_screen/users_sr.dart';

class UsersRepository {
  Future<ProfileDetailsData?> getUserDetails(String id) async {
    final res = await UsersApi().getUserDetails(id);
    if (res != null && (res['status'] == "200" || res['status'] == "201")) {
      if (res['data'] != null) {
        ProfileDetailsData userDetails =
            ProfileDetailsData.fromJson(res['data']);
        return userDetails;
      }
    }
    return null;
  }
}
