import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/utils/svg_util.dart';

class TFDefault extends StatelessWidget {
  final String hintText;
  final String? prefixIcon;
  final TextEditingController formController;
  final TextInputType? textInputType;
  final String? suffixIcon;

  const TFDefault({
    super.key,
    required this.hintText,
    required this.formController,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      child: TextFormField(
        keyboardType: textInputType,
        controller: formController,
        cursorColor: colorPrimary,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          fillColor: colorWhite,
          hintText: hintText,
          hintStyle: greyHintTextStyle.copyWith(fontSize: 14),
          enabledBorder: border(false),
          focusedBorder: border(true),
          prefixIcon: prefixIcon != null
              ? Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: buildSvgIcon(prefixIcon!))
              : null,
          suffixIcon: suffixIcon != null
              ? Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: buildSvgIcon(suffixIcon!))
              : null,
        ),
      ),
    );
  }

  OutlineInputBorder border(bool isActived) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: isActived ? colorPrimary : colorDarkGrey,
      ),
    );
  }
}
