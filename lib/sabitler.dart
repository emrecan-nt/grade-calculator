import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static String baslik = 'Ortalama Hesaplayıcı';
  static const MaterialColor anaRenk = Colors.teal;
  static final TextStyle baslikstyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );
  static BorderRadius borderRadius = BorderRadius.circular(24);
  static final TextStyle ortalamaGosterBodystyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );
  static final TextStyle ortalamastyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: anaRenk,
  );
  static final DropdownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final YatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
