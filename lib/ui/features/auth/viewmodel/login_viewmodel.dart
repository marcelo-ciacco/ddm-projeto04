import 'package:flutter/material.dart';

import '../../../../data/repositories/auth_repository.dart';

class LoginViewmodel extends ChangeNotifier {
  final AuthRepository authRepository;

  LoginViewmodel({
    required this.authRepository,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<bool> login() async {
    try {
      isLoading = true;
      notifyListeners();

      await authRepository.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
