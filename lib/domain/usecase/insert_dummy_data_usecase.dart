import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/repository/contact_repository_interface.dart';
import 'package:flutter_test_contact/utils/usecase_util.dart';

class InsertDummyDataUseCase implements UseCase<void, CreateContactsParams> {
  final ContactRepositoryInterface repository;

  InsertDummyDataUseCase({required this.repository});

  @override
  Future<void> call(CreateContactsParams params) async {
    final hasContacts = await repository.hasContacts();

    if (!hasContacts) {
      await repository
          .addContacts(params.contacts.map((e) => e.toModel()).toList());
    }
  }
}
