bool _isContentTitleLegit(String? input) {
  if (input == null) {
    return false;
  } else {
    return input.length > 3 && input.length < 100;
  }
}

String? contentTitleErrorText(String? input) {
  final bool shouldShowErrorText = !_isContentTitleLegit(input);
  if (shouldShowErrorText) {
    return "Ungueltiger Content Titel";
  } else {
    return null;
  }
}

bool _isContentDescriptionLegit(String? input) {
  if (input == null) {
    return false;
  } else {
    return input.length > 10 && input.length < 6000;
  }
}

String? contentDescriptionErrorText(String? input) {
  final bool shouldShowErrorText = !_isContentDescriptionLegit(input);
  if (shouldShowErrorText) {
    return "Ungueltiger Content Description";
  } else {
    return null;
  }
}

bool _isContentCodeSampleLegit(String? input) {
  return true;
}

String? contentCodeSampleErrorText(String? input) {
  final bool shouldShowErrorText = !_isContentCodeSampleLegit(input);
  if (shouldShowErrorText) {
    return "Ungueltiges Code Sample";
  } else {
    return null;
  }
}
