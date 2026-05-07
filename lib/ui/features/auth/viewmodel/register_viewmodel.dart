import 'package:flutter/material.dart';
import 'package:projeto04/data/repositories/auth_repository.dart';

class RegisterViewmodel extends ChangeNotifier {
  final AuthRepository authRepository;

  RegisterViewmodel({required this.authRepository});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<bool> register() async {
    try {
      isLoading = true;
      notifyListeners();

      await authRepository.register(
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
