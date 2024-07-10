import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macchiato_pos/services/auth_service.dart';
import 'package:macchiato_pos/widgets/home_widgets/panels.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Siparişler',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
              context.go('/');
            },
          ),
        ],
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: OrderPanel(),
          ),
          Flexible(
            flex: 7,
            child: ProductPanel(),
          ),
        ],
      ),
    );
  }
}
