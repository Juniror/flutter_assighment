import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Model/product.dart';

class ProductService {
  static const String baseUrl = "http://10.0.2.2:8001";

  static Future<List<Product>> getAll() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    final List<dynamic> data = jsonDecode(response.body);

    List<Product> products = [];

    for (var item in data) {
      Product product = Product.fromJson(item);
      products.add(product);
    }

    return products;
  }

  static Future<void> create(Product p) async {
    await http.post(
      Uri.parse("$baseUrl/products"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(p.toJson()),
    );
  }

  static Future<void> update(int id, Product p) async {
    await http.put(
      Uri.parse("$baseUrl/products/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(p.toJson()),
    );
  }

  static Future<void> delete(int id) async {
    await http.delete(Uri.parse("$baseUrl/products/$id"));
  }
}
