import 'package:flutter_test_contact/repository/models/contact_model.dart';

class Contact {
  final String id;
  final String firstName;
  final String lastName;
  String? email;
  String? dob;

  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.dob,
  });

  String fullname() => "${this.firstName} ${this.lastName}";

  factory Contact.fromModel(ContactModel model) {
    return Contact(
      id: model.id,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      dob: model.dob,
    );
  }

  ContactModel toModel() {
    return ContactModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      dob: dob,
    );
  }

  Contact copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
  }) {
    return Contact(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dob: dob ?? this.dob,
    );
  }
}
