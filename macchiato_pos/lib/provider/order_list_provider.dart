import 'package:flutter/material.dart';
import 'package:macchiato_pos/models/product.dart';

class OrderListProvider extends ChangeNotifier {
  List<Product> _orders = [];
  List<Product> get orders => _orders;

  void addOrder(Product order) {
    _orders.add(order);
    notifyListeners();
  }

  void removeOrder(Product order) {
    _orders.remove(order);
    notifyListeners();
  }
}
