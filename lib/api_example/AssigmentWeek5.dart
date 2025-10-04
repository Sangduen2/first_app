import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Assigmentweek5 extends StatefulWidget {
  const Assigmentweek5({super.key});

  @override
  State<Assigmentweek5> createState() => _Assigmentweek5State();
}

class _Assigmentweek5State extends State<Assigmentweek5> {
  List<Product> listProduct = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // =================== FETCH ===================
  Future<void> fetchData() async {
    try {
      var response =
          await http.get(Uri.parse('http://localhost:8001/products'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          listProduct = jsonList.map((e) => Product.fromJson(e)).toList();
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  // =================== CREATE ===================
  Future<void> createProduct() async {
    try {
      var response = await http.post(
          Uri.parse("http://localhost:8001/products"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": "iPhone 5s",
            "description": "Apple smartphone",
            "price": 21999.00
          }));
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Create Success!'),
          backgroundColor: Colors.green,
        ));
        fetchData();
      } else {
        throw Exception("Failed to create product");
      }
    } catch (e) {
      print(e);
    }
  }

  // =================== UPDATE ===================
  Future<void> updateProduct(
      {required String id,
      required String name,
      required String description,
      required double price}) async {
    try {
      var response = await http.put(
          Uri.parse("http://localhost:8001/products/$id"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              {"name": name, "description": description, "price": price}));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Update Success!'),
          backgroundColor: Colors.blue,
        ));
        fetchData();
      } else {
        throw Exception("Failed to update product");
      }
    } catch (e) {
      print(e);
    }
  }

  // =================== DELETE ===================
  Future<void> deleteProduct({required String idDelete}) async {
    try {
      var response = await http
          .delete(Uri.parse("http://localhost:8001/products/$idDelete"));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Delete Success!'),
          backgroundColor: Colors.red,
        ));
        fetchData();
      } else {
        throw Exception("Failed to delete product");
      }
    } catch (e) {
      print(e);
    }
  }

  // =================== FORM DIALOG ===================
  void showProductForm({Product? product}) {
    final nameController = TextEditingController(text: product?.name ?? '');
    final descController =
        TextEditingController(text: product?.description ?? '');
    final priceController = TextEditingController(text: product?.price ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(product == null ? 'Create Product' : 'Edit Product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'Description')),
            TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              if (product == null) {
                createProduct();
              } else {
                updateProduct(
                  id: product.id,
                  name: nameController.text,
                  description: descController.text,
                  price: double.tryParse(priceController.text) ?? 0,
                );
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Product'),
      ),
      body: ListView.separated(
        itemCount: listProduct.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final p = listProduct[index];
          return ListTile(
            leading: Text('${p.id}'),
            title: Text(p.name),
            subtitle: Text(p.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${p.price}'),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: () => createProduct(),
                  tooltip: 'POST',
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => showProductForm(product: p),
                  tooltip: 'PUT',
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteProduct(idDelete: p.id),
                  tooltip: 'DELETE',
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// =================== MODEL ===================
class Product {
  final String id;
  final String name;
  final String description;
  final String price;

  Product(this.id, this.name, this.description, this.price);

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        json['id'].toString(),
        json['name'],
        json['description'],
        json['price'].toString(),
      );
}
