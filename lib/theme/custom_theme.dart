import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final _primaryColor = Colors.blue[900];

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: _primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: _primaryColor,
          elevation: 2,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          titleTextStyle: GoogleFonts.lato(fontSize: 22, color: Colors.white)),
      textTheme: GoogleFonts.latoTextTheme(),
      buttonTheme: ButtonThemeData(
          buttonColor: _primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          height: 40,
          textTheme: ButtonTextTheme.accent));
}
