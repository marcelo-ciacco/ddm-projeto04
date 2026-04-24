import 'package:flutter/material.dart';
import 'package:projeto04/app/app_routes.dart';
import 'package:projeto04/data/repositories/auth_repository.dart';
import 'package:projeto04/data/repositories/auth_repository_impl.dart';
import 'package:projeto04/ui/features/auth/view/login_page.dart';

import '../ui/features/auth/view/register_page.dart';
import '../ui/features/home/view/home_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final AuthRepository _authRepository = AuthRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Firebase Auth App",
      initialRoute: _authRepository.isLoggedIn
          ? AppRoutes.home
          : AppRoutes.login,
      routes: {
        AppRoutes.login: (_) => LoginPage(),
        AppRoutes.register: (_) => RegisterPage(),
        AppRoutes.home: (_) => HomePage(),
      },
    );
  }
}
