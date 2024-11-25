import 'package:flutter_test_contact/repository/models/contact_model.dart';

abstract class ContactRepositoryInterface {
  Future<void> addContact(ContactModel contact);
  Future<void> addContacts(List<ContactModel> contact);
  Future<void> updateContact(ContactModel contact);
  Future<void> removeContact(String id);
  Future<List<ContactModel>> fetchAllContacts();
  Future<bool> hasContacts();
  Future<ContactModel?> getByUserId(String userId);
}
