import 'package:flutter/material.dart';
import 'package:projeto04/data/repositories/auth_repository_impl.dart';
import 'package:projeto04/data/services/auth_service_impl.dart';
import 'package:projeto04/ui/features/auth/viewmodel/register_viewmodel.dart';

import '../../../../app/app_routes.dart';

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
    viewmodel = RegisterViewmodel(
      authRepository: AuthRepositoryImpl(authService: AuthServiceImpl()),
    );
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
                  onPressed: viewmodel.isLoading
                      ? null
                      : () async {
                          final success = await viewmodel.register();
                          if (!context.mounted) {
                            return;
                          }

                          // final result = await FirebaseAuth.instance
                          //     .createUserWithEmailAndPassword(
                          //       email: viewmodel.emailController.text.trim(),
                          //       password: viewmodel.passwordController.text
                          //           .trim(),
                          //     );

                          // FirebaseFirestore.instance
                          //     .collection('users')
                          //     .doc(result.user!.uid)
                          //     .set({
                          //       'email': result.user!.email,
                          //       'name': "nameController.text",
                          //       'endereco': "addressController.text",
                          //     });

                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Usuário cadastrado com sucesso!",
                                ),
                              ),
                            );
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.home,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Erro ao cadastrar usuário!"),
                              ),
                            );
                          }
                        },
                  child: viewmodel.isLoading
                      ? CircularProgressIndicator()
                      : Text("Cadastrar"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
