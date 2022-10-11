import 'package:flutter/material.dart';

class UserManager extends ChangeNotifier {
  String userName = '';
  String userEmail = '';
  String userNumber = '';
  String userPassword = '';

  // ignore: non_constant_identifier_names
  void UserManagerRegister(String usernameText, String emailText,
      String numberText, String passwordText) {
    userName = usernameText;
    userEmail = emailText;
    userNumber = numberText;
    userPassword = passwordText;
    notifyListeners();
  }
}
