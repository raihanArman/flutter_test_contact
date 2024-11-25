import 'package:flutter_test_contact/di/libraries_dependencies.dart';
import 'package:flutter_test_contact/di/repository_dependencies.dart';
import 'package:flutter_test_contact/di/usecase_dependencies.dart';

class ModuleDependency {
  Future<void> init() async {
    await LibrariesDependency().initialize();
    await RepositoryDependency().initialize();
    await UseCaseDependency().initialize();
  }
}
