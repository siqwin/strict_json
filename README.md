# strict_json

The package provides strictly parse json data.

## Example

```import 'package:strict_json/strict_json.dart';

void main() {

  const json = """{
    "products": [
      { "id": 1, "name": "Product 1", "price": 2.5, "data": "optional data" },
      { "id": 2, "name": "Product 2", "price": 3.0, "stock": true }
    ]
  }""";

  final productList = Json(json).asMap().getList("products").convertJsonMap((product) => Product.fromJson(product)).toList();
  productList.forEach(print);

}

class Product {

  final int id;
  final String name;
  final double price;
  final String data;
  final bool stock;

  Product.fromJson(JsonMap json):
    id = json.intValue("id"),
    name = json.stringValue("name"),
    price = json.doubleValue("price"),
    stock = json.boolValueOr("stock", false),
    data = json.stringValueOr("data");

  @override
  String toString() => "Product: $id, $name, $price, $data, $stock";

}```