import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:macchiato_pos/models/categories_notifier.dart';

class CategoriesButtons extends StatelessWidget {
  const CategoriesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesNotifier =
        Provider.of<CategoriesNotifier>(context, listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => categoriesNotifier.goToPage(0),
              child: const Text('Soğuk Kahveler'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => categoriesNotifier.goToPage(1),
              child: const Text('Sıcak Kahveler'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => categoriesNotifier.goToPage(2),
              child: const Text('Tatlılar'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => categoriesNotifier.goToPage(3),
              child: const Text('Unlu Mamüller'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => categoriesNotifier.goToPage(4),
              child: const Text('Kasa Önü'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => categoriesNotifier.goToPage(5),
              child: const Text('Diğer İçecekler'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => categoriesNotifier.goToPage(6),
              child: const Text('Hediyelik Eşyalar'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => categoriesNotifier.goToPage(7),
              child: const Text('Dondurma'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => categoriesNotifier.goToPage(8),
              child: const Text('Çekirdek Kahveler'),
            ),
          ),
        ],
      ),
    );
  }
}
