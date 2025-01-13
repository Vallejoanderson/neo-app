import 'package:flutter/material.dart';
import 'package:neo/features/dashboard/domain/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({required this.products, super.key});

  final List<Product> products;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.products[index].name, style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                  ]
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ]
            )
          ),
        );
      }
    );
  }
}