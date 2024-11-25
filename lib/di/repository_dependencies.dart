import 'package:flutter_test_contact/di/dependency_injector.dart';
import 'package:flutter_test_contact/repository/contact_auth_repository.dart';
import 'package:flutter_test_contact/repository/contact_auth_repository_interface.dart';
import 'package:flutter_test_contact/repository/contact_repository.dart';
import 'package:flutter_test_contact/repository/contact_repository_interface.dart';

class RepositoryDependency {
  Future<void> initialize() async {
    _contactRepository();
    _contactAuthRepository();
  }

  void _contactRepository() =>
      locator.registerLazySingleton<ContactRepositoryInterface>(
        () => ContactRepository(databaseManager: locator()),
      );

  void _contactAuthRepository() =>
      locator.registerLazySingleton<ContactAuthRepositoryInterface>(
        () => ContactAuthRepository(preferencesManager: locator()),
      );
}
