import 'package:flutter/material.dart';
import 'Model/product.dart';
import 'product_service.dart';

class ProductForm extends StatefulWidget {
  final Product? product;
  const ProductForm({super.key, this.product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late final _name = TextEditingController(text: widget.product?.name ?? '');
  late final _desc = TextEditingController(
    text: widget.product?.description ?? '',
  );
  late final _price = TextEditingController(
    text: widget.product?.price.toString() ?? '',
  );

  bool isEditing() {
    if (widget.product != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> save() async {
    if (_formKey.currentState!.validate() == false) {
      return;
    }

    Product product = Product(
      name: _name.text,
      description: _desc.text,
      price: double.parse(_price.text),
    );

    if (isEditing()) {
      await ProductService.update(widget.product!.id!, product);
    } else {
      await ProductService.create(product);
    }

    String message = "";
    if (isEditing()) {
      message = "แก้ไขสำเร็จ";
    } else {
      message = "เพิ่มสำเร็จ";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    String titleText = "";
    if (isEditing()) {
      titleText = "แก้ไขสินค้า";
    } else {
      titleText = "เพิ่มสินค้า";
    }

    String buttonText = "";
    if (isEditing()) {
      buttonText = "บันทึก";
    } else {
      buttonText = "เพิ่มสินค้า";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  labelText: "ชื่อสินค้า",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "กรุณากรอกชื่อ";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _desc,
                decoration: InputDecoration(
                  labelText: "รายละเอียด",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _price,
                decoration: InputDecoration(
                  labelText: "ราคา",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "กรุณากรอกราคา";
                  }
                  if (double.tryParse(value) == null) {
                    return "กรุณากรอกตัวเลขที่ถูกต้อง";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(buttonText, style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
