import 'package:batch_3_app/config/palette.dart';
import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData.from(colorScheme: _getColorScheme(isDarkMode: true));
}

ThemeData getLightTheme() {
  return ThemeData.from(colorScheme: _getColorScheme(isDarkMode: false));
}

ColorScheme _getColorScheme({required bool isDarkMode}) {
  return ColorScheme.fromSeed(
    seedColor: batchBlue,
    primary: batchBlue,
    secondary: batchYellow,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    background: isDarkMode ? batchBackgroundBlue : batchBackgroundLightGrey,
  );
}
