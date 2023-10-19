import 'package:flutter/material.dart';
import 'package:p3/model/produk.dart';
import 'package:p3/ui/produk_detail.dart';
import 'package:p3/ui/produk_form.dart';

class produkList extends StatefulWidget {
  const produkList({super.key});

  @override
  State<produkList> createState() => _produkListState();
}

class _produkListState extends State<produkList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List produk"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text("Alfi"),
          ),
          IconButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProdukForm()));
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
            ItemProduk(
                produk: Produk(
                    kodeProduk: 'A001',
                    namaProduk: 'Kamera',
                    hargaProduk: 500000)),
            ItemProduk(
                produk: Produk(
                    kodeProduk: 'A002',
                    namaProduk: 'Kulkas',
                    hargaProduk: 500000)),
            ItemProduk(
                produk: Produk(
                    kodeProduk: 'A003',
                    namaProduk: 'Mesin Cuci',
                    hargaProduk: 500000)),
          ],
        ),
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;
  const ItemProduk({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk!),
          subtitle: Text(produk.hargaProduk.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(produk: produk)));
      },
    );
  }
}
