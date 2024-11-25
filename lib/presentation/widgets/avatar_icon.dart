import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/widgets/avatar_default.dart';
import 'package:flutter_test_contact/utils/svg_util.dart';

class AvatarIcon extends StatelessWidget {
  final String icon;
  final double size;
  final double fontSize;
  const AvatarIcon({
    super.key,
    this.size = 47,
    this.fontSize = 20,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AvatarDefault(
        size: size,
        widget: Center(
          child: buildSvgIcon(icon, width: 40, height: 40, color: Colors.white),
        ));
  }
}
