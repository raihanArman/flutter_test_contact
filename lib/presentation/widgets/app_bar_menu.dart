import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';
import 'package:flutter_test_contact/utils/svg_util.dart';

class AppBarMenu extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? suffix;
  final Function()? onBack;
  const AppBarMenu({
    super.key,
    required this.title,
    this.suffix,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            onBack != null
                ? Row(
                    children: [
                      InkWell(
                        onTap: onBack!,
                        child: buildSvgIcon("back.svg"),
                      ),
                      horizontalSpace(16),
                    ],
                  )
                : const SizedBox(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Spacer(),
            if (suffix != null) suffix!
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
