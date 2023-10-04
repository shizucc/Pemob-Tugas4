import 'package:flutter/material.dart';
import 'package:p3/model/product.dart';
import 'package:p3/ui/product_detail.dart';
import 'package:p3/ui/product_form.dart';

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
        title: Text("List Product"),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductForm()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.logout),
              onTap: () async {},
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            ItemProduct(
                product: Product(
                    kodeProduk: 'A001',
                    namaProduk: 'Kamera',
                    hargaProduk: 500000)),
            ItemProduct(
                product: Product(
                    kodeProduk: 'A002',
                    namaProduk: 'Kulkas',
                    hargaProduk: 500000)),
            ItemProduct(
                product: Product(
                    kodeProduk: 'A003',
                    namaProduk: 'Mesin Cuci',
                    hargaProduk: 500000)),
          ],
        ),
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  final Product product;
  const ItemProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(product.namaProduk!),
          subtitle: Text(product.hargaProduk.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(produk: product)));
      },
    );
  }
}
