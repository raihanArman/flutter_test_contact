import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_contact/domain/models/contact.dart';
import 'package:flutter_test_contact/domain/usecase/fetch_contact_usecase.dart';
import 'package:flutter_test_contact/presentation/features/contact_details/contact_detail_page.dart';
import 'package:flutter_test_contact/presentation/features/home/state/home_bloc.dart';
import 'package:flutter_test_contact/presentation/features/home/state/home_event.dart';
import 'package:flutter_test_contact/presentation/features/home/state/home_state.dart';
import 'package:flutter_test_contact/presentation/theme/color.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/app_bar_menu.dart';
import 'package:flutter_test_contact/presentation/widgets/avatar_contact.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';
import 'package:flutter_test_contact/presentation/widgets/tf_default.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return BlocProvider(
      create: (context) => HomeBloc(
        useCase: GetIt.instance<FetchContactsUseCase>(),
      )..add(FetchContacts()),
      child: Scaffold(
        appBar: const AppBarMenu(title: "My Contacts"),
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(16),
                TFDefault(
                  hintText: "Search your contact list",
                  formController: searchController,
                  suffixIcon: "search.svg",
                  onChanged: (value) {
                    log("Ampas kuda -> type -> $value");
                    context.read<HomeBloc>().add(SearchContacts(query: value));
                  },
                ),
                verticalSpace(16),
                Expanded(
                  child: _getStateWidget(state), // Handle different states
                ),
              ],
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ContactDetailPage(),
              ),
            );

            if (result == true) {
              context.read<HomeBloc>().add(FetchContacts());
            }
          },
          tooltip: 'Increment',
          backgroundColor: colorPrimary,
          child: const Icon(Icons.add),
        ), // This,
      ),
    );
  }

  Widget _getStateWidget(HomeState state) {
    if (state is HomeLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is HomeError) {
      return Center(child: Text('Error: ${state.message}'));
    } else if (state is HomeLoaded || state is HomeSearchResults) {
      final contacts = state is HomeSearchResults
          ? state.filteredContacts
          : (state as HomeLoaded).contacts;
      if (contacts.isNotEmpty) {
        return ContactListBody(contacts);
      } else {
        return Center(
            child: Text(
          "Data tidak ditemukan",
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ));
      }
    } else {
      return const SizedBox();
    }
  }

  // ignore: non_constant_identifier_names
  Widget ContactListBody(List<Contact> contacts) {
    final groupedContacts = <String, List<Contact>>{};
    for (var contact in contacts) {
      String firstLetter = contact.fullname()[0].toUpperCase();
      if (groupedContacts[firstLetter] == null) {
        groupedContacts[firstLetter] = [];
      }
      groupedContacts[firstLetter]?.add(contact);
    }

    final sortedKeys = groupedContacts.keys.toList()..sort();

    return ListView.builder(
      itemCount: sortedKeys.length,
      itemBuilder: (context, index) {
        String letter = sortedKeys[index];
        List<Contact> contactsInGroup = groupedContacts[letter]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              letter,
              style: primaryTextStyle.copyWith(fontSize: 15, fontWeight: bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              width: double.infinity,
              height: 1,
              color: colorDarkGrey,
            ),
            ...contactsInGroup.map((contact) {
              return ContactItem(
                contact: contact,
                onClick: (contact) async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ContactDetailPage(contact: contact),
                    ),
                  );

                  if (result == true) {
                    context.read<HomeBloc>().add(FetchContacts());
                  }
                },
              );
            }).toList(),
          ],
        );
      },
    );
  }
}

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function(Contact) onClick;
  const ContactItem({
    super.key,
    required this.contact,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(contact);
      },
      child: Column(
        children: [
          Row(
            children: [
              AvatarContact(name: contact.fullname()),
              horizontalSpace(10),
              Text(
                contact.fullname(),
                style: grey2TextStyle.copyWith(fontSize: 15),
              ),
              horizontalSpace(10),
              Text(
                "(You)",
                style: darkGreyTextStyle.copyWith(fontSize: 15),
              ),
            ],
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
