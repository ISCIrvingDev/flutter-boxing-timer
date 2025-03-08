abstract class IAppAuthRepository {
  bool get isAuthenticated;
  void login();
  void logout();
}
