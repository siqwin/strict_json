part of strict_json;

class JsonMap {

  final Map<String, dynamic> _jsonMap;

  /// Create JsonMap from Map<String, dynamic>
  const JsonMap(Map<String, dynamic>? map):
    _jsonMap = map ?? const <String, dynamic>{};

  /// Returns int value by [key]
  ///
  /// If map not contains key or the value has a different type then throw FormatException
  int getInt(String key) {
    return _value(key);
  }

  /// Returns int value by [key] or default value
  int? getIntOr(String key, [int? defaultValue]) {
    return _valueOr(key, defaultValue);
  }

  /// Returns string value by [key]
  ///
  /// If map not contains or the value has a different type then throw FormatException
  String getString(String key) {
    return _value(key);
  }

  /// Returns string value by [key] or default value
  String? getStringOr(String key, [String? defaultValue]) {
    return _valueOr(key, defaultValue);
  }

  /// Returns bool value by [key]
  ///
  /// If map not contains key or the value has a different type then throw FormatException
  bool getBool(String key) {
    return _value(key);
  }

  /// Returns bool value by [key] or default value
  bool? getBoolOr(String key, [bool? defaultValue]) {
    return _valueOr(key, defaultValue);
  }

  /// Returns double value by [key]
  ///
  /// If map not contains key or the value has a different type then throw FormatException
  double getDouble(String key) {
    return _value(key);
  }

  /// Returns double value by [key] or default value
  double? getDoubleOr(String key, [double? defaultValue]) {
    return _valueOr(key, defaultValue)?.toDouble();
  }

  /// Returns num value by [key]
  ///
  /// If map not contains key or the value has a different type then throw FormatException
  num getNum(String key) {
    return _value(key);
  }

  /// Returns num value by [key] or default value
  num? getNumOr(String key, [num? defaultValue]) {
    return _valueOr(key, defaultValue);
  }

  /// Returns JsonMap by [key]
  ///
  /// If map not contains key or the value is not a Map, then throw FormatException
  JsonMap getMap(String key) {
    return JsonMap(_value(key));
  }

  /// Returns JsonMap by [key] or default value
  JsonMap? getMapOr(String key, [ Map<String, dynamic>? defaultValue ]) {
    final Map<String, dynamic>? value  = _valueOr(key, defaultValue);
    return value != null ? JsonMap(value) : null;
  }

  /// Returns JsonList by [key]
  ///
  /// If map not contains key or the value is not a List then throw FormatException
  JsonList getList(String key) {
    return JsonList(_value(key));
  }

  /// Returns JsonList by [key] or default value
  JsonList? getListOr(String key, [ List<dynamic>? defaultValue ]) {
    final List<dynamic>? value  = _valueOr(key, defaultValue);
    return value != null ? JsonList(value) : null;
  }

  /// Returns Json by [key]
  ///
  /// If map not contains key or the value is not Map or List then throw FormatException
  Json getJson(String key) {
    return Json(_value(key));
  }

  /// Returns Json by [key] or default value
  Json? getJsonOr(String key, [ Object? defaultValue ]) {
    final value = _valueOr(key, defaultValue);
    return value != null ? Json(value) : null;
  }

  /// Returns true if map contains the given [key].
  /// If a generic parameter is specified, then the value is also checked against the type of the parameter.
  bool contains<T>(String key) {
    final result = _jsonMap.containsKey(key);
    return result && _jsonMap[key] is T;
  }

  /// Convert JsonMap with converter.
  T convert<T>(T Function(JsonMap jsonMap) converter) {
    return converter(this);
  }

  /// Iterate by keys and convert items
  Iterable<T> convertEach<T>(T Function(String key, JsonMap jsonMap) converter) {
    return _jsonMap.keys.map((key) => converter(key, this));
  }

  /// All keys of this map
  Iterable<String> get keys => _jsonMap.keys;

  /// Cast source of the JsonMap
  Map<RK, RV> cast<RK, RV>() {
    return _jsonMap.cast<RK, RV>();
  }

  /// Returns source of the JsonMap
  Map<String, dynamic> toMap() => _jsonMap;

  /// Returns string representation of the map
  String toJsonString() => jsonEncode(_jsonMap);

  T _value<T>(String key) {
    if (_jsonMap.containsKey(key)) {
      final Object? data = _jsonMap[key];
      if (data is T) {
        return data;
      } else {
        throw FormatException("The field '$key' has wrong type ('${T.toString()}' expected but '${data.runtimeType}' given)", data?.toString());
      }
    } else {
      throw FormatException("The field '$key' is null but required (expected '${T.toString()}')");
    }
  }

  T _valueOr<T>(String key, T defaultValue) {
    if (_jsonMap.containsKey(key)) {
      final Object? data = _jsonMap[key];
      if (data is T) {
        return data;
      } else if (data != null) {
        print("Warning: The field '$key' has wrong type ('${T.toString()}' expected but '${data.runtimeType}' given)");
      }
    }
    return defaultValue;
  }

}