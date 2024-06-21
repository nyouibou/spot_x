// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spot_x/core/constants/color.dart';

class MytextStyle {
  static TextStyle ArtistName = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle AppName = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle Artistplay = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: Colors.red,
  );
  static TextStyle TitleName = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle MusicName = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle AlbumName = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle Title1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 26.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle customWhiteHeadings = GoogleFonts.patuaOne(
      textStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: ColorConstants.customWhite));
  static TextStyle customWhiteHeadings1 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: ColorConstants.customWhite1));

  static TextStyle customWhiteHeadings2 = GoogleFonts.ebGaramond(
      textStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: ColorConstants.customWhite));

  static TextStyle customWhiteHeadings3 = GoogleFonts.nunitoSans(
      textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: ColorConstants.customWhite));
}
