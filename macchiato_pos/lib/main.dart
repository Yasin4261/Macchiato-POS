import 'package:flutter/material.dart';
import 'package:macchiato_pos/routers/app_router.dart';
import 'package:provider/provider.dart';
import 'package:macchiato_pos/models/categories_notifier.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CategoriesNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
    );
  }
}
