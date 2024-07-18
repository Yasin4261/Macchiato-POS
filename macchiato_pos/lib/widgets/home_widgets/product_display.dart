import 'package:flutter/material.dart';
import 'package:macchiato_pos/models/product.dart';
import 'package:provider/provider.dart';
import 'package:macchiato_pos/provider/categories_notifier.dart';
import 'package:macchiato_pos/provider/order_list_provider.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesNotifier = Provider.of<CategoriesNotifier>(context);
    final pageController =
        PageController(initialPage: categoriesNotifier.currentPage);

    // Dinamik olarak sayfa değişimini yönetmek için listener ekleyin
    categoriesNotifier.addListener(() {
      if (pageController.hasClients) {
        pageController.jumpToPage(categoriesNotifier.currentPage);
      }
    });

    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        categoriesNotifier.goToPage(index);
      },
      children: const [
        IceCoffeeDisplay(),
        HotCoffeeDisplay(),
        DessertsDisplay(),
        BakeryDisplay(),
        CaseFrontDisplay(),
        OtherDrinkDisplay(),
        GiftDisplay(),
        IceCreamDisplay(),
        BeanCoffees()
      ],
    );
  }
}

class BaseDisplay extends StatelessWidget {
  final String categoryName;
  final int itemCount;

  const BaseDisplay(
      {super.key, required this.categoryName, this.itemCount = 100});

  @override
  Widget build(BuildContext context) {
    final orderListProvider = Provider.of<OrderListProvider>(context);
    // For example
    final products = [Product(name: "latte"), Product(name: "mocha")];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10, // Her satırda on öğe olacak
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              orderListProvider.addOrder(products[1]);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item $index clicked in $categoryName'),
                ),
              );
            },
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Item $index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class IceCoffeeDisplay extends BaseDisplay {
  const IceCoffeeDisplay({super.key}) : super(categoryName: 'Ice Coffee');
}

class HotCoffeeDisplay extends BaseDisplay {
  const HotCoffeeDisplay({super.key}) : super(categoryName: 'Hot Coffee');
}

class DessertsDisplay extends BaseDisplay {
  const DessertsDisplay({super.key}) : super(categoryName: 'Desserts');
}

class BakeryDisplay extends BaseDisplay {
  const BakeryDisplay({super.key}) : super(categoryName: 'Bakery');
}

class CaseFrontDisplay extends BaseDisplay {
  const CaseFrontDisplay({super.key}) : super(categoryName: 'Case Front');
}

class OtherDrinkDisplay extends BaseDisplay {
  const OtherDrinkDisplay({super.key}) : super(categoryName: 'Other Drinks');
}

class GiftDisplay extends BaseDisplay {
  const GiftDisplay({super.key}) : super(categoryName: 'Gifts');
}

class IceCreamDisplay extends BaseDisplay {
  const IceCreamDisplay({super.key}) : super(categoryName: 'Ice Cream');
}

class BeanCoffees extends BaseDisplay {
  const BeanCoffees({super.key}) : super(categoryName: 'Bean Coffees');
}
