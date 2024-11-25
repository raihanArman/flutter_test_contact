import 'package:flutter_test_contact/di/dependency_injector.dart';
import 'package:flutter_test_contact/libraries/database/database_manager.dart';
import 'package:flutter_test_contact/libraries/database/database_manager_interface.dart';
import 'package:flutter_test_contact/libraries/preferences/preferences_manager.dart';
import 'package:flutter_test_contact/libraries/preferences/preferences_manager_interface.dart';

class LibrariesDependency {
  Future<void> initialize() async {
    _preferencesManager();
    _databaseManager();
  }

  void _preferencesManager() =>
      locator.registerLazySingleton<PreferencesManagerInterface>(
        () => PreferencesManager(),
      );

  void _databaseManager() =>
      locator.registerLazySingleton<DatabaseManagerInterface>(
        () => DatabaseManager(),
      );
}
