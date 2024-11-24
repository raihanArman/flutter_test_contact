import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/widgets/bc_default.dart';

class BcOutline extends StatelessWidget {
  final String titleButton;
  final bool showLoading;
  final GestureTapCallback onTap;
  final bool isButtonActive;
  final Color borderColor;
  const BcOutline({
    super.key,
    required this.titleButton,
    this.showLoading = false,
    required this.onTap,
    this.isButtonActive = true,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return BcDefault(
      titleButton: titleButton,
      showLoading: showLoading,
      backgroundColorButton: Colors.white,
      colorText: borderColor, // Outline text color
      colorProgress: borderColor, // Loading indicator color
      onTap: onTap,
      isButtonActive: isButtonActive,
      borderColor: borderColor,
    );
  }
}
