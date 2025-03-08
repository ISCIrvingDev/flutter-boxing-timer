import 'auth.repository.dart';

class AppAuthService implements IAppAuthRepository {
  bool _isAuthenticated = false;

  @override
  bool get isAuthenticated => _isAuthenticated;

  @override
  void login() {
    _isAuthenticated = true;
    print('Nuevo valor de la autenticacion: $_isAuthenticated');
  }

  @override
  void logout() {
    _isAuthenticated = false;
    print('Nuevo valor de la autenticacion: $_isAuthenticated');
  }
}
