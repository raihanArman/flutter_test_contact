import 'package:flutter_test_contact/domain/models/contact.dart';

abstract class ContactDetailEvent {}

class CreateContact extends ContactDetailEvent {
  final Contact contact;

  CreateContact(this.contact);
}

class UpdateContact extends ContactDetailEvent {
  final Contact contact;

  UpdateContact(this.contact);
}

class DeleteContact extends ContactDetailEvent {
  final String contactId;

  DeleteContact(this.contactId);
}
