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

class UpdateContactField extends ContactDetailEvent {
  final String fieldName;
  final String fieldValue;

  UpdateContactField({required this.fieldName, required this.fieldValue});
}

class SubmitContactForm extends ContactDetailEvent {
  final Contact? contact;

  SubmitContactForm({this.contact});
}
