import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';
import 'package:flutter_test_contact/presentation/widgets/tf_default.dart';
import 'package:flutter_test_contact/utils/svg_util.dart';

class TFDefaultTitle extends StatelessWidget {
  final String title;
  final String hintText;
  final String? prefixIcon;
  final TextEditingController? formController;
  final TextInputType? textInputType;
  final bool isMandatory;
  final bool isReadOnly;
  final Function(String)? onChanged;

  const TFDefaultTitle({
    super.key,
    required this.title,
    required this.hintText,
    required this.formController,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.isMandatory = false,
    this.isReadOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            if (isMandatory) buildSvgIcon("mandatory.svg"),
          ],
        ),
        verticalSpace(10),
        TFDefault(
          textInputType: textInputType,
          formController: formController,
          hintText: hintText,
          prefixIcon: prefixIcon,
          isReadOnly: isReadOnly,
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
        ),
      ],
    );
  }
}
