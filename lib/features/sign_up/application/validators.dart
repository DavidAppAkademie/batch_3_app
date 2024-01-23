bool _isEmailLegit(String? input) {
  if (input == null) {
    return false;
  }
  if (input.length < 6) {
    return false;
  }
  if (!input.contains('@')) {
    return false;
  }
  if (!input.contains('.')) {
    return false;
  }
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
  return input != null && input.length >= 6 && _hasUpperCase(input);
}

String? passwordErrorText(String? input) {
  final bool shouldShowErrorText = !_isPasswordLegit(input);
  if (shouldShowErrorText) {
    return "Ungueltiges Passwort";
  } else {
    return null;
  }
}

bool _hasUpperCase(String str) {
  return str != str.toLowerCase();
}
