import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_contact/presentation/features/dashboard/state/dashboard_bloc.dart';
import 'package:flutter_test_contact/presentation/features/dashboard/state/dashboard_event.dart';
import 'package:flutter_test_contact/presentation/features/dashboard/state/dashboard_state.dart';
import 'package:flutter_test_contact/presentation/features/home/home_page.dart';
import 'package:flutter_test_contact/presentation/features/profil/profile_page.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/utils/svg_util.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc(),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.01),
        bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: colorPrimary,
              unselectedItemColor: colorDarkGrey,
              currentIndex: state.index,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              onTap: (index) {
                context.read<DashboardBloc>().add(DashboardIndexChanged(index));
              },
              items: [
                bottomNavigationBarItem("home.svg"),
                bottomNavigationBarItem("contact.svg"),
              ],
            );
          },
        ),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.index,
              children: const [
                HomePage(key: PageStorageKey('HomePage')),
                ProfilePage(key: PageStorageKey('ProfilePage')),
              ],
            );
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(String icon) {
    return BottomNavigationBarItem(
      icon: buildSvgIcon(icon, color: colorDarkGrey, width: 18, height: 18),
      activeIcon:
          buildSvgIcon(icon, color: colorPrimary, width: 18, height: 18),
      label: "",
    );
  }
}
