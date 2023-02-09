import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const appBarColor = Color.fromRGBO(86, 113, 137, 100);
  static const bgColor = Color.fromRGBO(75, 88, 100, 0.965);
  static const secondColor = Color.fromRGBO(80, 255, 220, 0.612);
  static const thirdColor = Color.fromRGBO(255, 240, 220, 0.744);
  static TextStyle labelTextStyle(Color renk) {
    return GoogleFonts.quicksand(
        fontSize: 24, fontWeight: FontWeight.bold, color: renk);
  }

  static TextStyle titleTextStyle =
      GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle ortTextStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w700, color: thirdColor);
  static TextStyle dersTextStyle = GoogleFonts.quicksand(
      fontSize: 22, fontWeight: FontWeight.w900, color: thirdColor);
  static TextStyle ortalamaTextStyle = GoogleFonts.quicksand(
      fontSize: 22, fontWeight: FontWeight.w400, color: thirdColor);
}
