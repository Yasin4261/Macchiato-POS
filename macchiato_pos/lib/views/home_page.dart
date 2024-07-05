import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macchiato_pos/services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.logout();
              context.go('/');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the home page!'),
      ),
    );
  }
}
