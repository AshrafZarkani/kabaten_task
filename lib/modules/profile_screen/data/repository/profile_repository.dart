import 'package:kabaten_task/modules/profile_screen/profile_sr.dart';

class ProfileRepository {
  Future<UserProfile?> getUserProfile() async {
    final res = await ProfileApis().getUserProfile();
    if (res != null && (res['status'] == "200" || res['status'] == "201")) {
      UserProfile userProfile = UserProfile.fromJson(res);
      return userProfile;
    }
    return null;
  }

  static Future<UserProfile?> updateUserProfile(body) async {
    UserProfile? userProfile = await ProfileApis().updateUserProfile(body);
    if (userProfile?.data != null) {
      return userProfile;
    }
    return null;
  }
}
