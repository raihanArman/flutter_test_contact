import 'package:flutter_test_contact/domain/models/contact.dart';
import 'package:flutter_test_contact/repository/contact_repository_interface.dart';
import 'package:flutter_test_contact/utils/usecase_util.dart';

class GetContactByUserIdUseCase implements UseCase<Contact?, String> {
  final ContactRepositoryInterface repository;

  GetContactByUserIdUseCase({required this.repository});

  @override
  Future<Contact?> call(String params) async {
    final data = await repository.getByUserId(params);
    if (data != null) {
      return Contact.fromModel(data);
    } else {
      return null;
    }
  }
}
