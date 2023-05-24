import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle title = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w200,
  fontStyle: FontStyle.italic ,
  fontFamily: GoogleFonts.roboto().fontFamily,
  color: Colors.white,
  backgroundColor: null

);

TextStyle subtitle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w200,
  color: Colors.white70,
  backgroundColor: null
);

TextStyle body = const TextStyle(
  fontSize: 14,
  color: Colors.white,
  backgroundColor: null
);

ButtonStyle mainButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
  textStyle: MaterialStateProperty.all<TextStyle>(
    TextStyle(fontSize: 24, fontWeight: FontWeight.w200, color: Colors.white),
  ),
  minimumSize: MaterialStateProperty.all<Size>(Size(120.0, 40.0)),
);