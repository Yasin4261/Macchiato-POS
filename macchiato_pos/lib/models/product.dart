import 'package:uuid/uuid.dart';

class Product {
  final String id;
  final String name;
  final double? price;
  final String? category;

  Product({
    required this.name,
    this.price,
    this.category,
  }) : id = Uuid().v4(); // Benzersiz ID oluşturma
}
