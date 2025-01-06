
import 'package:flutter/material.dart';
import 'package:neo/features/dashboard/shared/widgets/custom_button.dart';
import 'package:neo/features/dashboard/shared/widgets/add_product.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
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
                return AddProduct();
              },
            ),
          ),
        ],
      )
    );
  }
}
