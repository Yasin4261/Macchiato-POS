class Product {
  final int? id;
  final String name;
  final double? price;
  final String? category;

  Product({
    this.id,
    required this.name,
    this.price,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      category: json['category'],
    );
  }
}
