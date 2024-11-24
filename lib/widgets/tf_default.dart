import 'package:flutter/material.dart';
import 'package:flutter_test_contact/theme/color.dart';
import 'package:flutter_test_contact/theme/text.dart';
import 'package:flutter_test_contact/utils/svg_util.dart';

class TFDefault extends StatelessWidget {
  final String hintText;
  final String? prefixIcon;
  final TextEditingController formController;
  final TextInputType? textInputType;

  const TFDefault({
    super.key,
    required this.hintText,
    required this.formController,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
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
          contentPadding: EdgeInsets.zero,
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
