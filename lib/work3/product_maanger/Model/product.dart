class Product {
  int? id;
  String name;
  String? description;
  double price;

  Product({this.id, required this.name, this.description, required this.price});

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description, 'price': price};
  }
}
