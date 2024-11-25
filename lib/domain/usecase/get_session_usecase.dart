import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/repository/contact_auth_repository_interface.dart';
import 'package:flutter_test_contact/utils/usecase_util.dart';

class GetSessionLoginUseCase implements UseCase<String?, NoParams> {
  final ContactAuthRepositoryInterface repository;

  GetSessionLoginUseCase({required this.repository});

  @override
  Future<String?> call(NoParams params) async {
    return repository.getLoginSession();
  }
}
