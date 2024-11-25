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
