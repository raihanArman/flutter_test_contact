import 'package:flutter_test_contact/domain/models/contact.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Contact contact;

  ProfileLoaded(this.contact);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

class ProfileLoggedOut extends ProfileState {}
