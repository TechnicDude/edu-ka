import 'package:flutter/material.dart';

class AppValidator {
  BuildContext? context;
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter email address";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.trim())) {
      return "please enter valid email address";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your password";
    } else if (value.length < 6) {
      return "password should be atleast 6 digit";
    }
    return null;
  }

  static String? confirm_passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter confirm password ";
    } else if (value.length < 5) {
      return "password must be the same";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your first name ";
    } else if (value.length < 3) {
      return "please enter at least 3 characters long";
    }
    return null;
  }

  static String? lastnameValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your last name";
    } else if (value.length < 3) {
      return "please enter at least 3 characters long";
    }
    return null;
  }

  static String? mobileValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter phone number ";
    } else if (value.length < 10) {
      return "enter a valid phone number";
    }
    return null;
  }

  static String? currentpasswordValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your current password";
    } else if (value.length < 5) {
      return "password must be the same";
    }
    return null;
  }

  static String? emptyValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter some text";
    }
    return null;
  }
}
