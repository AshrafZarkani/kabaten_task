import 'package:flutter/material.dart';
import 'package:kabaten_task/modules/auth/controller/controller.dart';
import 'package:kabaten_task/modules/auth/enums/enums.dart';

class RegisterTextFieldChanges {
  RegisterTextFieldChanges(
      this.flag, this.myRegistrationProvider, this.value, this.context);

  final RegistrationEnums flag;
  final AuthProvider myRegistrationProvider;
  final String? value;
  final BuildContext context;

  onChange() {
    switch (flag) {
      case RegistrationEnums.emailAddress:
        return myRegistrationProvider.setEmailAddress(value);
      case RegistrationEnums.password:
        return myRegistrationProvider.setPassword(value, context);
      default:
        return null;
    }
  }
}
