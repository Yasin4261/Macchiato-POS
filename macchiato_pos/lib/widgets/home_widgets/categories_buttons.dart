import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:macchiato_pos/models/categories_notifier.dart';

class CategoriesButtons extends StatefulWidget {
  const CategoriesButtons({super.key});

  @override
  State<CategoriesButtons> createState() => _CategoriesButtonsState();
}

class _CategoriesButtonsState extends State<CategoriesButtons> {
  @override
  Widget build(BuildContext context) {
    final categoriesNotifier =
        Provider.of<CategoriesNotifier>(context, listen: true);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildButton(context, categoriesNotifier, 0, 'Soğuk Kahveler'),
        _buildButton(context, categoriesNotifier, 1, 'Sıcak Kahveler'),
        _buildButton(context, categoriesNotifier, 2, 'Tatlılar'),
        _buildButton(context, categoriesNotifier, 3, 'Unlu Mamüller'),
        _buildButton(context, categoriesNotifier, 4, 'Kasa Önü'),
        _buildButton(context, categoriesNotifier, 5, 'Diğer İçecekler'),
        _buildButton(context, categoriesNotifier, 6, 'Hediyelik Eşyalar'),
        _buildButton(context, categoriesNotifier, 7, 'Dondurma'),
        _buildButton(context, categoriesNotifier, 8, 'Çekirdek Kahveler'),
      ]),
    );
  }
}

Widget _buildButton(
    BuildContext context, CategoriesNotifier notifier, int page, String title) {
  final bool isSelected = notifier.currentPage == page;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: () => notifier.goToPage(page),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey,
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      child: Text(title),
    ),
  );
}
