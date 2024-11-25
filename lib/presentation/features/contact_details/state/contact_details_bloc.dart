import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_contact/domain/models/contact.dart';
import 'package:flutter_test_contact/domain/usecase/create_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/delete_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/update_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/presentation/features/contact_details/state/contact_details_event.dart';
import 'package:flutter_test_contact/presentation/features/contact_details/state/contact_details_state.dart';
import 'package:flutter_test_contact/utils/string_util.dart';

class ContactDetailBloc extends Bloc<ContactDetailEvent, ContactDetailState> {
  final CreateContactUseCase createContactUseCase;
  final UpdateContactUseCase updateContactUseCase;
  final DeleteContactUseCase deleteContactUseCase;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  ContactDetailBloc({
    required this.createContactUseCase,
    required this.updateContactUseCase,
    required this.deleteContactUseCase,
    Contact? initialContact,
  }) : super(ContactDetailInitial()) {
    if (initialContact != null) {
      firstNameController.text = initialContact.firstName;
      lastNameController.text = initialContact.lastName;
      emailController.text = initialContact.email ?? '';
      dobController.text = initialContact.dob ?? '';
    }

    on<SubmitContactForm>(_onSubmitContactForm);
    on<DeleteContact>(_onDeleteContact);
    on<UpdateContactField>((event, emit) {
      switch (event.fieldName) {
        case 'firstName':
          firstNameController.text = event.fieldValue;
          break;
        case 'lastName':
          lastNameController.text = event.fieldValue;
          break;
        case 'email':
          emailController.text = event.fieldValue;
          break;
        case 'dob':
          dobController.text = event.fieldValue;
          break;
        default:
          break;
      }
    });
  }

  Future<void> _onSubmitContactForm(
    SubmitContactForm event,
    Emitter<ContactDetailState> emit,
  ) async {
    emit(ContactDetailLoading());

    if (firstNameController.text.trim().isEmpty) {
      emit(ContactDetailError("First Name is mandatory."));
      return;
    }
    if (lastNameController.text.trim().isEmpty) {
      emit(ContactDetailError("Last Name is mandatory."));
      return;
    }

    final contact = Contact(
      id: event.contact?.id ?? randomString(10),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      dob: dobController.text.trim(),
    );

    try {
      if (event.contact != null) {
        await updateContactUseCase.call(UpdateContactParams(contact: contact));
        emit(ContactDetailSuccess("Contact successfully updated."));
      } else {
        await createContactUseCase.call(CreateContactParams(contact: contact));
        emit(ContactDetailSuccess("Contact successfully created."));
      }
    } catch (e) {
      emit(ContactDetailError("Failed to save contact."));
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
      emit(ContactDetailError("Failed to delete contact."));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    dobController.dispose();
    return super.close();
  }
}
