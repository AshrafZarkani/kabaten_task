import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/modules/profile_screen/profile_sr.dart';
import 'package:kabaten_task/modules/users_screen/users_sr.dart';

final usersProvider = ChangeNotifierProvider((ref) => UsersListController());

final userDetailsProv = Provider<UsersRepository>((ref) => UsersRepository());

final getUserDetailsProvider = FutureProvider.family
    .autoDispose<ProfileDetailsData?, String>((ref, param) {
  return ref.read(userDetailsProv).getUserDetails(param);
});
