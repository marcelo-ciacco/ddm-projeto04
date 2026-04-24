import 'package:flutter/material.dart';
import 'package:projeto04/ui/features/auth/viewmodel/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterViewmodel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = RegisterViewmodel();
  }

  @override
  void dispose() {
    viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewmodel,
      builder: (_, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Cadastro"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: viewmodel.emailController,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: viewmodel.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Cadastrar"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
