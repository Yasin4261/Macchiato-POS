import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:macchiato_pos/models/categories_notifier.dart';

class CategoryDisplay extends StatelessWidget {
  const CategoryDisplay({super.key});

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

class IceCoffeeDisplay extends StatelessWidget {
  const IceCoffeeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Text(
          'Page 1',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class HotCoffeeDisplay extends StatelessWidget {
  const HotCoffeeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text(
          'Page 2',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class DessertsDisplay extends StatelessWidget {
  const DessertsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text(
          'Page 3',
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}

class BakeryDisplay extends StatelessWidget {
  const BakeryDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text(
          'Page 4',
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}

class CaseFrontDisplay extends StatelessWidget {
  const CaseFrontDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text(
          'Page 5',
          style: TextStyle(color: Colors.deepPurple),
        ),
      ),
    );
  }
}

class OtherDrinkDisplay extends StatelessWidget {
  const OtherDrinkDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text(
          'Page 6',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}

class GiftDisplay extends StatelessWidget {
  const GiftDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text(
          'Page 7',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class IceCreamDisplay extends StatelessWidget {
  const IceCreamDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text(
          'Page 8',
          style: TextStyle(color: Colors.pink),
        ),
      ),
    );
  }
}

class BeanCoffees extends StatelessWidget {
  const BeanCoffees({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text(
          'Page 9',
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
    );
    
  }
}
