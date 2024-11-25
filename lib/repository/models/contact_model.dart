import 'package:flutter_test_contact/libraries/database/entity/contact_entity.dart';

class ContactModel {
  final String id;
  final String firstName;
  final String lastName;
  final String? email;
  final String? dob;

  ContactModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.dob,
  });

  factory ContactModel.fromEntity(ContactEntity entity) {
    return ContactModel(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      dob: entity.dob,
    );
  }
  ContactEntity toEntity() {
    return ContactEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      dob: dob,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'dob': dob,
    };
  }
}
