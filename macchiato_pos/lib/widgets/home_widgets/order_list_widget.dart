import 'package:flutter/material.dart';
import 'package:macchiato_pos/models/product.dart';
import 'package:provider/provider.dart';
import 'package:macchiato_pos/provider/order_list_provider.dart';

class OrderListWidget extends StatelessWidget {
  final List<Product> orders;

  const OrderListWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const Center(
        child: Text('Henüz sipariş eklenmedi.'),
      );
    }

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        debugPrint('Building item with id: ${order.id}');
        return Dismissible(
          key: Key(order.id.toString()),
          onDismissed: (DismissDirection direction) {
            final provider =
                Provider.of<OrderListProvider>(context, listen: false);
            provider.removeOrderById(order.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${order.name} siparişi silindi'),
              ),
            );
          },
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text(order.name),
            subtitle: Text('Ürün: ${order.name}, Fiyat: ${order.price}'),
          ),
        );
      },
    );
  }
}
