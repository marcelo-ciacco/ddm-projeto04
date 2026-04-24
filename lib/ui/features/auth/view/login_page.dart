import 'package:flutter/material.dart';
import 'package:projeto04/ui/features/auth/viewmodel/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewmodel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (_, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: viewModel.emailController,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: viewModel.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(onPressed: () {}, child: Text("Entrar")),
                SizedBox(height: 12),
                TextButton(onPressed: () {}, child: Text("Criar conta")),
              ],
            ),
          ),
        );
      },
    );
  }
}
