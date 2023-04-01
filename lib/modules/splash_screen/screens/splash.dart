import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/modules/splash_screen/provider/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashProv = ref.watch(checkIfFirstLoginProvider);
    final storageFuture =
        ref.watch(storageFutureProvider(StaticStrings.loginAccessToken));

    return Scaffold(
      body: splashProv.when(
          data: (data) {
            return Scaffold(
                body: storageFuture.when(
              data: (data) {
                if (data != null && data.isNotEmpty == true) {
                  WidgetsBinding.instance.addPostFrameCallback((_) =>
                      Navigator.pushNamed(context, NamedRoutes.myHomePage));
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) =>
                      Navigator.pushNamed(context, NamedRoutes.signInSignUp));
                }
                return;
              },
              error: (error, s) => const SizedBox(
                height: 1,
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ));
          },
          error: (error, s) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
