import 'package:projeto04/data/services/auth_service.dart';

abstract interface class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  bool get isLoggedIn;

  String? get currentEmailUser;

  Future<void> register({required String email, required String password});

  Future<void> login({required String email, required String password});

  Future<void> logout();
}
