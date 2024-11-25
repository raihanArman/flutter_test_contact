import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/features/profil/profile_page.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/utils/svg_util.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.01),
      bottomNavigationBar: bottomNavigationBar(),
      body: ProfilePage(),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: colorPrimary,
      unselectedItemColor: colorDarkGrey,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        bottomNavigationBarItem("home.svg"),
        bottomNavigationBarItem("contact.svg")
      ],
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(String icon) {
    return BottomNavigationBarItem(
        icon: buildSvgIcon(icon, color: colorDarkGrey, width: 18, height: 18),
        activeIcon:
            buildSvgIcon(icon, color: colorPrimary, width: 18, height: 18),
        label: "");
  }
}
