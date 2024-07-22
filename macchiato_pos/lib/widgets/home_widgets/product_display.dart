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
      children: [
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
  final List<Product> products;

  const BaseDisplay(
      {super.key, required this.categoryName, required this.products});

  @override
  Widget build(BuildContext context) {
    final orderListProvider = Provider.of<OrderListProvider>(context);

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 9, // Her satırda dokuz öğe olacak
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                // Yeni bir Product oluşturuluyor ve yeni bir ID atanıyor
                final newProduct = Product(
                  name: product.name,
                  price: product.price,
                  category: product.category,
                );
                orderListProvider.addOrder(newProduct);
                print("Name : ${newProduct.name} ; id : ${newProduct.id}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('${newProduct.name} clicked in $categoryName'),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Center(
                  child: Text(
                    product.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class IceCoffeeDisplay extends BaseDisplay {
  IceCoffeeDisplay({super.key})
      : super(categoryName: 'Ice Coffee', products: [
          Product(name: "Iced Latte"),
          Product(name: "Iced Mocha")
        ]);
}

class HotCoffeeDisplay extends BaseDisplay {
  HotCoffeeDisplay({super.key})
      : super(
            categoryName: 'Hot Coffee',
            products: [Product(name: "Espresso"), Product(name: "Americano")]);
}

class DessertsDisplay extends BaseDisplay {
  DessertsDisplay({super.key})
      : super(
            categoryName: 'Desserts',
            products: [Product(name: "Cheesecake"), Product(name: "Brownie")]);
}

class BakeryDisplay extends BaseDisplay {
  BakeryDisplay({super.key})
      : super(
            categoryName: 'Bakery',
            products: [Product(name: "Croissant"), Product(name: "Muffin")]);
}

class CaseFrontDisplay extends BaseDisplay {
  CaseFrontDisplay({super.key})
      : super(
            categoryName: 'Case Front',
            products: [Product(name: "Sandwich"), Product(name: "Salad")]);
}

class OtherDrinkDisplay extends BaseDisplay {
  OtherDrinkDisplay({super.key})
      : super(
            categoryName: 'Other Drinks',
            products: [Product(name: "Tea"), Product(name: "Smoothie")]);
}

class GiftDisplay extends BaseDisplay {
  GiftDisplay({super.key})
      : super(
            categoryName: 'Gifts',
            products: [Product(name: "Gift Card"), Product(name: "Mug")]);
}

class IceCreamDisplay extends BaseDisplay {
  IceCreamDisplay({super.key})
      : super(
            categoryName: 'Ice Cream',
            products: [Product(name: "Vanilla"), Product(name: "Chocolate")]);
}

class BeanCoffees extends BaseDisplay {
  BeanCoffees({super.key})
      : super(
            categoryName: 'Bean Coffees',
            products: [Product(name: "Arabica"), Product(name: "Robusta")]);
}
