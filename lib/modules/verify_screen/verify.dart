import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/extensions/build_context_x.dart';
import 'package:kabaten_task/modules/widgets/primary_button.dart';

import '../auth/data/data.dart';
import '../auth/provider/provider.dart';

class VerifyRegistrationScreen extends StatefulWidget {
  const VerifyRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<VerifyRegistrationScreen> createState() =>
      _VerifyRegistrationScreenState();
}

class _VerifyRegistrationScreenState extends State<VerifyRegistrationScreen> {
  late TextEditingController verifyCode;

  @override
  void initState() {
    super.initState();
    verifyCode = TextEditingController();
  }

  @override
  void dispose() {
    verifyCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Code Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Please verify your account through the 6 digit code that was sent to your email",
              maxLines: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: verifyCode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Verify Code',
                hintText: 'Please enter Your code',
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.1,
            ),
            Consumer(builder: (context, ref, child) {
              final authProv = ref.watch(authProvider);
              return PrimaryButton(
                buttonTitle: "Verify",
                color: context.colorScheme.primary,
                onTap: () async {
                  RegisterModel? verifyResponse =
                      await AuthRepository.verifyToken(verifyCode.text, context,
                          authProv: authProv);
                  if (verifyResponse != null) {
                    if (mounted) {
                      Navigator.pushNamed(context, NamedRoutes.signInSignUp);
                      authProv.setLoginView();
                    }
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
