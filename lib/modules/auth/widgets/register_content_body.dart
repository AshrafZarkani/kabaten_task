import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/extensions/build_context_x.dart';
import 'package:kabaten_task/modules/auth/enums/enums.dart';
import 'package:kabaten_task/modules/auth/provider/provider.dart';
import 'package:kabaten_task/modules/auth/widgets/widgets.dart';

class SignInSignUpScreenContentBody extends StatelessWidget {
  const SignInSignUpScreenContentBody({
    Key? key,
  }) : super(key: key);

  ///all the text fields in the registration / sign in screen
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyCustomTextFormField(
            headerText: "Email Address",
            hintText: "Enter Your Email Address",
            flag: RegistrationEnums.emailAddress,
            keyboardType: TextInputType.text,
          ),
          Consumer(builder: (context, ref, child) {
            final authProv = ref.watch(authProvider);
            return MyCustomTextFormField(
              headerText: "Password",
              hintText: "Enter Password",
              flag: RegistrationEnums.password,
              keyboardType: TextInputType.text,
              icon: authProv.passwordVisibility
                  ? IconButton(
                      icon: Icon(
                        Icons.visibility,
                        color: context.colorScheme.primary,
                        size: 20,
                      ),
                      onPressed: () {
                        authProv.togglePasswordVisibility();
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.visibility_off_outlined,
                        color: context.colorScheme.onSurface,
                        size: 20,
                      ),
                      onPressed: () {
                        authProv.togglePasswordVisibility();
                      },
                    ),
            );
          }),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
