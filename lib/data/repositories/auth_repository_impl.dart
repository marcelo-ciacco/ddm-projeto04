import 'package:projeto04/data/repositories/auth_repository.dart';
import 'package:projeto04/data/services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  AuthService get authService => authService;

  @override
  String? get currentEmailUser => authService.currentUser?.email;

  @override
  bool get isLoggedIn => authService.currentUser != null;

  @override
  Future<void> login({required String email, required String password}) async {
    await authService.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await authService.logout();
  }

  @override
  Future<void> register({
    required String email,
    required String password,
  }) async {
    await authService.register(
      email: email,
      password: password,
    );
  }
}
