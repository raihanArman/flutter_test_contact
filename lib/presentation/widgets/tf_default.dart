import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/utils/svg_util.dart';

class TFDefault extends StatefulWidget {
  final String hintText;
  final String? prefixIcon;
  final TextEditingController? formController;
  final TextInputType? textInputType;
  final String? suffixIcon;
  final bool isReadOnly;
  final Function(String) onChanged;

  const TFDefault({
    super.key,
    required this.hintText,
    this.formController,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isReadOnly = false,
    required this.onChanged,
  });

  @override
  State<TFDefault> createState() => _TFDefaultState();
}

class _TFDefaultState extends State<TFDefault> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      child: TextFormField(
        keyboardType: widget.textInputType,
        controller: widget.formController,
        cursorColor: colorPrimary,
        readOnly: widget.isReadOnly,
        focusNode: _focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          fillColor: colorWhite,
          hintText: widget.hintText,
          hintStyle: greyHintTextStyle.copyWith(fontSize: 14),
          enabledBorder: border(false),
          focusedBorder: border(true),
          prefixIcon: widget.prefixIcon != null
              ? Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: buildSvgIcon(
                    widget.prefixIcon!,
                    color: _isFocused ? colorPrimary : colorDarkGrey,
                  ),
                )
              : null,
          suffixIcon: widget.suffixIcon != null
              ? Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: buildSvgIcon(widget.suffixIcon!),
                )
              : null,
        ),
        onChanged: widget.onChanged,
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
