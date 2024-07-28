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
                  user: product
                      .user, // Qr koddan gelen id eğer okutulduysa eşitle
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
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
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
          Product(name: "Iced Mocha"),
          Product(name: "Iced Americano"),
          Product(name: "Affogato"),
          Product(name: "Cold Brew"),
          Product(name: "Frappuccino"),
          Product(name: "Iced Caramel Macchiato"),
          Product(name: "Nitro Cold Brew"),
          Product(name: "Iced Vanilla Latte"),
          Product(name: "Iced Chai Latte"),
          Product(name: "Iced Matcha Latte"),
          Product(name: "Iced Flat White"),
          Product(name: "Iced Macchiato"),
          Product(name: "Iced Espresso"),
          Product(name: "Iced Cappuccino"),
          Product(name: "Iced White Mocha"),
          Product(name: "Iced Honey Latte"),
          Product(name: "Iced Coconut Latte"),
          Product(name: "Iced Almond Milk Latte"),
          Product(name: "Iced Oat Milk Latte")
        ]);
}

class HotCoffeeDisplay extends BaseDisplay {
  HotCoffeeDisplay({super.key})
      : super(categoryName: 'Hot Coffee', products: [
          Product(name: "Espresso"),
          Product(name: "Americano"),
          Product(name: "Cappuccino"),
          Product(name: "Latte"),
          Product(name: "Mocha"),
          Product(name: "Flat White"),
          Product(name: "Macchiato"),
          Product(name: "Ristretto"),
          Product(name: "Long Black"),
          Product(name: "Piccolo Latte"),
          Product(name: "Cortado"),
          Product(name: "Irish Coffee"),
          Product(name: "Turkish Coffee"),
          Product(name: "Greek Coffee"),
          Product(name: "Vietnamese Coffee"),
          Product(name: "Affogato"),
          Product(name: "Espresso Con Panna"),
          Product(name: "Cafe Breve"),
          Product(name: "Cafe Bombon"),
          Product(name: "Cafe Cubano")
        ]);
}

class DessertsDisplay extends BaseDisplay {
  DessertsDisplay({super.key})
      : super(categoryName: 'Desserts', products: [
          Product(name: "Cheesecake"),
          Product(name: "Brownie"),
          Product(name: "Tiramisu"),
          Product(name: "Chocolate Cake"),
          Product(name: "Cupcake"),
          Product(name: "Panna Cotta"),
          Product(name: "Creme Brulee"),
          Product(name: "Eclair"),
          Product(name: "Macaron"),
          Product(name: "Pavlova"),
          Product(name: "Banoffee Pie"),
          Product(name: "Apple Pie"),
          Product(name: "Carrot Cake"),
          Product(name: "Lemon Tart"),
          Product(name: "Ice Cream Sundae"),
          Product(name: "Molten Lava Cake"),
          Product(name: "Mousse"),
          Product(name: "Bread Pudding"),
          Product(name: "Cannoli"),
          Product(name: "Churros")
        ]);
}

class BakeryDisplay extends BaseDisplay {
  BakeryDisplay({super.key})
      : super(categoryName: 'Bakery', products: [
          Product(name: "Croissant"),
          Product(name: "Muffin"),
          Product(name: "Bagel"),
          Product(name: "Danish"),
          Product(name: "Scone"),
          Product(name: "Bread"),
          Product(name: "Biscuit"),
          Product(name: "Donut"),
          Product(name: "Pretzel"),
          Product(name: "Baguette"),
          Product(name: "Focaccia"),
          Product(name: "Pita Bread"),
          Product(name: "Brioche"),
          Product(name: "Cinnamon Roll"),
          Product(name: "Ciabatta"),
          Product(name: "Rye Bread"),
          Product(name: "Challah"),
          Product(name: "English Muffin"),
          Product(name: "Garlic Bread"),
          Product(name: "Cornbread")
        ]);
}

class CaseFrontDisplay extends BaseDisplay {
  CaseFrontDisplay({super.key})
      : super(categoryName: 'Case Front', products: [
          Product(name: "Sandwich"),
          Product(name: "Salad"),
          Product(name: "Wrap"),
          Product(name: "Quiche"),
          Product(name: "Soup"),
          Product(name: "Pasta"),
          Product(name: "Fruit Bowl"),
          Product(name: "Yogurt Parfait"),
          Product(name: "Chicken Salad"),
          Product(name: "Egg Salad"),
          Product(name: "Tuna Salad"),
          Product(name: "Hummus and Veggies"),
          Product(name: "Grain Bowl"),
          Product(name: "Sushi Roll"),
          Product(name: "Caprese Salad"),
          Product(name: "Greek Salad"),
          Product(name: "Caesar Salad"),
          Product(name: "Kale Salad"),
          Product(name: "Cobb Salad"),
          Product(name: "Burrito Bowl")
        ]);
}

class OtherDrinkDisplay extends BaseDisplay {
  OtherDrinkDisplay({super.key})
      : super(categoryName: 'Other Drinks', products: [
          Product(name: "Tea"),
          Product(name: "Smoothie"),
          Product(name: "Lemonade"),
          Product(name: "Hot Chocolate"),
          Product(name: "Chai Latte"),
          Product(name: "Matcha Latte"),
          Product(name: "Milkshake"),
          Product(name: "Iced Tea"),
          Product(name: "Green Tea"),
          Product(name: "Herbal Tea"),
          Product(name: "Bubble Tea"),
          Product(name: "Apple Cider"),
          Product(name: "Kombucha"),
          Product(name: "Italian Soda"),
          Product(name: "Frappe"),
          Product(name: "Hot Apple Cider"),
          Product(name: "Spiced Latte"),
          Product(name: "Golden Milk"),
          Product(name: "Protein Shake"),
          Product(name: "Energy Drink")
        ]);
}

class GiftDisplay extends BaseDisplay {
  GiftDisplay({super.key})
      : super(categoryName: 'Gifts', products: [
          Product(name: "Gift Card"),
          Product(name: "Mug"),
          Product(name: "Coffee Beans"),
          Product(name: "Travel Mug"),
          Product(name: "T-shirt"),
          Product(name: "Notebook"),
          Product(name: "Keychain"),
          Product(name: "Coffee Grinder"),
          Product(name: "French Press"),
          Product(name: "Coffee Maker"),
          Product(name: "Tea Infuser"),
          Product(name: "Tote Bag"),
          Product(name: "Water Bottle"),
          Product(name: "Thermos"),
          Product(name: "Apron"),
          Product(name: "Coffee Subscription"),
          Product(name: "Espresso Machine"),
          Product(name: "Recipe Book"),
          Product(name: "Gift Basket"),
          Product(name: "Candle")
        ]);
}

class IceCreamDisplay extends BaseDisplay {
  IceCreamDisplay({super.key})
      : super(categoryName: 'Ice Cream', products: [
          Product(name: "Vanilla"),
          Product(name: "Chocolate"),
          Product(name: "Strawberry"),
          Product(name: "Mint Chocolate Chip"),
          Product(name: "Cookie Dough"),
          Product(name: "Rocky Road"),
          Product(name: "Pistachio"),
          Product(name: "Butter Pecan"),
          Product(name: "Cookies and Cream"),
          Product(name: "Neapolitan"),
          Product(name: "Mango Sorbet"),
          Product(name: "Raspberry Sorbet"),
          Product(name: "Chocolate Chip"),
          Product(name: "Coffee"),
          Product(name: "Salted Caramel"),
          Product(name: "Rum Raisin"),
          Product(name: "Peach"),
          Product(name: "Lemon"),
          Product(name: "Blackberry"),
          Product(name: "Coconut")
        ]);
}

class BeanCoffees extends BaseDisplay {
  BeanCoffees({super.key})
      : super(categoryName: 'Bean Coffees', products: [
          Product(name: "Arabica"),
          Product(name: "Robusta"),
          Product(name: "Liberica"),
          Product(name: "Excelsa"),
          Product(name: "Colombian"),
          Product(name: "Ethiopian"),
          Product(name: "Sumatra"),
          Product(name: "Kenyan"),
          Product(name: "Jamaican Blue Mountain"),
          Product(name: "Brazilian"),
          Product(name: "Guatemalan"),
          Product(name: "Costa Rican"),
          Product(name: "Hawaiian Kona"),
          Product(name: "Yemeni"),
          Product(name: "Tanzanian Peaberry"),
          Product(name: "Vietnamese"),
          Product(name: "Rwandan"),
          Product(name: "Burundian"),
          Product(name: "Indian Monsooned Malabar"),
          Product(name: "Panama Geisha")
        ]);
}
