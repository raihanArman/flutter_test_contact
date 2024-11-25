import 'package:flutter_test_contact/repository/contact_auth_repository_interface.dart';
import 'package:flutter_test_contact/utils/usecase_util.dart';

class SaveSessionLoginUseCase implements UseCase<void, String> {
  final ContactAuthRepositoryInterface repository;

  SaveSessionLoginUseCase({required this.repository});

  @override
  Future<void> call(String params) async {
    repository.setLoginSession(params);
  }
}
