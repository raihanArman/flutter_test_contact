import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/bc_default.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';
import 'package:flutter_test_contact/presentation/widgets/tf_default_title.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController login = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi There!",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            Text(
              "Please login to see your contact list",
              style: greyTextStyle.copyWith(fontSize: 16),
            ),
            verticalSpace(20),
            TFDefaultTitle(
              formController: login,
              hintText: "09128282822",
              textInputType: TextInputType.number,
              prefixIcon: "contact.svg",
              isMandatory: true,
              title: "User ID",
            ),
            verticalSpace(20),
            BcDefault(
              titleButton: "Login",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
