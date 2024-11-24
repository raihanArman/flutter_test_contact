import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';

class AvatarDefault extends StatelessWidget {
  final Widget widget;
  final double size;
  const AvatarDefault({
    super.key,
    required this.size,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorPrimary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: widget,
    );
  }
}
