import 'package:flutter/material.dart';
import 'package:macchiato_pos/widgets/home_widgets/categories_buttons.dart';
import 'package:macchiato_pos/widgets/home_widgets/category_display.dart';

class OrderPanel extends StatelessWidget {
  const OrderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.blue,
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
              child: const CategoryDisplay(),
            ),
          )
        ],
      ),
    );
  }
}
