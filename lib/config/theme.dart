import 'package:batch_3_app/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData _getThemeData({required bool isDarkMode}) {
  TextTheme baseTextTheme =
      isDarkMode ? ThemeData.dark().textTheme : ThemeData.light().textTheme;
  TextTheme customTextTheme =
      baseTextTheme.apply(fontFamily: GoogleFonts.archivo().fontFamily);
  return ThemeData.from(
      colorScheme: _getColorScheme(
        isDarkMode: isDarkMode,
      ),
      textTheme: customTextTheme);
}

ThemeData getDarkTheme() {
  return _getThemeData(isDarkMode: true);
}

ThemeData getLightTheme() {
  return _getThemeData(isDarkMode: false);
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
