import 'package:flutter/material.dart';

class CategoriesNotifier extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void goToPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
