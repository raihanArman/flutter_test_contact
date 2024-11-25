import 'package:equatable/equatable.dart';
import 'package:flutter_test_contact/domain/models/contact.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Contact> contacts;

  const HomeLoaded(this.contacts);

  @override
  List<Object?> get props => [contacts];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

class HomeSearchResults extends HomeState {
  final List<Contact> filteredContacts;
  final List<Contact> allContacts;

  const HomeSearchResults(
      {required this.filteredContacts, required this.allContacts});

  @override
  List<Object?> get props => [filteredContacts, allContacts];
}
