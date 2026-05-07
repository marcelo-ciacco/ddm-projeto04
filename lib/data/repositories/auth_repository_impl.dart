import 'package:projeto04/data/repositories/auth_repository.dart';
import 'package:projeto04/data/services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl({required AuthService authService})
    : _authService = authService;

  @override
  String? get currentEmailUser => _authService.currentUser?.email;

  @override
  bool get isLoggedIn => _authService.currentUser != null;

  @override
  Future<void> login({required String email, required String password}) async {
    await _authService.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await _authService.logout();
  }

  @override
  Future<void> register({
    required String email,
    required String password,
  }) async {
    await _authService.register(
      email: email,
      password: password,
    );
  }
}
