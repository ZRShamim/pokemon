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

  static TextStyle poppinsWhite = GoogleFonts.poppins(
    color: CustomColor.white,
  );

  static TextStyle poppins18WhiteBold = poppinsWhite.copyWith(
    fontSize: 18,
    fontWeight: _bold,
  );

  static TextStyle poppins16WhiteNormal = poppinsWhite.copyWith(
    fontSize: 16,
    fontWeight: _normal,
  );

  static TextStyle notoWhite = GoogleFonts.notoSans(
    color: CustomColor.white,
  );

  static TextStyle noto18WhiteNormal = notoWhite.copyWith(
    fontSize: 18,
    fontWeight: _normal,
  );

  static TextStyle noto14WhiteNormal = noto18WhiteNormal.copyWith(
    fontSize: 14,
    fontWeight: _normal,
  );

  static TextStyle noto20WhiteExtraBold = notoWhite.copyWith(
    fontSize: 20,
    fontWeight: _extraBold,
  );

  static TextStyle noto16WhiteBold = notoWhite.copyWith(
    fontSize: 16,
    fontWeight: _bold,
  );

  static TextStyle pokemonIndex = GoogleFonts.josefinSans(
    fontSize: 20,
    fontWeight: _thin,
    color: CustomColor.black,
  );

  static TextStyle pokemonName45 = GoogleFonts.doHyeon(
    fontSize: 45,
    fontWeight: _extraBold,
    color: CustomColor.black.withOpacity(0.5),
    letterSpacing: 5,
  );
}
