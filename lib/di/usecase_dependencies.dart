import 'package:flutter_test_contact/di/dependency_injector.dart';
import 'package:flutter_test_contact/domain/usecase/check_is_login_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/create_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/get_contact_by_userid_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/get_session_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/insert_dummy_data_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/delete_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/fetch_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/save_session_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/update_contact_usecase.dart';

class UseCaseDependency {
  Future<void> initialize() async {
    _createContactUseCase();
    _insertDummyDataUseCase();
    _updateContactUseCase();
    _deleteContactUseCase();
    _fetchContactUseCase();
    _saveSessionUseCase();
    _checkIsLoginUseCase();
    _getContactByUserIdUseCase();
    _getSessionUseCase();
  }

  void _createContactUseCase() =>
      locator.registerLazySingleton<CreateContactUseCase>(
        () => CreateContactUseCase(repository: locator()),
      );

  void _insertDummyDataUseCase() =>
      locator.registerLazySingleton<InsertDummyDataUseCase>(
        () => InsertDummyDataUseCase(repository: locator()),
      );

  void _updateContactUseCase() =>
      locator.registerLazySingleton<UpdateContactUseCase>(
        () => UpdateContactUseCase(repository: locator()),
      );

  void _deleteContactUseCase() =>
      locator.registerLazySingleton<DeleteContactUseCase>(
        () => DeleteContactUseCase(repository: locator()),
      );

  void _fetchContactUseCase() =>
      locator.registerLazySingleton<FetchContactsUseCase>(
        () => FetchContactsUseCase(repository: locator()),
      );

  void _checkIsLoginUseCase() =>
      locator.registerLazySingleton<CheckIsLoginUseCase>(
        () => CheckIsLoginUseCase(repository: locator()),
      );

  void _saveSessionUseCase() =>
      locator.registerLazySingleton<SaveSessionLoginUseCase>(
        () => SaveSessionLoginUseCase(repository: locator()),
      );

  void _getContactByUserIdUseCase() =>
      locator.registerLazySingleton<GetContactByUserIdUseCase>(
        () => GetContactByUserIdUseCase(repository: locator()),
      );

  void _getSessionUseCase() =>
      locator.registerLazySingleton<GetSessionLoginUseCase>(
        () => GetSessionLoginUseCase(repository: locator()),
      );
}
