import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/extensions/build_context_x.dart';
import 'package:kabaten_task/modules/auth/controller/auth_controller.dart';
import 'package:kabaten_task/modules/auth/data/repository/auth_repository.dart';
import 'package:kabaten_task/modules/auth/provider/auth_provider.dart';
import 'package:kabaten_task/modules/auth/widgets/login_register_view_toggle.dart';
import 'package:kabaten_task/modules/auth/widgets/password_information.dart';
import 'package:kabaten_task/modules/auth/widgets/register_content_body.dart';
import 'package:kabaten_task/modules/widgets/primary_button.dart';

class SignInSignUpScreen extends StatelessWidget {
  const SignInSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignInSignUpScreenContentBody(),
              const AlreadyHaveAnAccountText(),
              Consumer(builder: (context, ref, child) {
                final authProv = ref.watch(authProvider);
                return Visibility(
                    visible: authProv.loginView == false,
                    child: const PasswordInformation());
              }),
              SizedBox(
                height: context.screenHeight * 0.1,
              ),
              Center(
                child: Consumer(builder: (context, ref, child) {
                  final authProv = ref.watch(authProvider);
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildPrimaryButton(authProv, context),
                      Visibility(
                          visible: authProv.loading == true,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                              height: 14,
                              width: 14,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  MyAppColors.blue,
                                ),
                                color: MyAppColors.blue,
                              ),
                            ),
                          ))
                    ],
                  );
                }),
              ),
            ]),
      ),
    );
  }

  PrimaryButton buildPrimaryButton(
      AuthProvider authProv, BuildContext context) {
    return PrimaryButton(
      buttonTitle: authProv.loginView ? "Sign in" : "Register",
      color: context.colorScheme.primary,
      onTap: authProv.loginView
          ? () async {
              AuthRepository.loginUser(
                      email: authProv.emailAddress.text,
                      password: authProv.password.text,
                      context: context,
                      authProv: authProv)
                  .then((value) {
                if (value?.status == "200" || value?.status == "201") {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      NamedRoutes.myHomePage, (Route<dynamic> route) => false);
                }
              });
            }
          : () async {
              AuthRepository.registerUser(
                email: authProv.emailAddress.text,
                password: authProv.password.text,
                context: context,
                authProv: authProv,
              ).then(
                (value) {
                  if (value?.status == "200" || value?.status == "201") {
                    Navigator.pushNamed(
                        context, NamedRoutes.verifyRegistration);
                  } else {
                    context.scaffoldMessenger.showSnackBar(const SnackBar(
                      content:
                          Text('Opps! Something went wrong, please try again'),
                    ));
                  }
                },
              );
            },
    );
  }
}
