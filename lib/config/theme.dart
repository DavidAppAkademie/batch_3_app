import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData _getThemeData({required bool isDarkMode}) {
  if (isDarkMode) {
    return FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xff163462),
        primaryContainer: Color(0xffa6cced),
        secondary: Color(0xfffeb716),
        secondaryContainer: Color(0xffffdbcd),
        tertiary: Color(0xff7cc8f8),
        tertiaryContainer: Color(0xffc5e7ff),
        appBarColor: Color(0xffffdbcd),
        error: Color(0xffb00020),
      ).defaultError.toDark(10, false),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        fabSchemeColor: SchemeColor.secondary,
        filledButtonSchemeColor: SchemeColor.secondary,
        elevatedButtonSecondarySchemeColor: SchemeColor.secondary,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      fontFamily: GoogleFonts.abel().fontFamily,
    );
  } else {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xff163462),
        primaryContainer: Color(0xffa6cced),
        secondary: Color(0xfffeb716),
        secondaryContainer: Color(0xffffdbcd),
        tertiary: Color(0xff7cc8f8),
        tertiaryContainer: Color(0xffc5e7ff),
        appBarColor: Color(0xffffdbcd),
        error: Color(0xffb00020),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        fabSchemeColor: SchemeColor.secondary,
        filledButtonSchemeColor: SchemeColor.secondary,
        elevatedButtonSecondarySchemeColor: SchemeColor.secondary,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      fontFamily: GoogleFonts.abel().fontFamily,
    );
  }
}

ThemeData getDarkTheme() {
  return _getThemeData(isDarkMode: true);
}

ThemeData getLightTheme() {
  return _getThemeData(isDarkMode: false);
}
