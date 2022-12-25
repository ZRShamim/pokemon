import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_api/components/colors/custom_color.dart';

class CustomStyles {
  static const FontWeight _bold = FontWeight.w500;
  static const FontWeight _extraBold = FontWeight.w700;
  static const FontWeight _semiBold = FontWeight.w400;
  static const FontWeight _normal = FontWeight.w300;
  static const FontWeight _thin = FontWeight.w200;

  static TextStyle pokemonName = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: _bold,

    // color: ,
  );

  static TextStyle pokemonIndex = GoogleFonts.josefinSans(
    fontSize: 20,
    fontWeight: _thin,
    color: CustomColor.black,
  );
}
