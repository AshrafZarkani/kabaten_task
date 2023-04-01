import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../splash_sr.dart';

final splashProvider = Provider<SplashScreenController>((ref) {
  final splash = SplashScreenController();
  return splash;
});

final checkIfFirstLoginProvider = FutureProvider.autoDispose((ref) async {
  return ref.read(splashProvider).checkIfFirstRun();
});
