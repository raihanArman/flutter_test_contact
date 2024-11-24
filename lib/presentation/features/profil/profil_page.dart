import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/app_bar_menu.dart';
import 'package:flutter_test_contact/presentation/widgets/avatar_contact.dart';
import 'package:flutter_test_contact/presentation/widgets/bc_default.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenu(
        title: "My Profile",
        suffix: InkWell(
          onTap: () {},
          child: Text(
            "Logout",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: black,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            AvatarContact(
              name: "Andi Raihan",
              size: 100,
              fontSize: 40,
            ),
            verticalSpace(24),
            Text(
              "Andi Raihan",
              style: grey2TextStyle.copyWith(fontSize: 15),
            ),
            verticalSpace(10),
            Text(
              "andiraihanarman8@gmail.com",
              style: grey2TextStyle.copyWith(fontSize: 15),
            ),
            verticalSpace(10),
            Text(
              "27/98/2000",
              style: grey2TextStyle.copyWith(fontSize: 15),
            ),
            verticalSpace(24),
            BcDefault(
              titleButton: "Update my detail",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
