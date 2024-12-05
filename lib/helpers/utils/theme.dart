import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalThemeData {
  //Brand Colors
  static const Color primaryBlue = Color(0xFF3843FF);
  static const Color primaryGreen = Color(0xFF8A24FF);
  static const Color lightPurple = Color(0xFFA150FF);
  static const Color lightGreen = Color(0xFF4CC75A);
  static const Color darkGray = Color(0xFF333333);
  static const Color lightGray = Color(0xFFE0E0E0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFEAECF0);
  static const linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF000DFF),
      Color(0xFF6445FF),
      
    ],
  );

  static ThemeData themeData(
      ColorScheme colorScheme, Color focusColor, TextTheme textTheme) {
    return ThemeData(
        colorScheme: colorScheme,
        fontFamily: 'Roboto',
        focusColor: focusColor,
        canvasColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.surface,
        textTheme: textTheme,
        highlightColor: Colors.transparent);
  }

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor, textTheme);
  static ThemeData darkThemeData =
      themeData(darkColorScheme, _darkFocusColor, textTheme);

  static final textTheme = TextTheme(
      bodySmall: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      bodyMedium: GoogleFonts.roboto(
          fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
      bodyLarge: GoogleFonts.roboto(
          fontSize: 21, fontWeight: FontWeight.w700, color: Colors.black));

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primaryBlue,
    onPrimary: white,
    secondary: primaryGreen,
    onSecondary: white,
    error: Colors.redAccent,
    onError: white,
    surface: backgroundColor,
    onSurface: darkGray,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: lightPurple,
    onPrimary: white,
    secondary: lightGreen,
    onSecondary: darkGray,
    error: Colors.redAccent,
    onError: white,
    surface: Color(0xFF4A4A4A),
    onSurface: white,
    brightness: Brightness.dark,
  );
}
