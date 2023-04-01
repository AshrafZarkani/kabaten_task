import 'package:kabaten_task/modules/auth/controller/controller.dart';
import 'package:kabaten_task/modules/auth/enums/enums.dart';

class TogglePasswordField {
  TogglePasswordField(
      {required this.flag, required this.myRegistrationProvider});

  final RegistrationEnums flag;
  final AuthProvider myRegistrationProvider;

  toggleObscure() {
    switch (flag) {
      case RegistrationEnums.password:
        return myRegistrationProvider.passwordVisibility ? false : true;
      default:
        return false;
    }
  }
}
