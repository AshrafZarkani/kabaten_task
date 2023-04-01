import 'package:flutter/material.dart';
import 'package:kabaten_task/modules/auth/enums/enums.dart';
import 'package:kabaten_task/modules/auth/widgets/widgets.dart';

class PasswordInformation extends StatelessWidget {
  const PasswordInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Password Must Be:",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
            const PasswordValidationRowTexts(
              flag: PasswordConfirmationFlags.eightOrMore,
              text: "Eight Or More Characters",
            ),
            const PasswordValidationRowTexts(
              flag: PasswordConfirmationFlags.aMixLeastLowerCase,
              text: "A Mix Of Lower And Upper Case",
            ),
            const PasswordValidationRowTexts(
              flag: PasswordConfirmationFlags.atLeastZeroToNine,
              text: "At Least One Number",
            ),
            const PasswordValidationRowTexts(
              flag: PasswordConfirmationFlags.specialCharacter,
              text: "Has Special Character",
            ),
          ],
        ),
      ),
    );
  }
}
