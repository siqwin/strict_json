part of strict_json;

class Json {

  final Object? _jsonObject;

  /// Create Json from the Object
  const Json(Object? jsonObject): _jsonObject = jsonObject;

  /// Convert Json to the JsonMap
  ///
  /// The [jsonObject] must be Map<String, dynamic> or String otherwise throw FormatException
  JsonMap asMap() {
    final json = _jsonObject;
    if (json is Map<String, dynamic>) {
      return JsonMap(json);
    } else if (json is String) {
      return Json(jsonDecode(json)).asMap();
    } else if (json == null) {
      return const JsonMap(null);
    } else if (json is JsonMap) {
      return json;
    } else {
      throw const FormatException("Json object is not map");
    }
  }

  /// Convert Json to the JsonList
  ///
  /// The [jsonObject] must be List<dynamic> or String otherwise throw FormatException
  JsonList asList() {
    final json = _jsonObject;
    if (json is List<dynamic>) {
      return JsonList(json);
    } else if (json is String) {
      return Json(jsonDecode(json)).asList();
    } else if (json == null) {
      return const JsonList(null);
    } else if (json is JsonList) {
      return json;
    } else {
      throw const FormatException("Json object is not list");
    }
  }

  /// Convert Json to the [String]
  ///
  /// The object must be String otherwise throw FormatException
  String asString() {
    final value = _jsonObject;
    if (value is String) {
      return value;
    } else {
      throw const FormatException("Object is not String");
    }
  }

  /// Convert Json to the [int]
  ///
  /// The object must be [int] otherwise throw FormatException
  int asInt() {
    final value = _jsonObject;
    if (value is int) {
      return value;
    } else {
      throw const FormatException("Object is not String");
    }
  }

  /// Convert Json to the [double]
  ///
  /// The object must be [double] otherwise throw FormatException
  double asDouble() {
    final value = _jsonObject;
    if (value is double) {
      return value;
    } else {
      throw const FormatException("Object is not String");
    }
  }

  /// Convert Json to the [bool]
  ///
  /// The object must be [bool] otherwise throw FormatException
  bool asBool() {
    final value = _jsonObject;
    if (value is bool) {
      return value;
    } else {
      throw const FormatException("Object is not String");
    }
  }

  /// Convert Json to the [num]
  ///
  /// The object must be [num] otherwise throw FormatException
  num asNum() {
    final value = _jsonObject;
    if (value is num) {
      return value;
    } else {
      throw const FormatException("Object is not String");
    }
  }

  /// Return Json source object
  Object? asObject() {
    return _jsonObject;
  }

}

