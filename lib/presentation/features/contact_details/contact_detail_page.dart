import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_contact/domain/models/contact.dart';
import 'package:flutter_test_contact/domain/usecase/create_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/delete_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/update_contact_usecase.dart';
import 'package:flutter_test_contact/presentation/features/contact_details/state/contact_details_bloc.dart';
import 'package:flutter_test_contact/presentation/features/contact_details/state/contact_details_event.dart';
import 'package:flutter_test_contact/presentation/features/contact_details/state/contact_details_state.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/app_bar_menu.dart';
import 'package:flutter_test_contact/presentation/widgets/avatar_contact.dart';
import 'package:flutter_test_contact/presentation/widgets/avatar_icon.dart';
import 'package:flutter_test_contact/presentation/widgets/bc_default.dart';
import 'package:flutter_test_contact/presentation/widgets/bc_outline.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';
import 'package:flutter_test_contact/presentation/widgets/tf_default_title.dart';
import 'package:flutter_test_contact/utils/string_util.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ContactDetailPage extends StatelessWidget {
  final Contact? contact;
  const ContactDetailPage({
    super.key,
    this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactDetailBloc(
        createContactUseCase: GetIt.instance<CreateContactUseCase>(),
        updateContactUseCase: GetIt.instance<UpdateContactUseCase>(),
        deleteContactUseCase: GetIt.instance<DeleteContactUseCase>(),
      ),
      child: BlocListener<ContactDetailBloc, ContactDetailState>(
        listener: (context, state) {
          if (state is ContactDetailSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.pop(context, true);
          } else if (state is ContactDetailError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: ContactDetailsBody(
          contact: contact,
        ),
      ),
    );
  }
}

class ContactDetailsBody extends StatelessWidget {
  final Contact? contact;
  const ContactDetailsBody({super.key, this.contact});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController dobController = TextEditingController();

    firstNameController.text = contact?.firstName ?? "";
    lastNameController.text = contact?.lastName ?? "";
    emailController.text = contact?.email ?? "";
    dobController.text = contact?.dob ?? "";

    return Scaffold(
      appBar: AppBarMenu(
        title: "Contact Details",
        onBack: () {
          Navigator.pop(context, true);
        },
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(30),
                contact != null
                    ? AvatarContact(
                        name: contact!.fullname(),
                        size: 100,
                        fontSize: 40,
                      )
                    : const AvatarIcon(icon: "contact.svg"),
                verticalSpace(30),
                const InformationDivider(title: "Main Information"),
                TFDefaultTitle(
                  title: "First Name",
                  hintText: "Enter first name",
                  formController: firstNameController,
                  prefixIcon: "contact.svg",
                  isMandatory: true,
                ),
                verticalSpace(16),
                TFDefaultTitle(
                  title: "Last Name",
                  hintText: "Enter last name",
                  formController: lastNameController,
                  prefixIcon: "contact.svg",
                  isMandatory: true,
                ),
                verticalSpace(36),
                const InformationDivider(title: "Sub Information"),
                TFDefaultTitle(
                  title: "Email",
                  hintText: "Enter email",
                  formController: emailController,
                  prefixIcon: "email.svg",
                ),
                verticalSpace(16),
                InkWell(
                  onTap: () async {
                    log("Ampas kuda -> onTap dob");
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: contact?.dob != null
                          ? DateFormat('dd/MM/yyyy')
                              .parse(contact!.dob!) // Menggunakan dob jika ada
                          : DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (selectedDate != null) {
                      // Format tanggal dan atur ke controller
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                      dobController.text = formattedDate;
                    }
                  },
                  child: IgnorePointer(
                    child: TFDefaultTitle(
                      title: "Date of Birth",
                      hintText: "Enter birthday",
                      formController: dobController,
                      prefixIcon: "date.svg",
                      isReadOnly: true,
                    ),
                  ),
                ),
                verticalSpace(30),
                BcDefault(
                  titleButton: contact != null ? "Update" : "Save",
                  onTap: () {
                    final contactToSave = Contact(
                      id: contact?.id ?? randomString(10),
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      dob: dobController.text,
                    );

                    if (contact != null) {
                      context.read<ContactDetailBloc>().add(
                            UpdateContact(contactToSave),
                          );
                    } else {
                      context.read<ContactDetailBloc>().add(
                            CreateContact(contactToSave),
                          );
                    }
                  },
                ),
                verticalSpace(16),
                contact != null
                    ? BcOutline(
                        titleButton: "Remove",
                        borderColor: colorRed,
                        onTap: () {
                          context.read<ContactDetailBloc>().add(
                                DeleteContact(contact!.id),
                              );
                        },
                      )
                    : const SizedBox(),
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
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 0.5,
          color: colorDarkGrey,
        ),
      ],
    );
  }
}
