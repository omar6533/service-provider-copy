import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle regular = TextStyle(
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    fontWeight: FontWeight.normal,
    color: Colors.black, // Default text color
  );
  static TextStyle semiBold = TextStyle(
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    fontWeight: FontWeight.w500,
    color: Colors.black, // Default text color
  );
  static TextStyle bold = TextStyle(
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    fontWeight: FontWeight.bold,
    color: Colors.black, // Default text color
  );
}
