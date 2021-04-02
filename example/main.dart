import 'package:strict_json/strict_json.dart';

void main() {

  const json = """{
   "products": [
     { "id": 1, "name": "Product 1", "price": 2.5, "data": "optional data" },
     { "id": 2, "name": "Product 2", "price": 3.0, "stock": true }
   ]
 }""";

  final productList = const Json(json).asMap().getList("products").convertJsonMap((product) => Product.from(product)).toList();
  productList.forEach(print);

}

class Product {

  final int id;
  final String name;
  final double price;
  final String? data;
  final bool? stock;

  Product.from(JsonMap jsonMap):
      id = jsonMap.getInt("id"),
      name = jsonMap.getString("name"),
      price = jsonMap.getDouble("price"),
      stock = jsonMap.getBoolOr("stock", false),
      data = jsonMap.getStringOr("data");

  @override
  String toString() => "Product: $id, $name, $price, $data, $stock";

}