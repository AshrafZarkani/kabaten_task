import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController _emailAddress = TextEditingController(text: "");
  final TextEditingController _password = TextEditingController(text: "");
  bool _hasMoreThanEight = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasDigits = false;
  bool _hasSpecialCharacter = false;
  bool _passwordVisibility = false;
  bool _loginView = true;
  bool _loading = false;

  TextEditingController get emailAddress => _emailAddress;
  TextEditingController get password => _password;
  bool get hasMoreThanEight => _hasMoreThanEight;
  bool get hasUppercase => _hasUppercase;
  bool get hasLowercase => _hasLowercase;
  bool get hasDigits => _hasDigits;
  bool get hasSpecialCharacter => _hasSpecialCharacter;
  bool get passwordVisibility => _passwordVisibility;
  bool get loginView => _loginView;
  bool get loading => _loading;

  void setLoginView() {
    _loginView = !_loginView;
    notifyListeners();
  }

  setEmailAddress(String? val) {
    _emailAddress.text = val?.trim() ?? "";
    _emailAddress.selection =
        TextSelection.collapsed(offset: _emailAddress.text.length);
  }

  setPassword(String? val, BuildContext context) {
    _password.text = val ?? "";
    _password.selection =
        TextSelection.collapsed(offset: _password.text.length);

    passwordValidation(val, context);
  }

  togglePasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  emailAddressValidation(
    String? value,
    BuildContext context,
  ) {
    if (value!.isEmpty) {
      return "Please Enter Valid Email";
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return 'Please a valid Email';
    }

    return null;
  }

  passwordValidation(String? value, BuildContext context) {
    if (value!.isEmpty) {
      _hasMoreThanEight = false;
      _hasUppercase = false;
      _hasLowercase = false;
      _hasDigits = false;
      notifyListeners();
      return "Please Enter Valid Password";
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      _hasDigits = true;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      _hasDigits = false;
    }

    if (value.contains(RegExp(r'[A-Z]')) && value.contains(RegExp(r'[a-z]'))) {
      _hasUppercase = true;
      _hasLowercase = true;
    } else if (!value.contains(RegExp(r'[A-Z]')) &&
        value.contains(RegExp(r'[a-z]'))) {
      _hasUppercase = false;
    }

    if (value.contains(RegExp(r'(?=.*?[!@#\$&*~])'))) {
      _hasSpecialCharacter = true;
    } else {
      _hasSpecialCharacter = false;
    }

    if (value.length >= 8) {
      _hasMoreThanEight = true;
    } else if (value.length <= 7) {
      _hasMoreThanEight = false;
      notifyListeners();
      return "At Least Eight Characters";
    }

    notifyListeners();
  }

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }
}
