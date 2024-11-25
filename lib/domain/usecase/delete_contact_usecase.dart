import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/repository/contact_repository_interface.dart';
import 'package:flutter_test_contact/utils/usecase_util.dart';

class DeleteContactUseCase implements UseCase<void, DeleteContactParams> {
  final ContactRepositoryInterface repository;

  DeleteContactUseCase({required this.repository});

  @override
  Future<void> call(DeleteContactParams params) async {
    await repository.removeContact(params.contactId);
  }
}
