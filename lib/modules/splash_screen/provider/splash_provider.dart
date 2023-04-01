import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/services/storage/storage.dart';

import '../splash_sr.dart';

final splashProvider = Provider<SplashScreenController>((ref) {
  final splash = SplashScreenController();
  return splash;
});

final storageProvider = Provider<StorageService>((ref) {
  final storage = StorageService.instance;
  return storage;
});

final checkIfFirstLoginProvider = FutureProvider.autoDispose((ref) async {
  return ref.read(splashProvider).checkIfFirstRun();
});

final storageFutureProvider =
    FutureProvider.autoDispose.family<String?, String>((ref, param) async {
  return ref.read(storageProvider).readSecureData(param);
});
