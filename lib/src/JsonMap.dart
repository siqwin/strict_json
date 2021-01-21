part of strict_json;

class JsonMap {

  final Map<String, dynamic> _jsonMap;

  /// Create JsonMap from Map<String, dynamic>
  JsonMap(Map<String, dynamic> map):
    _jsonMap = map ?? const <String, dynamic>{};

  /// Returns int value by [key]
  ///
  /// If map not contains key or the value has a different type then throw FormatException
  int intValue(String key) {
    return numValue(key).toInt();
  }

  /// Returns int value by [key] or default value
  int intValueOr(String key, [int defaultValue]) {
    return numValueOr(key, defaultValue)?.toInt();
  }

  /// Returns string value by [key]
  ///
  /// If map not contains or the value has a different type then throw FormatException
  String stringValue(String key) {
    return _value(key, required: true);
  }

  /// Returns string value by [key] or default value
  String stringValueOr(String key, [String defaultValue]) {
    return _value(key, required: false, defaultValue: defaultValue);
  }

  /// Returns bool value by [key]
  ///
  /// If map not contains key or the value has a different type then throw FormatException
  bool boolValue(String key) {
    return _value(key, required: true);
  }

  /// Returns bool value by [key] or default value
  bool boolValueOr(String key, [bool defaultValue]) {
    return _value(key, required: false, defaultValue: defaultValue);
  }

  /// Returns double value by [key]
  ///
  /// If map not contains key or the value has a different type then throw FormatException
  double doubleValue(String key) {
    return numValue(key)?.toDouble();
  }

  /// Returns double value by [key] or default value
  double doubleValueOr(String key, [double defaultValue]) {
    return numValueOr(key, defaultValue)?.toDouble();
  }

  /// Returns num value by [key]
  ///
  /// If map not contains key or the value has a different type then throw FormatException
  num numValue(String key) {
    return _value(key, required: true);
  }

  /// Returns num value by [key] or default value
  num numValueOr(String key, [num defaultValue]) {
    return _value(key, required: false, defaultValue: defaultValue);
  }

  /// Returns true if map contains the given [key].
  bool containsKey(String key) {
    return _jsonMap.containsKey(key);
  }

  /// Returns JsonMap by [key]
  ///
  /// If map not contains key or the value is not a Map, then throw FormatException
  JsonMap getMap(String key) {
    return JsonMap(_getFromMap(key, true));
  }

  /// Returns JsonMap by [key] or default value
  JsonMap getMapOr(String key, [ Map<String, dynamic> defaultValue ]) {
    final Map<String, dynamic> value  = _getFromMap(key, false) ?? defaultValue;
    return value != null ? JsonMap(value) : null;
  }

  /// Returns JsonList by [key]
  ///
  /// If map not contains key or the value is not a List then throw FormatException
  JsonList getList(String key) {
    return JsonList(_getFromMap(key, true));
  }

  /// Returns JsonList by [key] or default value
  JsonList getListOr(String key, [ List<dynamic> defaultValue ]) {
    final List<dynamic> value  = _getFromMap(key, false) ?? defaultValue;
    return value != null ? JsonList(value) : null;
  }

  /// Returns Json by [key]
  ///
  /// If map not contains ket or the value is not Map or List then throw FormatException
  Json getJson(String key) {
    return Json(_getFromMap(key, true));
  }

  /// Returns Json by [key] or default value
  Json getJsonOr(String key, [ Object defaultValue ]) {
    return Json(_getFromMap(key, false) ?? defaultValue);
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

  T _value<T>(String key, { bool required = true, T defaultValue }) {
    return _getFromMap(key, required) ?? defaultValue;
  }

  T _getFromMap<T>(String key, bool required) {
    if (_jsonMap.containsKey(key)) {
      final dynamic data = _jsonMap[key];
      if (data is T) {
        return data;
      } else if (data == null && !required) {
        return null;
      } else {
        throw FormatException("The field '$key' has wrong type ('${T.toString()}' expected but '${data.runtimeType}' given)", data?.toString());
      }
    } else if (required) {
      throw FormatException("The field '$key' is null but required (expected '${T.toString()}')");
    } else {
      return null;
    }
  }

}