import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/services/storage/storage.dart';
import 'package:kabaten_task/modules/splash_screen/provider/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashProv = ref.watch(checkIfFirstLoginProvider);
    return Scaffold(
      body: splashProv.when(
          data: (data) {
            return Scaffold(
              body: FutureBuilder(
                  future: StorageService.instance
                      .readSecureData(StaticStrings.loginAccessToken),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data?.isNotEmpty == true) {
                        WidgetsBinding.instance.addPostFrameCallback((_) =>
                            Navigator.pushNamed(
                                context, NamedRoutes.myHomePage));
                      } else {
                        WidgetsBinding.instance.addPostFrameCallback((_) =>
                            Navigator.pushNamed(
                                context, NamedRoutes.signInSignUp));
                      }
                    }
                    return const Center(child: SizedBox());
                  }),
            );
          },
          error: (error, s) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
