import 'package:get/get.dart';

validateInput(
  String? value,
  int min,
  int max,
  String type,
) {
  if (type == 'username') {
    if (!GetUtils.isUsername(value!)) {
      return 'Not valid username';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(value!)) {
      return 'Not valid email';
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(value!)) {
      return 'Not valid phone';
    }
  }
  if (value!.isEmpty) {
    return 'Feild can\'t be empty';
  }
  if (value.length < min) {
    return 'Feild can\'t be less than $min';
  }
  if (value.length > max) {
    return 'Feild can\'t be more than $max';
  }
}
