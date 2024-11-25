import 'package:flutter_test_contact/domain/models/contact.dart';
import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/repository/contact_repository_interface.dart';
import 'package:flutter_test_contact/utils/usecase_util.dart';

class FetchContactsUseCase implements UseCase<List<Contact>, NoParams> {
  final ContactRepositoryInterface repository;

  FetchContactsUseCase({required this.repository});

  @override
  Future<List<Contact>> call(NoParams params) async {
    final models = await repository.fetchAllContacts();
    return models.map((model) => Contact.fromModel(model)).toList();
  }
}
