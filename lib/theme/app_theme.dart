import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  textTheme: TextTheme(
    bodyText2: textStyle,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.blueAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    titleTextStyle: textStyle,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: textStyle.copyWith(
        fontSize: 20,
      ),
    ),
  ),
);

final textStyle = TextStyle(
  fontFamily: GoogleFonts.bubblegumSans().fontFamily,
  fontSize: 20,
  color: Colors.white,
);
