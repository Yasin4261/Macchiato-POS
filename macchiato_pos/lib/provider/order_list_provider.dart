import 'package:flutter/material.dart';
import 'package:macchiato_pos/models/product.dart';

class OrderListProvider extends ChangeNotifier {
  List<Product> _orders = [];

  List<Product> get orders => _orders;

  void addOrder(Product order) {
    _orders.add(order);
    notifyListeners();
  }

  void removeOrderById(String id) {
    _orders.removeWhere((order) => order.id == id);
    notifyListeners();
  }
}
