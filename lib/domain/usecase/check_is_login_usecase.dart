import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/repository/contact_auth_repository_interface.dart';
import 'package:flutter_test_contact/utils/usecase_util.dart';

class CheckIsLoginUseCase implements UseCase<bool, NoParams> {
  final ContactAuthRepositoryInterface repository;

  CheckIsLoginUseCase({required this.repository});

  @override
  Future<bool> call(NoParams params) async {
    return repository.isLogin();
  }
}
