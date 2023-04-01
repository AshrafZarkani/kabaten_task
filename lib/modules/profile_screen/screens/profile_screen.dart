import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/extensions/build_context_x.dart';
import 'package:kabaten_task/modules/profile_screen/provider/profile_provider.dart';
import 'package:kabaten_task/modules/profile_screen/widgets/profile_screen_body.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileProv = ref.watch(getProfileProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          padding: const EdgeInsets.all(8),
          child: userProfileProv.when(
              data: (data) {
                return ProfileScreenContentBody(profileData: data?.data);
              },
              error: (e, s) => Center(child: Text(e.toString())),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
