abstract interface class AuthRepository {
  bool get isLoggedIn;

  String? get currentEmailUser;

  String? get currentUserId;

  Future<void> register({required String email, required String password});

  Future<void> login({required String email, required String password});

  Future<void> logout();
}
