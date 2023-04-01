import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/services/storage/storage.dart';

class SplashScreenController extends ChangeNotifier {
  Future<bool> checkIfFirstRun() async {
    final StorageService storageService = StorageService.instance;
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('first_run') ?? true) {
      await storageService.deleteAllSecureData();
      prefs.setBool('first_run', false);
      return true;
    }
    return false;
  }
}
