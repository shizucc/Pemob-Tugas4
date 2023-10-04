class Product {
  int? id;
  String? kodeProduk;
  String? namaProduk;
  int? hargaProduk;

  Product({this.id, this.kodeProduk, this.namaProduk, this.hargaProduk});

  factory Product.formJson(Map<String, dynamic> obj) {
    return Product(
      id: obj['id'],
      kodeProduk: obj['kodeProduk'],
      namaProduk: obj['namaProduk'],
      hargaProduk: obj['hargaProduk'],
    );
  }
}
