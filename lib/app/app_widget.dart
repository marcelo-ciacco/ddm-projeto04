import 'package:flutter/material.dart';
import 'package:projeto04/app/app_routes.dart';
import 'package:projeto04/ui/features/auth/view/login_page.dart';

import '../ui/features/auth/view/register_page.dart';
import '../ui/features/home/view/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Firebase Auth App",
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (_) => LoginPage(),
        AppRoutes.register: (_) => RegisterPage(),
        AppRoutes.home: (_) => HomePage(),
      },
    );
  }
}
