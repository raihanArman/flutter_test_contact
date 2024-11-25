abstract class ContactDetailState {}

class ContactDetailInitial extends ContactDetailState {}

class ContactDetailLoading extends ContactDetailState {}

class ContactDetailSuccess extends ContactDetailState {
  final String message;

  ContactDetailSuccess(this.message);
}

class ContactDetailError extends ContactDetailState {
  final String error;

  ContactDetailError(this.error);
}

class ContactDetailFormState extends ContactDetailState {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String dob;
  final String? errorMessage;

  ContactDetailFormState({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.dob = '',
    this.errorMessage,
  });

  ContactDetailFormState copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
    String? errorMessage,
  }) {
    return ContactDetailFormState(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      errorMessage: errorMessage,
    );
  }
}
