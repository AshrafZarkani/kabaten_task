import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/modules/auth/controller/controller.dart';
import 'package:kabaten_task/modules/auth/data/data.dart';

/// Auth Repo provider and change notifier

final authProvider = ChangeNotifierProvider((ref) => AuthProvider());

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository();
  return auth;
});
