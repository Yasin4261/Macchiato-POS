import 'package:flutter/material.dart';
import 'package:macchiato_pos/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<void> sendOrders(String userId) async {
    final url = userId != null
        ? "http://localhost:8800/api/buy/orders/$userId"
        : "http://localhost:8800/api/buy/orders/"; // Backend URL'nizi buraya ekleyin

    final productList = _orders.map((order) => order.name).join(',');

    final body = json.encode({
      'name': productList,
      'price': 10, // Örnek fiyat, ihtiyaca göre ayarlayın
      'category': 'example category' // Örnek kategori, ihtiyaca göre ayarlayın
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print("Siparişler başarılı bir şekilde gönderildi");
        _orders.clear();
        notifyListeners();
      } else {
        print("Sipariş gönderilirken bir hata oluştu: ${response.body}");
      }
    } catch (error) {
      print("Sipariş gönderilirken bir hata oluştu: $error");
    }
  }
}
