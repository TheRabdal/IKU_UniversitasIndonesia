import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _rememberMe = true;
  AuthUserModel? _currentUser;

  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;
  bool get rememberMe => _rememberMe;
  bool get isAuthenticated => _currentUser != null;
  AuthUserModel? get currentUser => _currentUser;

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleRememberMe(bool? val) {
    _rememberMe = val ?? false;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 600));

    _currentUser = const AuthUserModel(
      username: 'Admin IKU',
      email: 'admin@ui.ac.id',
      role: 'Administrator',
      token: 'ui_token_2026',
    );

    _isLoading = false;
    notifyListeners();
    return true;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
