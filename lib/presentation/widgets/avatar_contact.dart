import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/avatar_default.dart';
import 'package:flutter_test_contact/utils/string_util.dart';

class AvatarContact extends StatelessWidget {
  final String name;
  final double size;
  final double fontSize;
  const AvatarContact({
    super.key,
    this.size = 47,
    this.fontSize = 20,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AvatarDefault(
      size: size,
      widget: Center(
        child: Text(
          getInitials(name),
          style: whiteTextStyle.copyWith(fontSize: fontSize, fontWeight: light),
        ),
      ),
    );
  }
}
