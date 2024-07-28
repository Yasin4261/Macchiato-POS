import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:macchiato_pos/widgets/home_widgets/categories_buttons.dart';
import 'package:macchiato_pos/widgets/home_widgets/product_display.dart';
import 'package:macchiato_pos/widgets/home_widgets/order_list_widget.dart';
import 'package:macchiato_pos/provider/order_list_provider.dart';

class OrderPanel extends StatelessWidget {
  const OrderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderListProvider>(context);

    return Container(
      height: double.infinity,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Siparişler"),
          Expanded(
            child: OrderListWidget(orders: orderProvider.orders),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Butona tıklanma işlevi burada tanımlanacak
                  final userId = '6689a1308f3d73ddd9c40c37'; // Kullanıcı ID'si
                  final orderListProvider = context.read<OrderListProvider>();
                  orderListProvider.sendOrders(userId);
                  print("Ödeme Al butonuna tıklandı");
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.green,
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(color: Colors.green.shade200, width: 2),
                ),
                child: const Text(
                  "Ödeme Al",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductPanel extends StatelessWidget {
  const ProductPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: const CategoriesButtons(),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 20,
              color: Colors.transparent,
              child: const ProductDisplay(),
            ),
          )
        ],
      ),
    );
  }
}
