import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/repository/contact_repository_interface.dart';
import 'package:flutter_test_contact/utils/usecase_util.dart';

class UpdateContactUseCase implements UseCase<void, UpdateContactParams> {
  final ContactRepositoryInterface repository;

  UpdateContactUseCase({required this.repository});

  @override
  Future<void> call(UpdateContactParams params) async {
    await repository.updateContact(params.contact.toModel());
  }
}
