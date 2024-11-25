import 'package:equatable/equatable.dart';
import 'package:flutter_test_contact/domain/models/contact.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final Contact contact;

  LoginSuccess({required this.contact});

  @override
  List<Object?> get props => [contact];
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
