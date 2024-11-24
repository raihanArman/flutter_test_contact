import 'package:flutter/material.dart';

class AppBarMenu extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? suffix;
  const AppBarMenu({
    super.key,
    required this.title,
    this.suffix,
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
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            if (suffix != null) suffix!
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
