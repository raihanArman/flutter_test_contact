import 'dart:developer';

import 'package:flutter_test_contact/libraries/database/database_manager_interface.dart';
import 'package:flutter_test_contact/libraries/database/entity/contact_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseManager extends DatabaseManagerInterface {
  final String boxName = 'contacts';

  Future<Box<ContactEntity>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<ContactEntity>(boxName);
    }
    return Hive.box<ContactEntity>(boxName);
  }

  @override
  Future<void> createContact(ContactEntity contactEntity) async {
    final box = await _openBox();
    await box.put(contactEntity.id, contactEntity);
  }

  @override
  Future<void> deleteContact(String id) async {
    final box = await _openBox();
    if (box.containsKey(id)) {
      await box.delete(id);
    } else {
      throw Exception('Contact with id $id not found');
    }
  }

  @override
  Future<List<ContactEntity>> getListContact() async {
    final box = await _openBox();
    return box.values.toList();
  }

  @override
  Future<void> updateContact(ContactEntity contactEntity) async {
    final box = await _openBox();
    if (box.containsKey(contactEntity.id)) {
      await box.put(contactEntity.id, contactEntity);
    } else {
      throw Exception('Contact with id ${contactEntity.id} not found');
    }
  }

  @override
  Future<void> createContacts(List<ContactEntity> contacts) async {
    var box = await _openBox();
    for (var contact in contacts) {
      log("Ampas kuda -> list ontact -> ${contact.firstName}");
      await box.put(contact.id, contact);
    }
  }

  @override
  Future<bool> hasContacts() async {
    var box = await _openBox();
    return box.isNotEmpty;
  }

  @override
  Future<ContactEntity?> getByUserId(String userId) async {
    try {
      final box = await _openBox();
      for (var contact in box.values) {
        if (contact.id == userId) {
          return contact;
        }
      }
      return null;
    } catch (e) {
      log("Error fetching contact by phone number: $e");
      rethrow;
    }
  }
}
