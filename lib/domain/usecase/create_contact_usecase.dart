import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/repository/contact_repository_interface.dart';
import 'package:flutter_test_contact/utils/usecase_util.dart';

class CreateContactUseCase implements UseCase<void, CreateContactParams> {
  final ContactRepositoryInterface repository;

  CreateContactUseCase({required this.repository});

  @override
  Future<void> call(CreateContactParams params) async {
    await repository.addContact(params.contact.toModel());
  }
}
