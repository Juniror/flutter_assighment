import 'package:flutter/material.dart';
import 'Model/product.dart';
import 'product_service.dart';
import 'product_form.dart';

class Manager extends StatefulWidget {
  const Manager({super.key});

  @override
  State<Manager> createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final loadedProducts = await ProductService.getAll();
      setState(() {
        products = loadedProducts;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> deleteProduct(int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("ยืนยันการลบ"),
        content: Text("คุณต้องการลบสินค้านี้หรือไม่?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text("ยกเลิก"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text("ลบ", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await ProductService.delete(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("ลบสินค้าสำเร็จ"),
          backgroundColor: Colors.green,
        ),
      );
      loadProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product p = products[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              child: Text("${p.id}"),
            ),
            title: Text(p.name, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(p.description ?? ""),
            trailing: Text(
              "${p.price}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductForm(product: p);
                  },
                ),
              );

              if (result == true) {
                loadProducts();
              }
            },
            onLongPress: () {
              deleteProduct(p.id!);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductForm();
              },
            ),
          );

          if (result == true) {
            loadProducts();
          }
        },
      ),
    );
  }
}
