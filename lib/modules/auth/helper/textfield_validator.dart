import 'package:flutter/material.dart';
import 'package:kabaten_task/modules/auth/controller/controller.dart';
import 'package:kabaten_task/modules/auth/enums/enums.dart';

class RegisterTextFieldValidators {
  RegisterTextFieldValidators(
      this.flag, this.myRegistrationProvider, this.value, this.context);

  final RegistrationEnums flag;
  final AuthProvider myRegistrationProvider;
  final String? value;
  final BuildContext context;

  validatedRegistrationTextFields() {
    switch (flag) {
      case RegistrationEnums.emailAddress:
        return myRegistrationProvider.emailAddressValidation(value, context);

      case RegistrationEnums.password:
        return myRegistrationProvider.passwordValidation(value, context);

      default:
        return null;
    }
  }
}
