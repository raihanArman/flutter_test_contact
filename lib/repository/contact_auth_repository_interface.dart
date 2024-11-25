abstract class ContactAuthRepositoryInterface {
  void setLoginSession(String userId);
  Future<bool> isLogin();
  Future<String?> getLoginSession();
}
