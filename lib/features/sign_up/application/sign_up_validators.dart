bool _isEmailLegit(String? input) {
  // RegExp exp = RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  // return exp.hasMatch(input ?? "");
  return true;
}

String? emailErrorText(String? input) {
  final bool shouldShowErrorText = !_isEmailLegit(input);
  if (shouldShowErrorText) {
    return "Ungueltige Email";
  } else {
    return null;
  }
}

bool _isPasswordLegit(String? input) {
  RegExp exp = RegExp(r'^(?=.*[A-Z]).{6,}$');
  return exp.hasMatch(input ?? "");
}

String? passwordErrorText(String? input) {
  final bool shouldShowErrorText = !_isPasswordLegit(input);
  if (shouldShowErrorText) {
    return "Ungueltiges Passwort";
  } else {
    return null;
  }
}
