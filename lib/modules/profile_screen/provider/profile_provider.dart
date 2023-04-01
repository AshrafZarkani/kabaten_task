import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/modules/profile_screen/data/repository/profile_repository.dart';

final profileProv = Provider<ProfileRepository>((ref) => ProfileRepository());

final getProfileProvider = FutureProvider.autoDispose((ref) {
  return ref.read(profileProv).getUserProfile();
});
