abstract class PreferencesManagerInterface {
  void setLoginSession(String contactData);
  Future<String?> getLoginSession();
  void clearData();
}
