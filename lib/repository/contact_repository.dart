import 'dart:developer';

import 'package:flutter_test_contact/libraries/database/database_manager_interface.dart';
import 'package:flutter_test_contact/repository/contact_repository_interface.dart';
import 'package:flutter_test_contact/repository/models/contact_model.dart';

class ContactRepository extends ContactRepositoryInterface {
  final DatabaseManagerInterface databaseManager;

  ContactRepository({required this.databaseManager});

  @override
  Future<void> addContact(ContactModel contact) async {
    try {
      await databaseManager.createContact(contact.toEntity());
    } catch (e) {
      throw Exception('Failed to add contact: $e');
    }
  }

  @override
  Future<void> updateContact(ContactModel contact) async {
    try {
      await databaseManager.updateContact(contact.toEntity());
    } catch (e) {
      throw Exception('Failed to update contact: $e');
    }
  }

  @override
  Future<void> removeContact(String id) async {
    try {
      await databaseManager.deleteContact(id);
    } catch (e) {
      throw Exception('Failed to remove contact: $e');
    }
  }

  @override
  Future<List<ContactModel>> fetchAllContacts() async {
    try {
      final entities = await databaseManager.getListContact();

      log("Ampas kuda -> fetchAllContacts $entities");
      return entities.map((entity) => ContactModel.fromEntity(entity)).toList();
    } catch (e) {
      throw Exception('Failed to fetch contacts: $e');
    }
  }

  @override
  Future<void> addContacts(List<ContactModel> contact) async {
    try {
      await databaseManager
          .createContacts(contact.map((e) => e.toEntity()).toList());
    } catch (e) {
      throw Exception('Failed to add contact: $e');
    }
  }

  @override
  Future<bool> hasContacts() async {
    return databaseManager.hasContacts();
  }

  @override
  Future<ContactModel?> getByUserId(String userId) async {
    final data = await databaseManager.getByUserId(userId);
    if (data != null) {
      return ContactModel.fromEntity(data);
    } else {
      return null;
    }
  }
}
