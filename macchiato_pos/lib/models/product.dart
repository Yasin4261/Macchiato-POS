import 'package:uuid/uuid.dart';

class Product {
  final String user;
  final String id;
  final String name;
  final double? price;
  final String? category;

  Product({
    required this.name,
    this.user = "",
    this.price,
    this.category,
  }) : id = Uuid().v4(); // Benzersiz ID oluşturma

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'id': id,
      'name': name,
      'price': price,
      'category': category,
    };
  }
}
