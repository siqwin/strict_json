part of strict_json;

extension JsonListExtensions on List<dynamic> {
  JsonList toJsonList() => JsonList(this);
}

extension JsonMapExtensions on Map<String, dynamic> {
  JsonMap toJsonMap() => JsonMap(this);
}

extension JsonStringExtensions on String {
  JsonList toJsonList() => Json(this).asList();
  JsonMap toJsonMap() => Json(this).asMap();
}
