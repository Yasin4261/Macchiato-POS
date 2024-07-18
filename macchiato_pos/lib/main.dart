import 'package:flutter/material.dart';
import 'package:macchiato_pos/routers/app_router.dart';
import 'package:provider/provider.dart';
import 'package:macchiato_pos/provider/categories_notifier.dart';
import 'package:macchiato_pos/provider/order_list_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoriesNotifier()),
        ChangeNotifierProvider(create: (context) => OrderListProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
