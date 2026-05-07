import 'package:flutter/material.dart';
import 'package:projeto04/data/repositories/auth_repository_impl.dart';
import 'package:projeto04/data/services/auth_service_impl.dart';

import '../../../../app/app_routes.dart';
import '../viewmodel/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewmodel(
      authRepository: AuthRepositoryImpl(authService: AuthServiceImpl()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              await viewModel.logout();
              if (!context.mounted) return;

              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Logado como:\n${viewModel.userEmail}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
