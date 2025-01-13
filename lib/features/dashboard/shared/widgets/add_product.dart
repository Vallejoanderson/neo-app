import 'package:flutter/material.dart';
import 'package:neo/features/dashboard/domain/product.dart';

class AddProduct extends StatefulWidget {
  final void Function(Product) onSave;

  const AddProduct({required this.onSave, super.key});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _categories = [
    {'id': 1, 'name': 'CFood'},
    {'id': 2, 'name': 'CClothes'},
    {'id': 3, 'name': 'COther'},
  ];

  final List<Map<String, dynamic>> _subcategories = [
    {'id': 4, 'name': 'SFood'},
    {'id': 5, 'name': 'SClothes'},
    {'id': 6, 'name': 'SOther'},
  ];

  final List<Map<String, dynamic>> _products = [
    {'id': 7, 'name': 'PFood'},
    {'id': 8, 'name': 'PClothes'},
    {'id': 9, 'name': 'POther'},
  ];

  int? _category;
  int? _subcategory;
  Map<String, dynamic>? _product;

  void onSave(Product product) {
    widget.onSave(product);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 93, 86, 86),
                offset: Offset(2, 2),
                spreadRadius: 2,
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Add Product",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CloseButton( color: Colors.blue ),
                    ),
                  ]
                ),
                const SizedBox(height: 8),
                const Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: DropdownButtonFormField<int>(
                    value: _category,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    isExpanded: true,
                    items: _categories.map((Map<String, dynamic> category) {
                      return DropdownMenuItem<int>(
                        value: category['id'],
                        child: Text(category['name']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _category = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select a category' : null,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Subcategory",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: DropdownButtonFormField<int>(
                    value: _subcategory,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    isExpanded: true,
                    items: _subcategories.map((Map<String, dynamic> subcategory) {
                      return DropdownMenuItem<int>(
                        value: subcategory['id'],
                        child: Text(subcategory['name']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _subcategory = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select a subcategory' : null,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Product",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: DropdownButtonFormField<Map<String, dynamic>>(
                    value: _product,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    isExpanded: true,
                    items: _products.map((Map<String, dynamic> product) {
                      return DropdownMenuItem<Map<String, dynamic>>(
                        value: product,
                        child: Text(product['name']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _product = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select a product' : null,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      onSave(Product(
                        categoryId: _category!,
                        subcategoryId: _subcategory!,
                        id: _product!['id'],
                        name: _product!['name'],
                        price: 0.0,
                      ));
                      // Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}