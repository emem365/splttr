import 'package:string_validator/string_validator.dart' as st_validator;

class Validators {
  static final userNameRegExp = RegExp(r'^[A-Za-z0-9_.-]+$');
  static final nameRegExp = RegExp(r'^[A-Za-z ]+$');

  static String validateUserName(String value) {
    if (value.isEmpty) {
      return 'Please enter a username';
    }
    if (!userNameRegExp.hasMatch(value)) {
      return 'Only Alphanumerics, underscore or period, allowed';
    }
    if (value[0] == value[0].toUpperCase()) {
      return 'First letter should not be uppercase in username';
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be greater than 8 alphabets';
    }
    return null;
  }

  static String validateFirstName(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid name';
    }
    if (!nameRegExp.hasMatch(value)) {
      return 'Only Alphabets allowed in name';
    }
    return null;
  }

  static String validateLastName(String value) {
    if (value.isEmpty) {
      return null;
    }
    if (!nameRegExp.hasMatch(value)) {
      return 'Only Alphabets allowed in name';
    }
    return null;
  }

  static String validateEmail(String value){
    if (value.isEmpty) {
      return 'Please enter an email address';
    }
    if (st_validator.isEmail(value)) {
      return 'Enter a valid email address';
    }
    if(value.split('@').length!=2){
      return 'Enter a valid email address';
    }
    return null;
  }

  static String validateDate(String value){
    if (value.isEmpty) {
      return 'Please enter a date';
    }
    return null;
  }
}
