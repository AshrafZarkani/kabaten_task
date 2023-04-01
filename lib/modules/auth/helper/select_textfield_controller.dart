import 'package:flutter/material.dart';
import 'package:kabaten_task/modules/auth/controller/controller.dart';
import 'package:kabaten_task/modules/auth/enums/enums.dart';

class SelectTheFieldControllerBasedOnFlagPassed {
  SelectTheFieldControllerBasedOnFlagPassed(
      {required this.flag, required this.authProvider});

  final RegistrationEnums flag;
  final AuthProvider authProvider;

  TextEditingController? value() {
    switch (flag) {
      case RegistrationEnums.emailAddress:
        return authProvider.emailAddress;
      case RegistrationEnums.password:
        return authProvider.password;
      default:
        return null;
    }
  }
}
