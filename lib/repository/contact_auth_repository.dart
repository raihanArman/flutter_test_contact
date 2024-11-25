import 'package:flutter_test_contact/libraries/preferences/preferences_manager_interface.dart';
import 'package:flutter_test_contact/repository/contact_auth_repository_interface.dart';

class ContactAuthRepository extends ContactAuthRepositoryInterface {
  final PreferencesManagerInterface preferencesManager;

  ContactAuthRepository({
    required this.preferencesManager,
  });

  @override
  Future<bool> isLogin() async {
    final getSession = await preferencesManager.getLoginSession();
    return getSession != null && getSession.isNotEmpty;
  }

  @override
  void setLoginSession(String userId) {
    preferencesManager.setLoginSession(userId);
  }

  @override
  Future<String?> getLoginSession() {
    return preferencesManager.getLoginSession();
  }
}
