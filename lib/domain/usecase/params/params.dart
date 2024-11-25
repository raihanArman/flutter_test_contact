import 'package:flutter_test_contact/domain/models/contact.dart';

class CreateContactParams {
  final Contact contact;

  CreateContactParams({required this.contact});
}

class UpdateContactParams {
  final Contact contact;

  UpdateContactParams({required this.contact});
}

class DeleteContactParams {
  final String contactId;

  DeleteContactParams({required this.contactId});
}

class CreateContactsParams {
  final List<Contact> contacts;

  CreateContactsParams({required this.contacts});
}

class NoParams {}
