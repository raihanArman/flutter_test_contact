import 'package:flutter/material.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/app_bar_menu.dart';
import 'package:flutter_test_contact/presentation/widgets/avatar_contact.dart';
import 'package:flutter_test_contact/presentation/widgets/bc_default.dart';
import 'package:flutter_test_contact/presentation/widgets/bc_outline.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';
import 'package:flutter_test_contact/presentation/widgets/tf_default_title.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    return Scaffold(
      appBar: AppBarMenu(title: "Contact Details"),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(30),
                AvatarContact(
                  name: "Andi Raihan",
                  size: 100,
                  fontSize: 40,
                ),
                verticalSpace(30),
                InformationDivider(title: "Main Information"),
                TFDefaultTitle(
                  title: "First Name",
                  hintText: "Enter first name",
                  formController: firstName,
                  prefixIcon: "contact.svg",
                  isMandatory: true,
                ),
                verticalSpace(16),
                TFDefaultTitle(
                  title: "Last Name",
                  hintText: "Enter last name",
                  formController: firstName,
                  prefixIcon: "contact.svg",
                  isMandatory: true,
                ),
                verticalSpace(36),
                InformationDivider(title: "Sub Information"),
                TFDefaultTitle(
                  title: "Email",
                  hintText: "Enter email",
                  formController: firstName,
                  prefixIcon: "email.svg",
                ),
                TFDefaultTitle(
                  title: "Date of Birth",
                  hintText: "Enter birthday",
                  formController: firstName,
                  prefixIcon: "date.svg",
                ),
                verticalSpace(30),
                BcDefault(
                  titleButton: "Save",
                  onTap: () {},
                ),
                verticalSpace(16),
                BcOutline(
                  titleButton: "Remove",
                  borderColor: colorRed,
                  onTap: () {},
                ),
                verticalSpace(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InformationDivider extends StatelessWidget {
  final String title;
  const InformationDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryItalicTextStyle.copyWith(fontSize: 15),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 0.5,
          color: colorDarkGrey,
        ),
      ],
    );
  }
}
