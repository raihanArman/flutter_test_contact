import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildSvgIcon(String assetName,
    {double? width, double? height, Color? color}) {
  return SvgPicture.asset(
    "assets/svgs/$assetName",
    width: width,
    height: height,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}
