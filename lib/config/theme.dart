import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData _getThemeData({required bool isDarkMode}) {
  TextTheme baseTextTheme =
      isDarkMode ? ThemeData.dark().textTheme : ThemeData.light().textTheme;
  TextTheme customTextTheme =
      baseTextTheme.apply(fontFamily: GoogleFonts.archivo().fontFamily);
  return ThemeData(
      colorScheme: _getColorScheme(
        isDarkMode: isDarkMode,
      ),
      textTheme: customTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(
                    vertical: Sizes.p16, horizontal: Sizes.p64),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.p8),
                // side: BorderSide(color: Colors.red)
              )),
              backgroundColor: MaterialStateProperty.all<Color>(batchYellow))));
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
