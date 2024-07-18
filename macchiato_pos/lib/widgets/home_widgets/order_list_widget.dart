import 'package:flutter/material.dart';
import 'package:macchiato_pos/models/product.dart';

class OrderListWidget extends StatelessWidget {
  final List<Product> orders;

  const OrderListWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return ListTile(
          title: Text(order.name),
          subtitle: Text('Ürün: ${order.name}, Fiyat ${order.price}'),
        );
      },
    );
  }
}
