import 'dart:ui';

// ignore: implementation_imports
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_test_contact/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle primaryTextStyle = GoogleFonts.poppins(color: colorPrimary);

TextStyle blackTextStyle = GoogleFonts.poppins(color: colorBlack);

TextStyle whiteTextStyle = GoogleFonts.poppins(color: colorWhite);

TextStyle greyTextStyle = GoogleFonts.poppins(color: colorTextGrey);
TextStyle grey2TextStyle =
    GoogleFonts.poppins(color: colorBlack.withOpacity(0.59));

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extrabold = FontWeight.w800;
FontWeight black = FontWeight.w900;
