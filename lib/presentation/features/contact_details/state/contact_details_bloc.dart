import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_test_contact/domain/usecase/create_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/delete_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/update_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/presentation/features/contact_details/state/contact_details_event.dart';
import 'package:flutter_test_contact/presentation/features/contact_details/state/contact_details_state.dart';

class ContactDetailBloc extends Bloc<ContactDetailEvent, ContactDetailState> {
  final CreateContactUseCase createContactUseCase;
  final UpdateContactUseCase updateContactUseCase;
  final DeleteContactUseCase deleteContactUseCase;

  ContactDetailBloc({
    required this.createContactUseCase,
    required this.updateContactUseCase,
    required this.deleteContactUseCase,
  }) : super(ContactDetailInitial()) {
    on<CreateContact>(_onCreateContact);
    on<UpdateContact>(_onUpdateContact);
    on<DeleteContact>(_onDeleteContact);
  }

  Future<void> _onCreateContact(
    CreateContact event,
    Emitter<ContactDetailState> emit,
  ) async {
    emit(ContactDetailLoading());
    try {
      await createContactUseCase
          .call(CreateContactParams(contact: event.contact));
      emit(ContactDetailSuccess("Contact successfully created."));
    } catch (e) {
      log("Error creating contact: $e");
      emit(ContactDetailError("Failed to create contact."));
    }
  }

  Future<void> _onUpdateContact(
    UpdateContact event,
    Emitter<ContactDetailState> emit,
  ) async {
    emit(ContactDetailLoading());
    try {
      await updateContactUseCase
          .call(UpdateContactParams(contact: event.contact));
      emit(ContactDetailSuccess("Contact successfully updated."));
    } catch (e) {
      log("Error updating contact: $e");
      emit(ContactDetailError("Failed to update contact."));
    }
  }

  Future<void> _onDeleteContact(
    DeleteContact event,
    Emitter<ContactDetailState> emit,
  ) async {
    emit(ContactDetailLoading());
    try {
      await deleteContactUseCase
          .call(DeleteContactParams(contactId: event.contactId));
      emit(ContactDetailSuccess("Contact successfully deleted."));
    } catch (e) {
      log("Error deleting contact: $e");
      emit(ContactDetailError("Failed to delete contact."));
    }
  }
}
