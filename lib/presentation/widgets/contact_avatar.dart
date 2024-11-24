import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/utils/string_util.dart';

class ContactAvatar extends StatelessWidget {
  final String name;
  const ContactAvatar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47,
      height: 47,
      decoration: BoxDecoration(
        color: colorPrimary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          getInitials(name),
          style: whiteTextStyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
