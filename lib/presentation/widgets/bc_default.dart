import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';

class BcDefault extends StatelessWidget {
  final String titleButton;
  final bool showLoading;
  final Color backgroundColorButton;
  final Color colorText;
  final Color colorProgress;
  final double fontSize;
  final GestureTapCallback onTap;
  final bool isButtonActive;
  final Color? borderColor;
  const BcDefault({
    super.key,
    required this.titleButton,
    this.showLoading = false,
    this.backgroundColorButton = colorButtonPrimary,
    this.colorText = colorPrimary,
    this.colorProgress = Colors.white,
    this.fontSize = 16,
    required this.onTap,
    this.isButtonActive = true,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: isButtonActive
          ? backgroundColorButton
          : backgroundColorButton.withOpacity(0.4),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.grey.withOpacity(0.5),
        onTap: showLoading || !isButtonActive ? null : onTap,
        child: Container(
          height: 53,
          decoration: borderColor != null
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: borderColor!,
                    width: 2,
                  ))
              : null,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showLoading) ...[
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: colorProgress,
                    strokeWidth: 2,
                  ),
                ),
                const SizedBox(width: 15),
              ],
              Text(
                titleButton,
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: black,
                  color: colorText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
