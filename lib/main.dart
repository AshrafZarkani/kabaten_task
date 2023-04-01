import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/modules/auth/screens/signin_signup_screen.dart';
import 'package:kabaten_task/modules/home_screen/screens/home_page.dart';
import 'package:kabaten_task/modules/splash_screen/screens/splash.dart';
import 'package:kabaten_task/modules/users_screen/users_sr.dart';

import 'core/constants/constants.dart';
import 'modules/verify_screen/verify_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Kabaten',
      theme: ThemeData(
        primarySwatch: MyAppColors.blue,
        hintColor: MyAppColors.grey,
      ),
      routes: {
        NamedRoutes.main: (_) => const SplashScreen(),
        NamedRoutes.myHomePage: (context) => const MyHomePage(),
        NamedRoutes.signInSignUp: (context) => const SignInSignUpScreen(),
        NamedRoutes.verifyRegistration: (context) =>
            const VerifyRegistrationScreen(),
        NamedRoutes.userDetails: (context) => const UserDetailsScreen()
      },
    );
  }
}
