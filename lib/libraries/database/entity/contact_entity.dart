import 'package:hive_flutter/hive_flutter.dart';

part 'contact_entity.g.dart';

@HiveType(typeId: 1)
class ContactEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String? email;

  @HiveField(4)
  final String? dob;

  ContactEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.dob,
  });
}
