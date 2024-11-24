import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/app_bar_menu.dart';
import 'package:flutter_test_contact/presentation/widgets/avatar_contact.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';
import 'package:flutter_test_contact/presentation/widgets/tf_default.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      appBar: AppBarMenu(title: "My Contacts"),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(16),
            TFDefault(
              hintText: "Search your contact list",
              formController: search,
              suffixIcon: "search.svg",
            ),
            verticalSpace(16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "A",
                        style: primaryTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        width: double.infinity,
                        height: 1,
                        color: colorDarkGrey,
                      ),
                      Row(
                        children: [
                          AvatarContact(name: "Andi Raihan"),
                          horizontalSpace(10),
                          Text(
                            "Andi Raihan",
                            style: grey2TextStyle.copyWith(fontSize: 15),
                          ),
                          horizontalSpace(10),
                          Text(
                            "(You)",
                            style: darkGreyTextStyle.copyWith(fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: colorPrimary,
      ), // This,
    );
  }
}
