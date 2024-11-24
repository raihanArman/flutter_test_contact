import 'package:flutter_test_contact/libraries/preferences/preferences_manager_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StringSharedPref {
  static const loginSession = 'loginSession';
}

class PreferencesManager extends PreferencesManagerInterface {
  SharedPreferences? _prefs;

  Future<void> initializeSharedPref() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void clearData() async {
    if (_prefs == null) {
      await initializeSharedPref();
    }
    _prefs!.clear();
  }

  @override
  void setLoginSession(bool isLogin) async {
    if (_prefs == null) {
      await initializeSharedPref();
    }
    await _prefs!.setBool(StringSharedPref.loginSession, isLogin);
  }
}
