import '../../../../data/repositories/auth_repository.dart';

class HomeViewmodel {
  final AuthRepository authRepository;

  HomeViewmodel({required this.authRepository});

  String get userEmail {
    return authRepository.currentEmailUser ?? 'Usuário sem e-mail';
  }

  Future<void> logout() async {
    return await authRepository.logout();
  }
}
