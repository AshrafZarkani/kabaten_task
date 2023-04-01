import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/extensions/build_context_x.dart';
import 'package:kabaten_task/modules/auth/provider/provider.dart';

class AlreadyHaveAnAccountText extends ConsumerWidget {
  const AlreadyHaveAnAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProv = ref.watch(authProvider);
    return Center(
      child: RichText(
        text: TextSpan(
            text: authProv.loginView
                ? 'Don`t have an account?'
                : 'Already have an account?',
            style: const TextStyle(color: MyAppColors.grey, fontSize: 12),
            children: <TextSpan>[
              TextSpan(
                  text: authProv.loginView ? " Register" : " Sign in",
                  style: TextStyle(
                      color: context.colorScheme.primary, fontSize: 16),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      authProv.setLoginView();
                      authProv.setLoading(false);
                    })
            ]),
      ),
    );
  }
}
