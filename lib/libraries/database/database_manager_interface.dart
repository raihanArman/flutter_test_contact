import 'package:flutter_test_contact/libraries/database/entity/contact_entity.dart';

abstract class DatabaseManagerInterface {
  Future<void> createContact(ContactEntity contactEntity);
  Future<void> createContacts(List<ContactEntity> contacts);
  Future<void> updateContact(ContactEntity contactEntity);
  Future<void> deleteContact(String id);
  Future<List<ContactEntity>> getListContact();
  Future<bool> hasContacts();
  Future<ContactEntity?> getByUserId(String userId);
}
