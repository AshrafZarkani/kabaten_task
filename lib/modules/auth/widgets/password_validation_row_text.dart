import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/extensions/build_context_x.dart';
import 'package:kabaten_task/modules/auth/enums/enums.dart';
import 'package:kabaten_task/modules/auth/provider/provider.dart';

class PasswordValidationRowTexts extends StatelessWidget {
  const PasswordValidationRowTexts({
    Key? key,
    this.text,
    required this.flag,
  }) : super(key: key);

  final PasswordConfirmationFlags flag;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final myRegistrationProvider = ref.watch(authProvider);
      Color rowColor() {
        switch (flag) {
          case PasswordConfirmationFlags.eightOrMore:
            if (myRegistrationProvider.hasMoreThanEight) {
              return context.colorScheme.primary;
            } else {
              return MyAppColors.grey;
            }

          case PasswordConfirmationFlags.aMixLeastLowerCase:
            if (myRegistrationProvider.hasLowercase &&
                myRegistrationProvider.hasUppercase) {
              return context.colorScheme.primary;
            } else {
              return MyAppColors.grey;
            }
          case PasswordConfirmationFlags.atLeastZeroToNine:
            if (myRegistrationProvider.hasDigits) {
              return context.colorScheme.primary;
            } else {
              return MyAppColors.grey;
            }
          case PasswordConfirmationFlags.specialCharacter:
            if (myRegistrationProvider.hasSpecialCharacter) {
              return context.colorScheme.primary;
            } else {
              return MyAppColors.grey;
            }
        }
      }

      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: rowColor(),
            size: 18,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text ?? "",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: rowColor(), fontWeight: FontWeight.normal, fontSize: 12),
          ),
        ],
      );
    });
  }
}
