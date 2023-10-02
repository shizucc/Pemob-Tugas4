import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("List Produk"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Text("Hello"),
            )
          ],
        ),
      ),
    );
  }
}
