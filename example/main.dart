import 'package:strict_json/strict_json.dart';

void main() {
  const String json = """{
    "products": [
      { "id": 1, "name": "Product 1", "price": 2.5, "data": "optional data" },
      { "id": 2, "name": "Product 2", "price": 3.0, "stock": true }
    ]
  }""";

  final productList = const Json(json).asMap().getJsonList("products").convertJsonMap((it) => Product(it)).toList();
  // ignore: avoid_print
  print(productList);
}

class Product {

  final int id;
  final String name;
  final double price;
  final String? data;
  final bool inStock;

  Product(JsonMap data):
    id = data.getInt("id"),
    name = data.getString("name"),
    price = data.getDouble("price"),
    inStock = data.getBool("stock", false),
    data = data.getStringOr("data");

  @override
  String toString() => "Product(id: $id, name: $name, price: $price, data: $data, inStock: $inStock)";

}