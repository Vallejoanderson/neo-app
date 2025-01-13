
import 'package:flutter/material.dart';
import 'package:neo/features/dashboard/shared/widgets/custom_button.dart';
import 'package:neo/features/dashboard/shared/widgets/add_product.dart';
import 'package:neo/features/dashboard/shared/widgets/product_list.dart';
import 'package:neo/features/dashboard/domain/product.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  final List<Product> _products = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Neo')
        ),
        actions: [
          IconButton(
              icon: const Icon( Icons.refresh_rounded),
              onPressed: () {
                print('Updating');
              }
          )
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: ProductList(products: _products)),
            const Text(
              'Neo App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
            )
        ])
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.add,
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddProduct( onSave: (Product product) {
                  setState(() {
                    _products.add(product);
                  });
                });
              },
            ),
          ),
        ],
      )
    );
  }
}
