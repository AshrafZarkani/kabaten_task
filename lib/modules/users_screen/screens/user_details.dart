import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/extensions/build_context_x.dart';
import 'package:kabaten_task/modules/profile_screen/widgets/profile_screen_body.dart';
import 'package:kabaten_task/modules/users_screen/provider/users_provider.dart';

class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final userDetailsProv =
        ref.watch(getUserDetailsProvider(arguments.toString()));
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          padding: const EdgeInsets.all(8),
          child: userDetailsProv.when(
              data: (data) {
                return ProfileScreenContentBody(profileData: data);
              },
              error: (e, s) => Center(child: Text(e.toString())),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
